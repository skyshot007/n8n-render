# 1. Start with the official n8n image
FROM docker.n8n.io/n8nio/n8n:latest

# 2. Switch to root just to set up folder permissions
USER root

# 3. Create the local n8n data folder and give the 'node' user full ownership
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n

# 4. Switch back to the safe 'node' user
USER node

# 5. Move into that safe local data folder
WORKDIR /home/node/.n8n

# 6. Install the library directly (skipping the init command to avoid the naming error!)
RUN npm install technicalindicators
