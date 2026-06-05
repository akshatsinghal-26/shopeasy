# ─── Stage 1: Builder ─────────────────────────────────────────────────────────
FROM node:18-alpine AS builder

WORKDIR /app

COPY package.json ./

RUN npm install --omit=dev

# ─── Stage 2: Production Image ────────────────────────────────────────────────
FROM node:18-alpine AS production

WORKDIR /app

COPY --from=builder /app/node_modules ./node_modules

COPY server.js ./
COPY package.json ./

EXPOSE 3003

USER node

CMD ["node", "server.js"]
