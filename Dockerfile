FROM node:20-slim

WORKDIR /app

COPY package*.json ./
COPY scripts ./scripts
COPY tsconfig.json ./
COPY src ./src

RUN npm install
RUN npm prune --omit=dev

# supergateway bridges this stdio MCP server to SSE/HTTP so Claude.ai can reach it remotely
RUN npm install -g supergateway

ENV PORT=8000
EXPOSE 8000

COPY start.sh ./
RUN chmod +x start.sh
CMD ["./start.sh"]
