#!/bin/sh
exec supergateway --stdio "node dist/index.js" \
  --outputTransport streamableHttp \
  --port "$PORT" \
  --streamableHttpPath /mcp \
  --stateful \
  --cors \
  --healthEndpoint /health
