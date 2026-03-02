"""AWS Lambda entry point — wraps dispatch in API Gateway proxy response format."""

import hmac
import json
import os
from .dispatch import dispatch

_API_KEY = os.environ.get("API_KEY", "")


def handler(event, context):
    # API key check (skipped if API_KEY env var is not set)
    if _API_KEY:
        headers = event.get("headers") or {}
        provided = headers.get("x-api-key", "")
        if not hmac.compare_digest(provided, _API_KEY):
            return {
                "statusCode": 403,
                "headers": {"Content-Type": "application/json"},
                "body": json.dumps({"error": "Forbidden"}),
            }

    try:
        body = json.loads(event.get("body") or "{}")
    except (json.JSONDecodeError, TypeError):
        return {
            "statusCode": 400,
            "headers": {"Content-Type": "application/json"},
            "body": json.dumps({"error": "Invalid JSON body"}),
        }

    response = dispatch(body)

    return {
        "statusCode": 200,
        "headers": {"Content-Type": "application/json"},
        "body": json.dumps(response),
    }
