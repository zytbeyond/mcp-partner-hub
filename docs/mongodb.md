# MongoDB MCP Server

## Overview

MongoDB is a popular document-oriented NoSQL database that provides high performance, high availability, and easy scalability. The MongoDB MCP server enables AI models to interact with MongoDB databases, allowing for schema inspection and data querying through aggregation pipelines.

## Features

- Read-only access to MongoDB databases
- Collection schema inspection
- Aggregation pipeline execution
- Query explanation and optimization
- Support for complex queries and analytics

## Installation

```bash
# Using npm
npm install @pash1986/mcp-server-mongodb

# Or clone the official repository
git clone https://github.com/mongodb-developer/mongodb-mcp-server.git
cd mongodb-mcp-server
npm install
```

## Configuration

```json
{
  "mcpServers": {
    "mongodb": {
      "command": "npx",
      "args": [
        "-y",
        "@pash1986/mcp-server-mongodb"
      ],
      "env": {
        "MONGODB_URI": "mongodb+srv://<yourcluster>" // or 'mongodb://localhost:27017'
      }
    }
  }
}
```

## Available Tools

| Tool Name | Description | Input Schema |
|-----------|-------------|---------------|
| `aggregate` | Execute MongoDB aggregation pipelines | Collection name, pipeline stages, options (allowDiskUse, maxTimeMS, comment) |
| `explain` | Get execution plans for aggregation pipelines | Collection name, pipeline stages, verbosity level |

## Available Resources

| Resource URI | Description | MIME Type |
|--------------|-------------|----------|
| `mongodb://<host>/<collection>/schema` | JSON schema information for collections | `application/json` |

## Usage Examples

```python
# Example: Using the MongoDB MCP server to query data
response = await claude.use_mcp_tool(
    server_name="mongodb",
    tool_name="aggregate",
    arguments={
        "collection": "users",
        "pipeline": [
            { "$match": { "age": { "$gt": 21 } } },
            { "$group": {
                "_id": "$city",
                "avgAge": { "$avg": "$age" },
                "count": { "$sum": 1 }
            }},
            { "$sort": { "count": -1 } },
            { "$limit": 10 }
        ],
        "options": {
            "allowDiskUse": true,
            "maxTimeMS": 60000,
            "comment": "City-wise user statistics"
        }
    }
)

# Example: Getting query explanation
response = await claude.use_mcp_tool(
    server_name="mongodb",
    tool_name="explain",
    arguments={
        "collection": "users",
        "pipeline": [
            { "$match": { "age": { "$gt": 21 } } },
            { "$sort": { "age": 1 } }
        ],
        "verbosity": "executionStats"
    }
)
```

## Safety Features

- Automatic limit of 1000 documents if no limit is specified in the pipeline
- Default timeout of 30 seconds for all operations
- Read-only operations only (no data modification)
- Safe schema inference from collection samples

## References

- [Official Documentation](https://www.mongodb.com/docs/)
- [GitHub Repository](https://github.com/mongodb-developer/mongodb-mcp-server)
- [MongoDB Aggregation Pipeline Documentation](https://www.mongodb.com/docs/manual/core/aggregation-pipeline/)