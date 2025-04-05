# Confluent MCP Server

## Overview

Confluent is a complete data streaming platform built on Apache Kafka that enables you to easily access, store, and manage data as continuous, real-time streams. The Confluent MCP server enables AI models to interact with Confluent Cloud and Kafka resources, allowing for topic management, message production, Flink SQL operations, connector management, and more.

## Features

- Topic management (list, create, delete, search, tag)
- Message production to Kafka topics
- Flink SQL statement management
- Connector management
- Cluster and environment information
- Tag management for Kafka resources

## Installation

```bash
# Clone the repository
git clone https://github.com/confluentinc/mcp-confluent.git
cd mcp-confluent

# Install dependencies
npm install

# Build the project
npm run build
```

## Configuration

```json
{
  "mcpServers": {
    "confluent": {
      "command": "node",
      "args": [
        "--env-file",
        "/path/to/confluent-mcp-server/.env",
        "/path/to/confluent-mcp-server/dist/index.js"
      ],
      "env": {
        "BOOTSTRAP_SERVERS": "pkc-v12gj.us-east4.gcp.confluent.cloud:9092",
        "KAFKA_API_KEY": "your-kafka-api-key",
        "KAFKA_API_SECRET": "your-kafka-api-secret",
        "KAFKA_REST_ENDPOINT": "https://pkc-v12gj.us-east4.gcp.confluent.cloud:443",
        "CONFLUENT_CLOUD_API_KEY": "your-cloud-api-key",
        "CONFLUENT_CLOUD_API_SECRET": "your-cloud-api-secret",
        "SCHEMA_REGISTRY_API_KEY": "your-schema-registry-api-key",
        "SCHEMA_REGISTRY_API_SECRET": "your-schema-registry-api-secret",
        "SCHEMA_REGISTRY_ENDPOINT": "https://psrc-zv01y.northamerica-northeast2.gcp.confluent.cloud"
      }
    }
  }
}
```

## Available Tools

| Tool Name | Description | Input Schema |
|-----------|-------------|---------------|
| `list-topics` | List Kafka topics in the cluster | None |
| `create-topics` | Create new Kafka topics | Topic configurations |
| `delete-topics` | Delete existing Kafka topics | Topic names |
| `produce-message` | Produce a message to a Kafka topic | Topic name, message key/value |
| `list-flink-statements` | List Flink SQL statements | None |
| `create-flink-statement` | Create a new Flink SQL statement | SQL statement |
| `read-flink-statement` | Read a specific Flink SQL statement | Statement ID |
| `delete-flink-statements` | Delete Flink SQL statements | Statement IDs |
| `list-connectors` | List Kafka connectors | None |
| `read-connector` | Get details about a specific connector | Connector ID |
| `create-connector` | Create a new Kafka connector | Connector configuration |
| `delete-connector` | Delete a Kafka connector | Connector ID |
| `search-topics-by-tag` | Search for topics by tag | Tag name |
| `search-topics-by-name` | Search for topics by name | Topic name pattern |
| `create-topic-tags` | Create tags for topics | Topic names, tag definitions |
| `delete-tag` | Delete a tag | Tag name |
| `remove-tag-from-entity` | Remove a tag from a Kafka entity | Entity ID, tag name |
| `add-tags-to-topic` | Add tags to a topic | Topic name, tag names |
| `list-tags` | List all available tags | None |
| `alter-topic-config` | Modify topic configuration | Topic name, configuration changes |
| `list-clusters` | List Kafka clusters | None |
| `list-environments` | List Confluent environments | None |
| `read-environment` | Get details about a specific environment | Environment ID |

## Usage Examples

```python
# Example: Listing Kafka topics
response = await claude.use_mcp_tool(
    server_name="confluent",
    tool_name="list-topics",
    arguments={}
)

# Example: Creating a new topic
response = await claude.use_mcp_tool(
    server_name="confluent",
    tool_name="create-topics",
    arguments={
        "topics": [
            {
                "name": "my-new-topic",
                "partitions": 3,
                "replicationFactor": 3,
                "configs": {
                    "cleanup.policy": "delete",
                    "retention.ms": "604800000"
                }
            }
        ]
    }
)

# Example: Producing a message to a topic
response = await claude.use_mcp_tool(
    server_name="confluent",
    tool_name="produce-message",
    arguments={
        "topic": "my-topic",
        "key": "user-123",
        "value": {
            "name": "John Doe",
            "email": "john@example.com",
            "timestamp": "2025-04-05T13:45:00Z"
        }
    }
)
```

## References

- [Official Documentation](https://docs.confluent.io/)
- [GitHub Repository](https://github.com/confluentinc/mcp-confluent)
- [Confluent Cloud Documentation](https://docs.confluent.io/cloud/current/overview.html)