FROM golang:1.24-alpine AS proxy-builder
RUN apk add --no-cache git
RUN git clone https://github.com/nielspeter/claude-code-proxy.git /proxy && \
    cd /proxy && \
    go mod download && \
    go build -o /usr/local/bin/claude-code-proxy cmd/claude-code-proxy/main.go

FROM docker:27-dind
RUN apk add --no-cache \
    nodejs \
    npm \
    git \
    openssh-client \
    curl \
    bash

COPY --from=proxy-builder /usr/local/bin/claude-code-proxy /usr/local/bin/claude-code-proxy

RUN npm install -g @anthropic-ai/claude-code

RUN git config --global user.name "claude-code" && \
    git config --global user.email "claude@local"

WORKDIR /workspace

ENV DOCKER_TLS_CERTDIR=""
ENV ANTHROPIC_BASE_URL=http://localhost:8082
ENV ANTHROPIC_API_KEY=dummy

RUN printf '#!/bin/bash\nclaude-code-proxy &\nexec dockerd-entrypoint.sh\n' > /entrypoint.sh && \
    chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
