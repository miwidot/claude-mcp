#!/bin/bash

# Claude MCP Servers Installation Script
# One-command installation for all preferred MCP servers

set -e

echo "╔════════════════════════════════════════════════════════════════╗"
echo "║       🚀 Claude Desktop MCP Servers Installation Script        ║"
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""

# Check if claude CLI is installed
if ! command -v claude &> /dev/null; then
    echo "❌ Error: Claude CLI not found. Please install Claude CLI first."
    echo "Visit: https://docs.anthropic.com/en/docs/claude-code"
    exit 1
fi

# Function to install an MCP server with error handling
install_mcp() {
    local name=$1
    local description=$2
    shift 2
    local command=("$@")
    
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "📦 Installing: $name"
    echo "📝 Description: $description"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    
    if claude mcp add "$@" 2>/dev/null; then
        echo "✅ Successfully installed $name"
    else
        echo "⚠️  Warning: Failed to install $name (might already be installed)"
    fi
}

# Install Sequential Thinking MCP
install_mcp "Sequential Thinking" \
    "Enables step-by-step reasoning and complex problem-solving capabilities" \
    sequential-thinking -s user -- npx -y @modelcontextprotocol/server-sequential-thinking

# Install Puppeteer MCP
install_mcp "Puppeteer Browser Automation" \
    "Provides browser automation for web scraping, testing, and interaction" \
    puppeteer -s user -- npx -y @modelcontextprotocol/server-puppeteer

# Install Web Fetching MCP
install_mcp "Web Fetching (kazuph)" \
    "Simple and efficient web content fetching and extraction" \
    fetch -s user -- npx -y @kazuph/mcp-fetch

# Install Playwright MCP
install_mcp "Playwright Browser Automation" \
    "Modern browser automation with support for Chrome, Firefox, and Safari" \
    playwright npx @playwright/mcp@latest

# Install Context7 MCP
install_mcp "Context7 (Upstash)" \
    "Provides context management and caching capabilities using Upstash" \
    context7 -- npx -y @upstash/context7-mcp@latest

# Install Xcode Build Helper MCP
install_mcp "Xcode Build Helper" \
    "Assists with Xcode project building, testing, and iOS development tasks" \
    xc -- npx -y xcodebuildmcp@latest

# Additional recommended servers from the original list
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📦 Installing additional recommended servers..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Install File System MCP
install_mcp "File System Operations" \
    "Read, write, and manage files on your local system" \
    filesystem -s user -- npx -y @modelcontextprotocol/server-filesystem

# Install Git MCP
install_mcp "Git Version Control" \
    "Execute Git commands and manage repositories" \
    git -s user -- npx -y @modelcontextprotocol/server-git

# Install GitHub MCP (requires token)
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📦 GitHub MCP (requires configuration)"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "⚠️  Note: GitHub MCP requires a personal access token"
echo "   Please set GITHUB_PERSONAL_ACCESS_TOKEN environment variable"
echo "   or configure it manually in Claude Desktop settings"

# Install Memory MCP
install_mcp "Memory Management" \
    "Persistent memory and context retention across conversations" \
    memory -s user -- npx -y @modelcontextprotocol/server-memory

# Verify installation
echo ""
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║                    ✅ Installation Summary                     ║"
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""
echo "📋 Listing all installed MCP servers:"
echo ""
claude mcp list

echo ""
echo "🎉 MCP servers installation completed!"
echo ""
echo "📝 Additional Notes:"
echo "   • Some servers may require additional configuration"
echo "   • Check each server's documentation for advanced features"
echo "   • Restart Claude Desktop to ensure all servers are loaded"
echo ""
echo "📚 For more information, visit:"
echo "   https://github.com/miwidot/claude-mcp"
echo ""