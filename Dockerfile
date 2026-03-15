FROM docker:27-dind

RUN apk add --no-cache \
    nodejs \
    npm \
    git \
    openssh-client \
    curl \
    bash \
    go

RUN npm install -g @anthropic-ai/claude-code

RUN git clone https://github.com/nielspeter/claude-code-proxy.git /proxy && \
    cd /proxy && \
    go build -o /usr/local/bin/claude-code-proxy ./cmd/claude-code-proxy/

WORKDIR /workspace

ENV DOCKER_TLS_CERTDIR=""
ENV ANTHROPIC_BASE_URL=http://localhost:8082
ENV ANTHROPIC_API_KEY=dummy

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
