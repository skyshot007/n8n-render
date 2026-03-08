# 1. Start with the official n8n image
FROM docker.n8n.io/n8nio/n8n:latest

# 2. Switch to the root user so we have permission to install things
USER root

# 3. Install your custom npm packages globally
RUN npm install -g technicalindicators

# (Optional) If you want to add more packages later, just add them to the line above:
# RUN npm install -g technicalindicators axios cheerio

# 4. Switch back to the safe 'node' user that n8n requires
USER node
