"""FastAPI HTTP entry point — Docker / local deployment."""

import os
import logging
from fastapi import FastAPI, Request
from fastapi.responses import JSONResponse
from .dispatch import dispatch
from .protocol import jsonrpc_error

logger = logging.getLogger(__name__)

app = FastAPI(title="GRC Platform MCP Server")


@app.post("/mcp")
async def mcp_endpoint(request: Request):
    try:
        body = await request.json()
        response = dispatch(body)
        return JSONResponse(content=response)
    except Exception:
        logger.exception("Unhandled error in MCP endpoint")
        req_id = None
        try:
            req_id = body.get("id")
        except Exception:
            pass
        return JSONResponse(
            content=jsonrpc_error(req_id, -32603, "Internal error"),
            status_code=500,
        )


@app.get("/health")
async def health():
    return {"status": "ok"}


if __name__ == "__main__":
    import uvicorn
    port = int(os.environ.get("PORT", 8080))
    uvicorn.run("server:app", host="0.0.0.0", port=port, reload=False)
