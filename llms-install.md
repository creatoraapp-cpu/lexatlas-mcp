# Installing LexAtlas MCP (instructions for an AI agent)

LexAtlas is a REMOTE MCP server. Nothing is installed locally: no package, no clone, no build, no runtime.

## 1. Server

- Address: `https://api.lexatlas.creatora.app/mcp`
- Transport: Streamable HTTP
- Authentication, one of:
  - OAuth 2.1 sign-in (discovery, dynamic client registration, PKCE S256), if the client supports it;
  - an API key sent on every request in the header `X-API-Key: lxa_...` (or `Authorization: Bearer lxa_...`).

## 2. Get a key (API key route)

Ask the user for their LexAtlas API key. If they have none, they create it in their account under API keys: <https://lexatlas.creatora.app/account/> (sign-in by a code sent to their e-mail). Never invent a key and never print it back in full.

## 3. Add the server

For Cline, open MCP Servers → Configure in the Cline panel (Cline 4.1+ keeps the file at `~/.cline/data/settings/cline_mcp_settings.json`; the old VS Code globalStorage copy is ignored) and add this, putting the user's key in place of `lxa_...`:

```json
{
  "mcpServers": {
    "lexatlas": {
      "type": "streamableHttp",
      "url": "https://api.lexatlas.creatora.app/mcp",
      "headers": {
        "X-API-Key": "lxa_..."
      },
      "disabled": false
    }
  }
}
```

If the user prefers OAuth and the client supports it, leave out `headers`. The client then opens the LexAtlas sign-in page in the browser.

## 4. Check it works

1. The server shows as connected, with 9 tools whose names start with `lexatlas_` (a 10th, `lexatlas_screen`, appears only for keys where it was enabled on request).
2. Call `lexatlas_search` with a short query, e.g. `{"query": "договор поставки", "jur": "ru"}`, and confirm that results come back with citations.

A `401` response means the key is missing or wrong. Re-check the header name `X-API-Key` and the key itself.

More: <https://lexatlas.creatora.app/connect> · README.md in this repository.
