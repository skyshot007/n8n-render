# 1. Start with the official n8n image
FROM docker.n8n.io/n8nio/n8n:latest

# 2. Switch to root to install OS-level packages
USER root

# 3. Install Python, pre-compiled Pandas, and Requests (fast and safe for Alpine Linux)
RUN apk add --no-cache python3 py3-pip py3-pandas py3-requests

# 4. Install the Python Technical Analysis (ta) library globally
RUN pip3 install ta --break-system-packages

# 5. Switch back to the safe 'node' user
USER node
