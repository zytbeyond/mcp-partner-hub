# OceanBase MCP Server

## Overview

OceanBase is a distributed relational database system that provides strong consistency, high availability, and high performance. The OceanBase MCP server enables AI models to interact with OceanBase databases, allowing for SQL queries, data manipulation, and database administration.

## Features

- SQL query execution
- Data manipulation (insert, update, delete)
- Schema management
- Transaction support
- Database administration

## Installation

```bash
# Clone the repository
git clone https://github.com/oceanbase/mcp-oceanbase.git
cd mcp-oceanbase

# Install dependencies
npm install

# Build the project
npm run build
```

## Configuration

```json
{
  "mcpServers": {
    "oceanbase": {
      "command": "node",
      "args": ["path/to/mcp-oceanbase/dist/index.js"],
      "env": {
        "OCEANBASE_HOST": "localhost",
        "OCEANBASE_PORT": "2881",
        "OCEANBASE_USER": "username",
        "OCEANBASE_PASSWORD": "password",
        "OCEANBASE_DATABASE": "test",
        "OCEANBASE_TENANT": "sys"
      }
    }
  }
}
```

## Available Tools

| Tool Name | Description | Input Schema |
|-----------|-------------|---------------|
| `execute_query` | Execute SQL query and return results | SQL query string |
| `execute_update` | Execute SQL update statement | SQL update statement |
| `list_databases` | List available databases | None |
| `list_tables` | List tables in a database | Database name |
| `describe_table` | Get table schema | Database name, table name |
| `get_table_data` | Get data from a table with optional filters | Database name, table name, filters, limit |
| `create_table` | Create a new table | Database name, table definition |
| `drop_table` | Drop a table | Database name, table name |

## Usage Examples

```python
# Example: Using the OceanBase MCP server to query data
response = await claude.use_mcp_tool(
    server_name="oceanbase",
    tool_name="execute_query",
    arguments={
        "sql": "SELECT * FROM customers WHERE region = 'APAC' LIMIT 10"
    }
)

# Example: Creating a new table
response = await claude.use_mcp_tool(
    server_name="oceanbase",
    tool_name="create_table",
    arguments={
        "database": "test",
        "definition": "CREATE TABLE new_users (id INT PRIMARY KEY, name VARCHAR(100), email VARCHAR(100))"
    }
)
```

## References

- [Official Documentation](https://www.oceanbase.com/docs)
- [GitHub Repository](https://github.com/oceanbase/mcp-oceanbase)