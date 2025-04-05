# Apache Doris & VeloDB MCP Server

## Overview

Apache Doris is a high-performance, real-time analytical database based on MPP architecture. VeloDB is a cloud-native analytical database built on Apache Doris. This MCP server enables AI models to interact with Apache Doris and VeloDB databases, allowing for database exploration and SQL query execution.

## Features

- Database listing and exploration
- Table schema inspection
- SQL query execution with timeout protection
- Support for both Apache Doris and VeloDB
- Security features to prevent non-SELECT queries

## Installation

```bash
# Using uv (recommended)
uv pip install mcp-doris

# Or clone the repository
git clone https://github.com/morningman/mcp-doris.git
cd mcp-doris
uv sync
```

## Configuration

```json
{
  "mcpServers": {
    "doris": {
      "command": "uv",
      "args": ["run", "--with", "mcp-doris", "--python", "3.13", "mcp-doris"],
      "env": {
        "DORIS_HOST": "your-doris-host",
        "DORIS_PORT": "9030",
        "DORIS_USER": "your-username",
        "DORIS_PASSWORD": "your-password"
      }
    }
  }
}
```

## Available Tools

| Tool Name | Description | Input Schema |
|-----------|-------------|---------------|
| `show_databases` | List all databases in the Doris instance | None |
| `show_tables` | List all tables in the specified database | Database name, optional pattern to filter table names |
| `execute_query` | Run a SELECT query against Doris | SQL query string (must be a SELECT query) |

## Usage Examples

```python
# Example: Listing all databases
response = await claude.use_mcp_tool(
    server_name="doris",
    tool_name="show_databases",
    arguments={}
)

# Example: Listing tables in a database
response = await claude.use_mcp_tool(
    server_name="doris",
    tool_name="show_tables",
    arguments={
        "database": "example_db",
        "like": "user%"  # Optional: only show tables starting with "user"
    }
)

# Example: Executing a SQL query
response = await claude.use_mcp_tool(
    server_name="doris",
    tool_name="execute_query",
    arguments={
        "query": "SELECT user_id, name, email FROM example_db.users WHERE age > 21 LIMIT 10"
    }
)
```

## Safety Features

- Only SELECT queries are allowed for security reasons
- Queries have a default timeout of 30 seconds
- Thread pool execution to prevent resource exhaustion

## References

- [Apache Doris Official Documentation](https://doris.apache.org/docs/)
- [GitHub Repository](https://github.com/morningman/mcp-doris)
- [VeloDB Official Website](https://velodb.io/)