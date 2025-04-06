# TiDB MCP Server

## Overview

TiDB is a distributed SQL database designed for high performance and horizontal scalability. The TiDB MCP server enables AI models to interact with TiDB databases, allowing for SQL queries, data manipulation, and database management operations.

## Features

- SQL query execution and data retrieval
- Database and table management
- Transaction support
- User management
- Support for TiDB Cloud serverless databases

## Installation

```bash
# Clone the repository
git clone https://github.com/c4pt0r/mcp-server-tidb
cd mcp-server-tidb

# Install dependencies using uv
uv venv
uv pip install -e .
```

## Configuration

```json
{
  "mcpServers": {
    "tidb": {
      "command": "bash",
      "args": [
        "-c",
        "cd /path/to/mcp-server-tidb && source .venv/bin/activate && python src/main.py"
      ],
      "env": {
        "TIDB_HOST": "gateway01.us-east-1.prod.aws.tidbcloud.com",
        "TIDB_PORT": "4000",
        "TIDB_USERNAME": "username",
        "TIDB_PASSWORD": "password",
        "TIDB_DATABASE": "test"
      }
    }
  }
}
```

For TiDB Cloud, you can create a free database cluster at [tidbcloud.com](https://tidbcloud.com).

## Available Tools

| Tool Name | Description | Input Schema |
|-----------|-------------|------------|
| `show_tables` | Show all tables in the database | Database name |
| `db_query` | Execute SQL query and return results | Database name, SQL query string |
| `show_create_table` | Get the CREATE TABLE statement for a table | Database name, table name |
| `db_execute` | Execute SQL statements on a database | Database name, SQL statements (string or list of strings) |
| `create_db_user` | Create a new database user | Username, password |
| `remove_db_user` | Remove a database user | Username |
| `get_tidb_serverless_address` | Get connection host and port | None |

## Usage Examples

```python
# Example: Querying data from a table
response = await claude.use_mcp_tool(
    server_name="tidb",
    tool_name="db_query",
    arguments={
        "db_name": "sales",
        "sql": "SELECT customer_id, SUM(amount) FROM orders GROUP BY customer_id ORDER BY SUM(amount) DESC LIMIT 5"
    }
)

# Example: Creating a new table
response = await claude.use_mcp_tool(
    server_name="tidb",
    tool_name="db_execute",
    arguments={
        "db_name": "sales",
        "sql_stmts": "CREATE TABLE customers (id INT PRIMARY KEY, name VARCHAR(100), email VARCHAR(100))"
    }
)

# Example: Inserting data
response = await claude.use_mcp_tool(
    server_name="tidb",
    tool_name="db_execute",
    arguments={
        "db_name": "sales",
        "sql_stmts": [
            "INSERT INTO customers VALUES (1, 'John Doe', 'john@example.com')",
            "INSERT INTO customers VALUES (2, 'Jane Smith', 'jane@example.com')"
        ]
    }
)
```

## References

- [Official TiDB Documentation](https://docs.pingcap.com/tidb/stable)
- [TiDB Cloud](https://tidbcloud.com)
- [GitHub Repository](https://github.com/c4pt0r/mcp-server-tidb)