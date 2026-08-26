#!/bin/sh
exec supergateway --stdio "node dist/index.js" \
  --port "$PORT" \
  --baseUrl "https://$RAILWAY_PUBLIC_DOMAIN" \
  --ssePath /sse \
  --messagePath /message \
  --cors \
  --healthEndpoint /health
