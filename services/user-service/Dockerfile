# ─── Stage 1: Builder ─────────────────────────────────────────────────────────
# We use a full Node image to install dependencies
FROM node:18-alpine AS builder

# Set working directory inside container
WORKDIR /app

# Copy package files first (Docker cache optimization)
# If package.json hasn't changed, Docker reuses the cached layer
COPY package.json ./

# Install only production dependencies
RUN npm install --omit=dev

# ─── Stage 2: Production Image ────────────────────────────────────────────────
# Start fresh with a clean minimal image
FROM node:18-alpine AS production

# Set working directory
WORKDIR /app

# Copy installed dependencies from builder stage
COPY --from=builder /app/node_modules ./node_modules

# Copy application source code
COPY server.js ./
COPY package.json ./

# Expose the port this service runs on
EXPOSE 3001

# Security: run as non-root user (node user comes with node:alpine)
USER node

# Start the application
CMD ["node", "server.js"]
