FROM node:24-slim

WORKDIR /app

COPY package*.json ./
COPY scripts ./scripts
COPY tsconfig.json ./
COPY src ./src

RUN npm ci
RUN npm prune --omit=dev

ENV PORT=8000
EXPOSE 8000

COPY start.sh ./
RUN chmod +x start.sh
CMD ["./start.sh"]
