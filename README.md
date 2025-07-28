# Claude MCP - Personal Preferred MCP List

A curated list of Model Context Protocol (MCP) servers for global installation with Claude Desktop.

## About

This repository contains my personal collection of preferred MCP servers that I use globally with Claude Desktop. These servers extend Claude's capabilities by providing access to various tools and services.

## Installation

### Prerequisites

- Claude Desktop app
- Node.js and npm (for most MCP servers)
- Python (for Python-based MCP servers)

### Global Installation

Each MCP server can be installed globally using npm or pip, depending on the implementation:

```bash
# For Node.js-based servers
npm install -g @modelcontextprotocol/server-name

# For Python-based servers
pip install mcp-server-name
```

## MCP Servers List

### 1. **File System** (`@modelcontextprotocol/server-filesystem`)
Provides file system operations like reading, writing, and searching files.

```bash
npm install -g @modelcontextprotocol/server-filesystem
```

### 2. **Git** (`@modelcontextprotocol/server-git`)
Enables Git operations within Claude.

```bash
npm install -g @modelcontextprotocol/server-git
```

### 3. **GitHub** (`@modelcontextprotocol/server-github`)
Interact with GitHub repositories, issues, and pull requests.

```bash
npm install -g @modelcontextprotocol/server-github
```

### 4. **Web Search** (`@modelcontextprotocol/server-websearch`)
Allows Claude to search the web for current information.

```bash
npm install -g @modelcontextprotocol/server-websearch
```

### 5. **Memory** (`@modelcontextprotocol/server-memory`)
Provides persistent memory capabilities across conversations.

```bash
npm install -g @modelcontextprotocol/server-memory
```

## Configuration

After installing the MCP servers globally, you need to configure Claude Desktop to use them. Add the following to your Claude Desktop configuration file:

### macOS/Linux
Location: `~/Library/Application Support/Claude/claude_desktop_config.json`

```json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem"]
    },
    "git": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-git"]
    },
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "your-github-token"
      }
    },
    "websearch": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-websearch"]
    },
    "memory": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-memory"]
    }
  }
}
```

### Windows
Location: `%APPDATA%\Claude\claude_desktop_config.json`

## Contributing

Feel free to suggest additional MCP servers by opening an issue or submitting a pull request.

## Resources

- [Model Context Protocol Documentation](https://modelcontextprotocol.io/)
- [Official MCP Servers Repository](https://github.com/modelcontextprotocol/servers)
- [Claude Desktop Documentation](https://claude.ai/docs)

## License

This repository is licensed under the MIT License. See [LICENSE](LICENSE) file for details.