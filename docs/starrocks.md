# StarRocks MCP Server

## Overview

StarRocks is a high-performance analytical database designed for real-time analytics. The StarRocks MCP server enables AI models to interact with StarRocks databases, allowing for fast SQL queries, data manipulation, and analytics operations.

## Features

- High-performance SQL query execution
- Real-time data analytics
- Schema management
- Data loading and manipulation
- Support for complex analytical queries

## Installation

```bash
# Clone the repository
git clone https://github.com/StarRocks/mcp-server-starrocks.git
cd mcp-server-starrocks

# Install dependencies
npm install

# Build the project
npm run build
```

## Configuration

```json
{
  "mcpServers": {
    "starrocks": {
      "command": "node",
      "args": ["path/to/mcp-server-starrocks/dist/index.js"],
      "env": {
        "STARROCKS_HOST": "localhost",
        "STARROCKS_PORT": "9030",
        "STARROCKS_USER": "root",
        "STARROCKS_PASSWORD": "password",
        "STARROCKS_DATABASE": "default"
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
| `list_tables` | List tables in a database | Database name |
| `describe_table` | Get table schema | Database name, table name |
| `get_table_data` | Get data from a table with optional filters | Database name, table name, filters, limit |
| `create_table` | Create a new table | Database name, table definition |
| `load_data` | Load data into a table | Database name, table name, data format, data |
| `analyze_query` | Analyze query performance | SQL query string |

## Usage Examples

```python
# Example: Using the StarRocks MCP server to query data
response = await claude.use_mcp_tool(
    server_name="starrocks",
    tool_name="execute_query",
    arguments={
        "sql": "SELECT region, SUM(sales) FROM sales_data GROUP BY region ORDER BY SUM(sales) DESC LIMIT 5"
    }
)

# Example: Loading data into a table
response = await claude.use_mcp_tool(
    server_name="starrocks",
    tool_name="load_data",
    arguments={
        "database": "analytics",
        "table": "user_events",
        "format": "csv",
        "data": "user_id,event_type,timestamp\n1001,click,2025-04-01 12:30:45\n1002,purchase,2025-04-01 13:45:22"
    }
)
```

## References

- [Official Documentation](https://docs.starrocks.io/)
- [GitHub Repository](https://github.com/StarRocks/mcp-server-starrocks)