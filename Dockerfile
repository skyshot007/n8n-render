# 1. Start with the official n8n image
FROM docker.n8n.io/n8nio/n8n:latest

# 2. Switch to root to bypass permissions
USER root

# 3. THE FIX: n8n deleted 'apk' in v2.1+. We must manually bootstrap it back in.
RUN wget https://gitlab.alpinelinux.org/api/v4/projects/5/packages/generic/v2.14.4/x86_64/apk.static && \
    chmod +x apk.static && \
    ./apk.static -X http://dl-cdn.alpinelinux.org/alpine/v3.22/main -U --allow-untrusted --initdb add apk-tools && \
    rm apk.static

# 4. Now that apk is restored, we can install Python and Pandas!
RUN apk add --no-cache python3 py3-pip py3-pandas py3-requests

# 5. Install the Python Technical Analysis (ta) library globally
RUN pip3 install ta --break-system-packages

# 6. Switch back to the safe 'node' user that n8n requires
USER node
