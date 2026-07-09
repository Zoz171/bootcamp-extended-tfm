### Problem 1

```
npm ERR! code ENYI npm ERR! Web login not supported
```

### Fix

add `--auth-type=legacy` since Web is not supported in vscode terminal, and npm defaults to `--auth-type=web`

```
npm login --registry=https://your-private-registry-url.com --auth-type=legacy
```

### Problem 2

pressing tab doesn't auto complete with this LSP environment-definition repo

### Fix

```
{
    "Lua.completion.callSnippet": "Replace"
}
```
in workspace `settings.json`