# Zilliz (Milvus) MCP Server

## Overview

Zilliz is the company behind Milvus, an open-source vector database designed for AI applications. The Milvus MCP server enables AI models to interact with vector databases, allowing for semantic search, recommendation systems, and other vector-based operations.

## Features

- Vector similarity search
- Full-text search capabilities
- Collection management
- Data insertion and deletion
- Database administration

## Installation

```bash
# Using npm
npm install @milvus/mcp-server

# Or clone the repository
git clone https://github.com/zilliztech/mcp-server-milvus.git
cd mcp-server-milvus
npm install
```

## Configuration

```json
{
  "mcpServers": {
    "milvus": {
      "command": "npx",
      "args": ["@milvus/mcp-server"],
      "env": {
        "MILVUS_ADDRESS": "localhost:19530",
        "MILVUS_USERNAME": "username",
        "MILVUS_PASSWORD": "password"
      }
    }
  }
}
```

## Available Tools

| Tool Name | Description | Input Schema |
|-----------|-------------|---------------|
| `milvus_text_search` | Search for documents using full text search | Collection name, query text, limit, output fields |
| `milvus_vector_search` | Perform vector similarity search | Collection name, vector, vector field, limit, metric type |
| `milvus_query` | Query collection using filter expressions | Collection name, filter expression, output fields, limit |
| `milvus_list_collections` | List all collections in the database | None |
| `milvus_create_collection` | Create a new collection with schema | Collection name, schema definition, index parameters |
| `milvus_insert_data` | Insert data into a collection | Collection name, data (field names to values) |
| `milvus_delete_entities` | Delete entities from a collection | Collection name, filter expression |
| `milvus_load_collection` | Load a collection into memory | Collection name, replica number |
| `milvus_release_collection` | Release a collection from memory | Collection name |

## Usage Examples

```python
# Example: Using the Milvus MCP server for semantic search
response = await claude.use_mcp_tool(
    server_name="milvus",
    tool_name="milvus_vector_search",
    arguments={
        "collection_name": "documents",
        "vector": [0.1, 0.2, 0.3, ...],  # Your embedding vector
        "vector_field": "embedding",
        "limit": 5,
        "metric_type": "COSINE"
    }
)
```

## References

- [Official Documentation](https://milvus.io/docs)
- [GitHub Repository](https://github.com/zilliztech/mcp-server-milvus)
- [Blog Post: How to Use Anthropic MCP Server with Milvus](https://zilliz.com/blog/how-to-use-anthropic-mcp-server-with-milvus)