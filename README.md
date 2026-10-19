# Ghost Networks MCP Server

**Private, Programmable Networking for the AI Age.**

Manage your [Ghost Networks](https://gh-o.net) private mesh (WireGuard-grade encryption) from any MCP client — Claude, Cursor, Codex, Gemini, Windsurf and others. Create networks, add and revoke devices, organize Phantom Hubs, issue Helbind Keys and BiFrost Passes, run Ghost VPN servers and route traffic through exit nodes, all in natural language.

The MCP server is built into the Ghost CLI (`ghost-cli mcp`): a single signed binary, no runtime or extra packages.

## Requirements

A Ghost Networks **Enterprise** plan (CLI, or CLI, API & VPN Server) and its API key. Plans start with a **first month for $9.90** — see [gh-o.net/pricing](https://gh-o.net/pricing/).

## Install

**1. Install the Ghost CLI** (it contains the MCP server). Skip this step if you use the `.mcpb` bundle.

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

**2. Add it to your client:**

[![Install in Cursor](https://cursor.com/deeplink/mcp-install-dark.svg)](https://cursor.com/en/install-mcp?name=ghost&config=eyJjb21tYW5kIjoiZ2hvc3QtY2xpIiwiYXJncyI6WyJtY3AiXSwiZW52Ijp7IkdIT1NUX0FQSV9LRVkiOiI8eW91ci1hcGkta2V5PiJ9fQ%3D%3D) [![Install in VS Code](https://img.shields.io/badge/VS_Code-Install_Server-0098FF?style=flat-square&logo=visualstudiocode&logoColor=white)](https://vscode.dev/redirect/mcp/install?name=ghost&inputs=%5B%7B%22id%22%3A%22ghost_api_key%22%2C%22type%22%3A%22promptString%22%2C%22description%22%3A%22Ghost%20Networks%20API%20key%22%2C%22password%22%3Atrue%7D%5D&config=%7B%22command%22%3A%22ghost-cli%22%2C%22args%22%3A%5B%22mcp%22%5D%2C%22env%22%3A%7B%22GHOST_API_KEY%22%3A%22%24%7Binput%3Aghost_api_key%7D%22%7D%7D)

| Client | How |
|---|---|
| Claude Desktop | Download the `.mcpb` bundle for your platform from the [latest release](https://github.com/ghost-networks/ghost-mcp/releases/latest), open it and paste your API key. No CLI needed. |
| Claude Code (plugin) | `/plugin install ghost --marketplace ghost-networks/ghost-mcp` (with `GHOST_API_KEY` set in your shell, or after `ghost-cli init <your-api-key>`) |
| Claude Code (CLI) | `claude mcp add ghost -e GHOST_API_KEY=<your-api-key> -- ghost-cli mcp` |
| Codex | `codex mcp add ghost --env GHOST_API_KEY=<your-api-key> -- ghost-cli mcp` |
| Gemini CLI | `gemini extensions install https://github.com/ghost-networks/ghost-mcp` (asks for your API key) |
| Cursor | Button above, then replace `<your-api-key>` |
| VS Code | Button above (asks for your API key) |
| Windsurf and others | Add the JSON below to the client's MCP configuration |

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
