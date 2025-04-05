# Dify MCP Server

## Overview

Dify is an LLMOps platform that helps developers build, deploy, and operate AI applications. The Dify MCP server enables AI models to interact with Dify applications, allowing for application management, dataset operations, and integration with other tools like Zapier.

## Features

- Application management
- Dataset operations
- Conversation history access
- Integration with Zapier for tool calls
- Support for multiple LLM providers

## Installation

```bash
# Clone the repository
git clone https://github.com/YanxingLiu/dify-mcp-server.git
cd dify-mcp-server

# Install dependencies
npm install

# Build the project
npm run build

# Run the server
npm start
```

## Configuration

```json
{
  "mcpServers": {
    "dify": {
      "command": "node",
      "args": ["path/to/dify-mcp-server/dist/index.js"],
      "env": {
        "DIFY_API_KEY": "your-dify-api-key",
        "DIFY_API_URL": "https://api.dify.ai/v1",
        "ZAPIER_NLA_API_KEY": "optional-zapier-api-key"
      }
    }
  }
}
```

## Available Tools

| Tool Name | Description | Input Schema |
|-----------|-------------|---------------|
| `list_applications` | List all applications in your Dify account | None |
| `get_application` | Get details of a specific application | Application ID |
| `create_application` | Create a new application | Name, description, model provider, model |
| `update_application` | Update an existing application | Application ID, updated fields |
| `list_datasets` | List all datasets in your Dify account | None |
| `get_dataset` | Get details of a specific dataset | Dataset ID |
| `create_dataset` | Create a new dataset | Name, description |
| `upload_document` | Upload a document to a dataset | Dataset ID, document content, name |
| `get_conversation_history` | Get conversation history for an application | Application ID, limit |
| `execute_zapier_action` | Execute a Zapier action | Action ID, inputs |
| `list_zapier_actions` | List available Zapier actions | None |

## Usage Examples

```python
# Example: Using the Dify MCP server to list applications
response = await claude.use_mcp_tool(
    server_name="dify",
    tool_name="list_applications",
    arguments={}
)

# Example: Creating a new application
response = await claude.use_mcp_tool(
    server_name="dify",
    tool_name="create_application",
    arguments={
        "name": "Customer Support Assistant",
        "description": "An AI assistant that helps with customer support queries",
        "model_provider": "openai",
        "model": "gpt-4"
    }
)

# Example: Executing a Zapier action
response = await claude.use_mcp_tool(
    server_name="dify",
    tool_name="execute_zapier_action",
    arguments={
        "action_id": "create_trello_card",
        "inputs": {
            "board_id": "60d5a8e7c0e1a14a9c9b3b5a",
            "list_id": "60d5a8e7c0e1a14a9c9b3b5b",
            "name": "New feature request",
            "description": "Customer requested a new feature for the dashboard"
        }
    }
)
```

## References

- [Official Documentation](https://docs.dify.ai/)
- [GitHub Repository](https://github.com/YanxingLiu/dify-mcp-server)
- [Blog Post: Dify MCP Plugin Hands-on Guide](https://dify.ai/blog/dify-mcp-plugin-hands-on-guide-integrating-zapier-for-effortless-agent-tool-calls)