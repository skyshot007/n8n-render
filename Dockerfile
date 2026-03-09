# 1. Start with the official n8n image
FROM docker.n8n.io/n8nio/n8n:latest

# 2. Switch to root to install OS-level packages
USER root

# 3. Update package lists and install Python, Pandas, and Requests (Debian style)
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-pandas python3-requests && \
    rm -rf /var/lib/apt/lists/*

# 4. Install the Python Technical Analysis (ta) library globally
RUN pip3 install ta --break-system-packages

# 5. Switch back to the safe 'node' user
USER node
