# Clickzetta MCP Server

## Overview

Clickzetta (云器科技) is a leading provider of cloud-native data analytics solutions, specializing in multi-dimensional analysis for retail and e-commerce. Their MCP server enables AI models to interact with Clickzetta's data analytics platform, allowing for SQL query execution, data analysis, and visualization.

## Features

- Execute SQL queries on Clickzetta's data analytics platform
- Access metadata and schema information
- Perform data analysis and visualization
- Continuously updated data insights memo
- Support for both read and write operations (with appropriate permissions)

## Installation

```bash
# Clone the repository
git clone https://github.com/yunqiqiliang/mcp-clickzetta-server.git
cd mcp-clickzetta-server

# Install the package
uv pip install -e .
```

## Configuration

Create a `.env` file with your Clickzetta Lakehouse credentials:

```
CLICKZETTA_USERNAME = ""
CLICKZETTA_PASSWORD = ""
CLICKZETTA_SERVICE = "api.clickzetta.com"
CLICKZETTA_INSTANCE = ""
CLICKZETTA_WORKSPACE = ""
CLICKZETTA_SCHEMA = ""
CLICKZETTA_VCLUSTER = ""
```

## Available Tools

| Tool Name | Description | Input Schema |
|-----------|-------------|------------|
| `read_query` | Execute SELECT queries to read data from the database | `{ "query": "SELECT * FROM table" }` |
| `write_query` | Execute INSERT, UPDATE, or DELETE queries (with `--allow-write` flag) | `{ "query": "INSERT INTO table VALUES (...)" }` |
| `create_table` | Create new tables in the database (with `--allow-write` flag) | `{ "query": "CREATE TABLE ..." }` |
| `list_tables` | Get a list of all tables in the database | `{}` |
| `describe-table` | View column information for a specific table | `{ "table_name": "table_name" }` |
| `append_insight` | Add new data insights to the memo resource | `{ "insight": "data insight text" }` |

## Available Resources

| Resource URI | Description | MIME Type |
|--------------|-------------|----------|
| `memo://insights` | A continuously updated data insights memo | `text/plain` |

## Usage Examples

```python
# Example: Using the Clickzetta MCP server to execute a query
response = await claude.use_mcp_tool(
    server_name="clickzetta-mcp-server",
    tool_name="read_query",
    arguments={
        "query": "SELECT customer_id, SUM(order_total) as total_spend FROM SALES.ORDERS GROUP BY customer_id ORDER BY total_spend DESC LIMIT 10"
    }
)

# Example: Adding an insight to the memo
response = await claude.use_mcp_tool(
    server_name="clickzetta-mcp-server",
    tool_name="append_insight",
    arguments={
        "insight": "Customer spending is highest in the APAC region during Q3."
    }
)
```

## References

- [Official Website](https://www.clickzetta.com)
- [GitHub Repository](https://github.com/yunqiqiliang/mcp-clickzetta-server)
