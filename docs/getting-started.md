# Getting Started with MCP Servers

This guide will help you get started with Model Context Protocol (MCP) servers and integrate them with AI models like Claude.

## What is MCP?

The Model Context Protocol (MCP) is a standardized interface that enables AI models to access external tools and data sources. MCP servers act as bridges between AI models and external systems, allowing the models to:

- Query databases and data warehouses
- Execute operations on external systems
- Access specialized functionality
- Retrieve and manipulate data

## How MCP Works

1. **MCP Server**: A server that implements the MCP protocol and exposes tools and resources
2. **AI Model**: An AI model like Claude that can use MCP tools and resources
3. **Client Application**: An application that connects the AI model to MCP servers

The workflow is as follows:

1. The client application connects to one or more MCP servers
2. The AI model is made aware of the available tools and resources
3. The AI model can then use these tools and resources to accomplish tasks
4. The MCP server executes the requested operations and returns the results to the AI model

## Setting Up an MCP Server

### Prerequisites

- Node.js (for JavaScript/TypeScript-based MCP servers)
- Python (for Python-based MCP servers)
- Access to the system or service you want to integrate with

### General Installation Steps

1. Clone the MCP server repository:
   ```bash
   git clone https://github.com/example/mcp-server-example.git
   cd mcp-server-example
   ```

2. Install dependencies:
   ```bash
   # For Node.js-based servers
   npm install

   # For Python-based servers
   pip install -r requirements.txt
   ```

3. Configure the server:
   - Create or modify configuration files
   - Set up environment variables for authentication

4. Build the server (if required):
   ```bash
   npm run build
   ```

5. Run the server:
   ```bash
   # For Node.js-based servers
   node dist/index.js

   # For Python-based servers
   python -m src.server
   ```

## Configuring MCP Servers with Claude

To use MCP servers with Claude, you need to configure them in your Claude settings file.

### For Claude Desktop App

Edit the configuration file at:
- macOS: `~/Library/Application Support/Claude/claude_desktop_config.json`
- Windows: `%APPDATA%\Claude\claude_desktop_config.json`
- Linux: `~/.config/Claude/claude_desktop_config.json`

### For Claude VSCode Extension

Edit the configuration file at:
- `~/.vscode-server/data/User/globalStorage/saoudrizwan.claude-dev/settings/cline_mcp_settings.json`

### Configuration Format

```json
{
  "mcpServers": {
    "server-name": {
      "command": "executable",
      "args": ["arg1", "arg2"],
      "env": {
        "ENV_VAR1": "value1",
        "ENV_VAR2": "value2"
      }
    }
  }
}
```

Example:

```json
{
  "mcpServers": {
    "milvus": {
      "command": "npx",
      "args": ["@milvus/mcp-server"],
      "env": {
        "MILVUS_ADDRESS": "localhost:19530",
        "MILVUS_USERNAME": "username",
        "MILVUS_PASSWORD": "password"
      }
    }
  }
}
```

## Using MCP Tools with Claude

Once your MCP server is configured and running, you can use its tools with Claude:

```python
# Example: Using an MCP tool with Claude
response = await claude.use_mcp_tool(
    server_name="server-name",
    tool_name="tool-name",
    arguments={
        "param1": "value1",
        "param2": "value2"
    }
)
```

Example with Milvus:

```python
# Example: Using Milvus vector search
response = await claude.use_mcp_tool(
    server_name="milvus",
    tool_name="milvus_vector_search",
    arguments={
        "collection_name": "documents",
        "vector": [0.1, 0.2, 0.3, ...],  # Your embedding vector
        "vector_field": "embedding",
        "limit": 5,
        "metric_type": "COSINE"
    }
)
```

## Accessing MCP Resources with Claude

You can also access resources provided by MCP servers:

```python
# Example: Accessing an MCP resource with Claude
response = await claude.access_mcp_resource(
    server_name="server-name",
    uri="resource://uri"
)
```

Example with a weather server:

```python
# Example: Getting current weather for San Francisco
response = await claude.access_mcp_resource(
    server_name="weather",
    uri="weather://San Francisco/current"
)
```

## Troubleshooting

If you encounter issues with MCP servers:

1. **Check server logs**: Most MCP servers output logs that can help diagnose issues
2. **Verify configuration**: Ensure your configuration file has the correct paths and environment variables
3. **Check connectivity**: Make sure the MCP server can connect to the underlying service
4. **Restart the server**: Sometimes simply restarting the MCP server can resolve issues
5. **Check for updates**: Make sure you're using the latest version of the MCP server

## Next Steps

- Explore the [MCP servers](../README.md#available-mcp-servers) available in this repository
- Compare different MCP servers in the [comparison guide](./comparison.md)
- Learn how to [contribute](../CONTRIBUTING.md) to this repository