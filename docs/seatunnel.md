# SeaTunnel MCP Server

## Overview

SeaTunnel (formerly known as Waterdrop) is a high-performance, distributed, and easy-to-use data integration platform that supports real-time synchronization between various data sources and destinations. The SeaTunnel MCP server enables AI models to interact with SeaTunnel, allowing for job submission, monitoring, and management.

## Features

- Job submission and management
- Real-time job status monitoring
- Support for various data sources and sinks
- Data transformation capabilities
- Cluster management

## Installation

```bash
# Clone the repository
git clone https://github.com/ocean-zhc/seatunnel-mcp.git
cd seatunnel-mcp

# Create and activate virtual environment
python -m venv .venv
source .venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Run the server
python -m src.seatunnel_mcp
```

## Configuration

```json
{
  "mcpServers": {
    "seatunnel": {
      "command": "bash",
      "args": ["-c", "cd /path/to/seatunnel-mcp && source .venv/bin/activate && python -m src.seatunnel_mcp"],
      "env": {
        "SEATUNNEL_API_URL": "http://localhost:8801",
        "SEATUNNEL_API_KEY": "optional-api-key"
      }
    }
  }
}
```

## Available Tools

| Tool Name | Description | Input Schema |
|-----------|-------------|---------------|
| `get-connection-settings` | Get current SeaTunnel connection URL and API key status | None |
| `update-connection-settings` | Update URL and/or API key to connect to a different SeaTunnel instance | URL (optional), API key (optional) |
| `submit-job` | Submit a new job to the SeaTunnel cluster | Job content, job name (optional), job ID (optional), format (default: hocon) |
| `stop-job` | Stop a running job | Job ID, savepoint flag (optional) |
| `get-job-info` | Get detailed information about a specific job | Job ID |
| `get-running-job` | Get details about a specific running job | Job ID |
| `get-running-jobs` | List all currently running jobs | None |
| `get-finished-jobs` | List all finished jobs by state | State (FINISHED, CANCELED, FAILED, UNKNOWABLE) |
| `get-overview` | Get an overview of the SeaTunnel cluster | Tags (optional) |
| `get-system-monitoring-information` | Get detailed system monitoring information | None |

## Usage Examples

```python
# Example: Using the SeaTunnel MCP server to submit a job
response = await claude.use_mcp_tool(
    server_name="seatunnel",
    tool_name="submit-job",
    arguments={
        "job_content": """
env {
  execution.parallelism = 1
  job.mode = "BATCH"
}

source {
  FakeSource {
    result_table_name = "fake"
    row.num = 100
    schema = {
      fields {
        name = "string"
        age = "int"
      }
    }
  }
}

sink {
  Console {
    source_table_name = "fake"
  }
}
        """,
        "jobName": "example-job",
        "format": "hocon"
    }
)

# Example: Getting running jobs
response = await claude.use_mcp_tool(
    server_name="seatunnel",
    tool_name="get-running-jobs",
    arguments={}
)
```

## References

- [Official Documentation](https://seatunnel.apache.org/docs)
- [GitHub Repository](https://github.com/ocean-zhc/seatunnel-mcp)