# LexAtlas MCP

LexAtlas is current law as data for AI: statutes and codes as structured, versioned articles with smart search, daily updates and access via API and MCP.
Citations an AI assistant cannot find in the base are flagged.
We are on the way to full coverage of the world's law, starting with the CIS countries.

> The LexAtlas service and data are not open source; this repository contains connection docs and examples only.

## Server address

```
https://api.lexatlas.creatora.app/mcp
```

Remote MCP server, Streamable HTTP. Sign-in is OAuth 2.1 with discovery, dynamic client registration and PKCE (S256). Any MCP client that supports OAuth 2.1 can connect the same way. Full step-by-step page: <https://lexatlas.creatora.app/connect>.

## Connect

Give your AI client the one address above and sign in once: your client opens the LexAtlas sign-in page in the browser, you enter your email and the code we send you, review what the client asks for and approve it. Then the LexAtlas tools appear in the client.

### Claude (web and desktop)
1. Open **Customize -> Connectors** and choose **Add custom connector**.
2. Enter a name and paste the address above.
3. Press **Add**, then sign in to LexAtlas when asked.

Guide: <https://support.claude.com/en/articles/11175166-get-started-with-custom-connectors-using-remote-mcp>

### Claude Code
```
claude mcp add --transport http lexatlas https://api.lexatlas.creatora.app/mcp
```
Then open the `/mcp` menu inside Claude Code and sign in to LexAtlas. Docs: <https://code.claude.com/docs/en/mcp>

### ChatGPT
Turn on developer mode and create an app for a remote MCP server, paste the address above, choose OAuth as the authentication and sign in to LexAtlas when asked. Menu names change often; follow OpenAI's guide: <https://developers.openai.com/api/docs/guides/developer-mode>

### Cursor
Add the block below to `mcp.json` (project `.cursor/mcp.json` or the global file); Cursor shows the server as needing sign-in, follow the link to LexAtlas in your browser. Docs: <https://cursor.com/docs/context/mcp>

```json
{
  "mcpServers": {
    "lexatlas": {
      "url": "https://api.lexatlas.creatora.app/mcp"
    }
  }
}
```
The same block is in [examples/mcp-config-url.json](examples/mcp-config-url.json).

### Gemini CLI
Add the block below to `settings.json` (user or project); Gemini CLI starts the OAuth sign-in in your browser when the server asks for it. Docs: <https://github.com/google-gemini/gemini-cli/blob/main/docs/tools/mcp-server.md>

```json
{
  "mcpServers": {
    "lexatlas": {
      "httpUrl": "https://api.lexatlas.creatora.app/mcp"
    }
  }
}
```

### With an API key instead
For a client without OAuth support, send a key in a header on every request to the same address:

```
X-API-Key: lxa_...
```
`Authorization: Bearer lxa_...` works as well. Create keys in your account under API keys: <https://lexatlas.creatora.app/account/>. An HTTP API example is in [examples/api-curl.sh](examples/api-curl.sh).

## Tools

Per-tool pages: `https://lexatlas.creatora.app/docs/mcp/<tool>.html`

| Tool | What it answers | Docs |
|---|---|---|
| `lexatlas_verify` | Is the article real, in force or repealed, and how fresh is our copy. | [docs](https://lexatlas.creatora.app/docs/mcp/lexatlas_verify.html) |
| `lexatlas_get` | Full text with the act, status and provenance, or as it stood on a chosen date. | [docs](https://lexatlas.creatora.app/docs/mcp/lexatlas_get.html) |
| `lexatlas_history` | When the article was changed and by which law, from the first version onwards. | [docs](https://lexatlas.creatora.app/docs/mcp/lexatlas_history.html) |
| `lexatlas_search` | Provisions across jurisdictions, found by wording or by the situation described. | [docs](https://lexatlas.creatora.app/docs/mcp/lexatlas_search.html) |
| `lexatlas_screen` | A name, alias or registered ID against official sanctions lists, quoted verbatim. | [docs](https://lexatlas.creatora.app/docs/mcp/lexatlas_screen.html) |
| `lexatlas_changes` | Everything amended since a date you name, for monitoring, not re-reading. | [docs](https://lexatlas.creatora.app/docs/mcp/lexatlas_changes.html) |
| `lexatlas_citecheck` | Every legal reference in a draft checked at once, so invented citations surface. | [docs](https://lexatlas.creatora.app/docs/mcp/lexatlas_citecheck.html) |
| `lexatlas_pipeline` | Draft laws by stage: introduced, read, signed, published. | [docs](https://lexatlas.creatora.app/docs/mcp/lexatlas_pipeline.html) |
| `lexatlas_coverage` | How complete a jurisdiction is, counted against the source's own register. | [MCP page](https://lexatlas.creatora.app/mcp.html#tools) |
| `lexatlas_calendar` | Provisions coming into force in the weeks ahead, with dates. | [docs](https://lexatlas.creatora.app/docs/mcp/lexatlas_calendar.html) |
| `lexatlas_related` | What an article relies on and what relies on it, with the meaning of each link. | [docs](https://lexatlas.creatora.app/docs/mcp/lexatlas_related.html) |

## Pricing

Each tool call counts as a request against your free monthly allowance and then your balance. Details: <https://lexatlas.creatora.app/pricing>

## Links

- Website: <https://lexatlas.creatora.app/>
- MCP page: <https://lexatlas.creatora.app/mcp.html>
- Connect page: <https://lexatlas.creatora.app/connect>
- API docs: <https://lexatlas.creatora.app/api.html>
- Pricing: <https://lexatlas.creatora.app/pricing>
- Support: <https://lexatlas.creatora.app/#contact> (contact form) or business@creatora.app

<!-- closed-test URL pending -->

## License

MIT, for this documentation and the examples only. See [LICENSE](LICENSE).

<!--
Maintainer notes (Official MCP Registry, server.json):
- Namespace app.creatora.lexatlas/lexatlas-mcp is proven by HTTP verification on lexatlas.creatora.app
  (mcp-publisher login http; public key served at /.well-known/mcp-registry-auth).
- The "$schema" version may need bumping to the latest one the registry publishes.
-->
