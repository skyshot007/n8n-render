# 1. Start with the official n8n image
FROM docker.n8n.io/n8nio/n8n:latest

# 2. Switch to the root user so we have permission to install things
USER root

# 3. Move directly into n8n's internal installation directory
WORKDIR /usr/local/lib/node_modules/n8n

# 4. Install the package locally (Notice we removed the -g flag!)
RUN npm install technicalindicators

# 5. Switch back to the safe 'node' user that n8n requires
USER node
