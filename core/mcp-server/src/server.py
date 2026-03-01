"""FastAPI HTTP entry point — Docker / local deployment."""

import os
from fastapi import FastAPI, Request
from fastapi.responses import JSONResponse
from .dispatch import dispatch

app = FastAPI(title="GRC Platform MCP Server")


@app.post("/mcp")
async def mcp_endpoint(request: Request):
    body = await request.json()
    response = dispatch(body)
    return JSONResponse(content=response)


@app.get("/health")
async def health():
    return {"status": "ok"}


if __name__ == "__main__":
    import uvicorn
    port = int(os.environ.get("PORT", 8080))
    uvicorn.run("server:app", host="0.0.0.0", port=port, reload=False)
