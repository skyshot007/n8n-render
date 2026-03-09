# 1. Start with the official n8n image
FROM docker.n8n.io/n8nio/n8n:latest

# 2. Switch to the root user so we have permission to install things
USER root

# 3. Install the package globally (This avoids the n8n 'catalog' conflict)
RUN npm install -g technicalindicators

# 4. Tell Node.js exactly where global packages are stored
ENV NODE_PATH=/usr/local/lib/node_modules

# 5. Switch back to the safe 'node' user that n8n requires
USER node
