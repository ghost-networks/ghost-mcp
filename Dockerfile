# Container that runs the Ghost MCP server over stdio.
# Used by Glama's health check (it must start and answer MCP introspection).
# tools/list works without a key; real calls need GHOST_API_KEY (Enterprise).
FROM debian:bookworm-slim
ARG GHOST_CLI_VERSION=0.40.0
ARG TARGETARCH
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates curl \
 && ARCH=$([ "$TARGETARCH" = "arm64" ] && echo linux-arm64 || echo linux-x64) \
 && curl -fsSL "https://ghost-pull-zone.b-cdn.net/d/cli/${GHOST_CLI_VERSION}/${ARCH}/ghost-cli" -o /usr/local/bin/ghost-cli \
 && chmod +x /usr/local/bin/ghost-cli \
 && apt-get purge -y curl && apt-get autoremove -y && rm -rf /var/lib/apt/lists/*
LABEL io.modelcontextprotocol.server.name="net.gh-o/ghost-mcp"
ENV GHOST_API_KEY=""
ENTRYPOINT ["ghost-cli", "mcp"]
