"""MCP JSON-RPC method routing."""

from .protocol import jsonrpc_success, jsonrpc_error
from .tools import ALL_TOOLS
from .handlers import TOOL_DISPATCH

SERVER_INFO = {
    "name": "grc-platform-mcp",
    "version": "0.1.0",
}

CAPABILITIES = {
    "tools": {},
}


def dispatch(request: dict) -> dict:
    method = request.get("method")
    req_id = request.get("id")
    params = request.get("params", {})

    if method == "initialize":
        return jsonrpc_success(req_id, {
            "protocolVersion": "2024-11-05",
            "serverInfo": SERVER_INFO,
            "capabilities": CAPABILITIES,
        })

    if method == "tools/list":
        return jsonrpc_success(req_id, {"tools": ALL_TOOLS})

    if method == "tools/call":
        tool_name = params.get("name")
        arguments = params.get("arguments", {})

        handler = TOOL_DISPATCH.get(tool_name)
        if handler is None:
            return jsonrpc_error(req_id, -32601, f"Unknown tool: {tool_name}")

        try:
            content = handler(arguments)
            return jsonrpc_success(req_id, {"content": content})
        except Exception as exc:
            return jsonrpc_error(req_id, -32603, str(exc))

    return jsonrpc_error(req_id, -32601, f"Method not found: {method}")
