FROM node:20-slim

WORKDIR /app

COPY package*.json ./
RUN npm install --omit=dev

COPY tsconfig.json ./
COPY src ./src
COPY scripts ./scripts
RUN npm install typescript --no-save && npx tsc

# supergateway bridges this stdio MCP server to SSE/HTTP so Claude.ai can reach it remotely
RUN npm install -g supergateway

ENV PORT=8000
EXPOSE 8000

CMD sh -c "supergateway --stdio \"node dist/index.js\" --port $PORT --baseUrl https://\$RAILWAY_PUBLIC_DOMAIN --ssePath /sse --messagePath /message --cors --healthEndpoint /health"
