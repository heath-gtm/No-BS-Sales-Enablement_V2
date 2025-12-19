# Multi-stage Dockerfile (generic)
# - If this repo contains a Node.js app with a build step (npm run build)
#   the builder stage will run it and copy `dist/` to the nginx static server.
# - Otherwise the entire repo will be served from nginx (useful for static sites).

# Builder: use Node to install and build if package.json exists
FROM node:18-alpine AS builder
WORKDIR /app
# Copy package files first to leverage cache if present
COPY package*.json ./
RUN if [ -f package.json ]; then npm ci --silent; fi
COPY . .
# Run build if script present
RUN if [ -f package.json ]; then npm run build --if-present; fi

# Runner: serve built files with nginx
FROM nginx:stable-alpine AS runner
# Remove default content
RUN rm -rf /usr/share/nginx/html/*
# Prefer a build output (dist), else copy entire repo
COPY --from=builder /app/dist /usr/share/nginx/html/
COPY --from=builder /app /usr/share/nginx/html/

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
