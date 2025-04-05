# Databricks MCP Server

## Overview

Databricks is a unified data analytics platform that combines data engineering, data science, and business analytics. The Databricks MCP server enables AI models to interact with Databricks workspaces, allowing for SQL queries, notebook execution, job management, and more.

## Features

- SQL query execution against Databricks SQL warehouses
- Notebook execution and management
- Job submission and monitoring
- Data exploration and visualization
- Integration with Delta Lake, MLflow, and other Databricks services

## Installation

```bash
# Clone the repository
git clone https://github.com/markov-kernel/databricks-mcp.git
cd databricks-mcp

# Install dependencies
pip install -r requirements.txt

# Run the server
python -m databricks_mcp.server
```

## Configuration

```json
{
  "mcpServers": {
    "databricks": {
      "command": "python",
      "args": ["-m", "databricks_mcp.server"],
      "env": {
        "DATABRICKS_HOST": "https://your-workspace.cloud.databricks.com",
        "DATABRICKS_TOKEN": "your-personal-access-token",
        "DATABRICKS_CLUSTER_ID": "optional-default-cluster-id",
        "DATABRICKS_WAREHOUSE_ID": "optional-default-sql-warehouse-id"
      }
    }
  }
}
```

## Available Tools

| Tool Name | Description | Input Schema |
|-----------|-------------|---------------|
| `execute_sql` | Execute SQL query against a SQL warehouse | SQL query, warehouse ID (optional) |
| `run_notebook` | Run a notebook and return its output | Notebook path, parameters (optional), cluster ID (optional) |
| `list_notebooks` | List notebooks in a workspace folder | Folder path |
| `create_notebook` | Create a new notebook | Name, language, folder path, content |
| `submit_job` | Submit a new job | Job configuration |
| `get_job_status` | Get the status of a job run | Job run ID |
| `list_tables` | List tables in a catalog/schema | Catalog name, schema name |
| `get_table_data` | Get data from a table | Table name, limit, filter (optional) |

## Usage Examples

```python
# Example: Using the Databricks MCP server to query data
response = await claude.use_mcp_tool(
    server_name="databricks",
    tool_name="execute_sql",
    arguments={
        "sql": "SELECT * FROM sales.transactions WHERE date > '2025-01-01' LIMIT 10",
        "warehouse_id": "12345abcde"
    }
)

# Example: Running a notebook
response = await claude.use_mcp_tool(
    server_name="databricks",
    tool_name="run_notebook",
    arguments={
        "path": "/Users/me@example.com/MyNotebook",
        "parameters": {
            "date": "2025-04-01",
            "region": "EMEA"
        },
        "cluster_id": "0123-456789-abcdefg"
    }
)
```

## References

- [Official Documentation](https://docs.databricks.com/)
- [GitHub Repository](https://github.com/markov-kernel/databricks-mcp)
- [Community Discussion](https://community.databricks.com/t5/generative-ai/databricks-mcp-server/td-p/114328)