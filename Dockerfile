# Use a small, official Node runtime
FROM node:20-alpine

# Set working directory inside the container
WORKDIR /app

# Copy only package files first (better layer caching)
COPY package*.json ./

# Install dependencies (this layer only rebuilds if package.json changes)
RUN npm install --production

# Now copy the rest of the source code
COPY . .

# Document which port the app uses (doesn't actually publish it)
EXPOSE 3000

# Basic container-level health check, mirrors our /health route
HEALTHCHECK --interval=30s --timeout=3s \
  CMD wget --no-verbose --tries=1 --spider http://localhost:3000/health || exit 1

CMD ["npm", "start"]