"""JSON-RPC 2.0 helpers."""


def jsonrpc_success(id, result):
    return {"jsonrpc": "2.0", "id": id, "result": result}


def jsonrpc_error(id, code, message):
    return {"jsonrpc": "2.0", "id": id, "error": {"code": code, "message": message}}


def tool_result_content(text):
    return [{"type": "text", "text": text}]
