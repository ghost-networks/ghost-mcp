# Ghost Networks MCP Server

**Private, Programmable Networking for the AI Age.**

Manage your [Ghost Networks](https://gh-o.net) private mesh (WireGuard-grade encryption) from any MCP client — Claude, Cursor, Codex, Gemini, Windsurf and others. Create networks, add and revoke devices, organize Phantom Hubs, issue Helbind Keys and BiFrost Passes, run Ghost VPN servers and route traffic through exit nodes, all in natural language.

The MCP server is built into the Ghost CLI (`ghost-cli mcp`): a single signed binary, no runtime or extra packages.

## Requirements

A Ghost Networks **Enterprise** plan (CLI, or CLI, API & VPN Server) and its API key. Plans start with a **first month for $9.90** — see [gh-o.net/pricing](https://gh-o.net/pricing/).

## Install

### Option 1 — MCP bundle (`.mcpb`)

Download the bundle for your platform from the [latest release](https://github.com/habloapp/ghost-mcp/releases/latest), open it in your MCP client (e.g. Claude Desktop) and paste your API key when asked.

### Option 2 — Ghost CLI

macOS / Linux:

```bash
curl -fsSL https://gh-o.net/d/cli/install.sh | bash
# or
brew install habloapp/ghost/ghost-cli
```

Windows (PowerShell as Administrator):

```powershell
irm https://gh-o.net/d/cli/install.ps1 | iex
```

Then add the server to your MCP client configuration:

```json
{
  "mcpServers": {
    "ghost": {
      "command": "ghost-cli",
      "args": ["mcp"],
      "env": { "GHOST_API_KEY": "<your-api-key>" }
    }
  }
}
```

On the first tool call the CLI registers itself with your API key and stores its credentials locally (`~/.ghost-cli/config.json`). You can also run `ghost-cli init <your-api-key>` once instead of setting `GHOST_API_KEY`.

## Tools

41 tools covering networks, devices, Phantom Hubs, Helbind Keys, BiFrost Passes, Ghost VPN, roles and exit nodes. Full list with parameters: [TOOLS.md](TOOLS.md) (generated with `ghost-cli mcp --list-tools`).

Listing tools (`tools/list`) works without an API key, so you can inspect the server before subscribing.

## Security

- All operations go through the same end-to-end encrypted API channel as the Ghost CLI.
- Your API key and device keys stay on your machine.

## Support

[gh-o.net/support](https://gh-o.net/support/)

---

Ghost Networks™ is a trademark of HabloApp Inc. BiFrost Pass*, Phantom Hubs* and Helbind Keys* are patent-pending technologies.
