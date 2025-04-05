# Snowflake MCP Server

## Overview

Snowflake is a cloud-based data warehousing platform that provides a single solution for data warehousing, data lakes, data engineering, data science, data application development, and secure sharing and consumption of real-time/shared data. The Snowflake MCP server enables AI models to interact with Snowflake, allowing for SQL queries, data manipulation, and warehouse management.

## Features

- SQL query execution
- Data manipulation (insert, update, delete)
- Schema and warehouse management
- Data sharing capabilities
- Support for structured and semi-structured data

## Installation

```bash
# Clone the repository
git clone https://github.com/isaacwasserman/mcp-snowflake-server.git
cd mcp-snowflake-server

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
    "snowflake": {
      "command": "node",
      "args": ["path/to/mcp-snowflake-server/dist/index.js"],
      "env": {
        "SNOWFLAKE_ACCOUNT": "your-account-identifier",
        "SNOWFLAKE_USERNAME": "your-username",
        "SNOWFLAKE_PASSWORD": "your-password",
        "SNOWFLAKE_DATABASE": "default-database",
        "SNOWFLAKE_SCHEMA": "default-schema",
        "SNOWFLAKE_WAREHOUSE": "default-warehouse",
        "SNOWFLAKE_ROLE": "default-role"
      }
    }
  }
}
```

## Available Tools

| Tool Name | Description | Input Schema |
|-----------|-------------|---------------|
| `execute_query` | Execute SQL query and return results | SQL query string |
| `list_databases` | List available databases | None |
| `list_schemas` | List schemas in a database | Database name |
| `list_tables` | List tables in a schema | Database name, schema name |
| `describe_table` | Get table schema | Database name, schema name, table name |
| `get_table_data` | Get data from a table with optional filters | Database name, schema name, table name, filters, limit |
| `create_table` | Create a new table | Database name, schema name, table definition |
| `insert_data` | Insert data into a table | Database name, schema name, table name, data |
| `list_warehouses` | List available warehouses | None |
| `resume_warehouse` | Resume a suspended warehouse | Warehouse name |
| `suspend_warehouse` | Suspend a running warehouse | Warehouse name |

## Usage Examples

```python
# Example: Using the Snowflake MCP server to query data
response = await claude.use_mcp_tool(
    server_name="snowflake",
    tool_name="execute_query",
    arguments={
        "sql": "SELECT * FROM sales.transactions WHERE amount > 1000 ORDER BY transaction_date DESC LIMIT 10"
    }
)

# Example: Inserting data into a table
response = await claude.use_mcp_tool(
    server_name="snowflake",
    tool_name="insert_data",
    arguments={
        "database": "analytics",
        "schema": "public",
        "table": "customer_events",
        "data": [
            {"customer_id": 1001, "event_type": "login", "timestamp": "2025-04-01T12:30:45Z"},
            {"customer_id": 1002, "event_type": "purchase", "timestamp": "2025-04-01T13:45:22Z"}
        ]
    }
)
```

## References

- [Official Documentation](https://docs.snowflake.com/)
- [GitHub Repository](https://github.com/isaacwasserman/mcp-snowflake-server)