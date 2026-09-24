#!/bin/sh
set -eu

PORT="${PORT:-8000}"
MCP_SESSION_TIMEOUT="${MCP_SESSION_TIMEOUT:-300000}"

exec ./node_modules/.bin/supergateway --stdio "node dist/index.js" \
  --outputTransport streamableHttp \
  --port "$PORT" \
  --streamableHttpPath /mcp \
  --stateful \
  --sessionTimeout "$MCP_SESSION_TIMEOUT" \
  --cors \
  --healthEndpoint /health
