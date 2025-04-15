# ProtonBase MCP Server

## Overview

ProtonBase (小质科技) is a leading provider of high-performance database solutions, specializing in PostgreSQL-compatible systems with enhanced analytics capabilities. Their MCP server provides tools for interacting with PostgreSQL databases, allowing AI models to execute SQL queries, manage database schemas, and analyze data structures.

## Features

- Execute SQL queries on PostgreSQL databases
- Inspect database schemas and tables
- Support for advanced PostgreSQL features
- Read-only access for security
- Automatic resource discovery for tables and schemas

## Installation

```bash
# Using NPX
npx -y @modelcontextprotocol/server-postgres postgresql://localhost/mydb

# Using Docker
docker run -i --rm mcp/postgres postgresql://host:port/mydb
```

## Configuration

Add the following to your Claude Desktop configuration:

```json
{
  "mcpServers": {
    "postgres": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-postgres",
        "postgresql://localhost/mydb"
      ]
    }
  }
}
```

## Available Tools

| Tool Name | Description | Input Schema |
|-----------|-------------|------------|
| `query` | Execute read-only SQL queries against the connected database | `{ "sql": "SELECT * FROM users LIMIT 10" }` |

## Available Resources

| Resource URI | Description | MIME Type |
|--------------|-------------|----------|
| `postgres://<host>/<table>/schema` | JSON schema information for each table | `application/json` |

## Usage Examples

```python
# Example: Using the ProtonBase MCP server to execute a query
response = await claude.use_mcp_tool(
    server_name="postgres",
    tool_name="query",
    arguments={
        "sql": "SELECT username, email FROM users WHERE active = true ORDER BY created_at DESC LIMIT 5"
    }
)

# Example: Accessing schema information
schema_info = await claude.access_mcp_resource(
    server_name="postgres",
    uri="postgres://localhost/users/schema"
)
```

## About ProtonBase

ProtonBase (小质科技) is a company focused on cloud-native distributed data storage, computation, and management. Founded in May 2021, they have R&D and sales centers in Hangzhou, Beijing, Shanghai, and Shenzhen. Their flagship product is a distributed "DataWarebase" that combines the features of traditional databases and data warehouses, supporting structured, semi-structured, and unstructured data with high performance and real-time capabilities.

## References

- [Official Website](https://www.protonbase.com)
- [GitHub Repository](https://github.com/modelcontextprotocol/servers/tree/main/src/postgres)
