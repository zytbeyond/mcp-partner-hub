# PagerDuty MCP Server

## Overview

PagerDuty is an incident management platform that provides reliable notifications, automatic escalations, on-call scheduling, and other functionality to help teams detect and fix problems quickly. The PagerDuty MCP server enables AI models to interact with PagerDuty's API, allowing for incident management, on-call scheduling, team coordination, and more.

## Features

- Incident management (list, view, search similar incidents)
- On-call rotation management and scheduling
- Service management
- Team management
- User management and context building
- Escalation policy management

## Installation

```bash
# Using pip
pip install pagerduty-mcp-server

# Or clone the repository
git clone https://github.com/wpfleger96/pagerduty-mcp-server.git
cd pagerduty-mcp-server
uv sync
```

## Configuration

```json
{
  "mcpServers": {
    "pagerduty": {
      "command": "uv",
      "args": ["run", "python", "-m", "pagerduty_mcp_server"],
      "env": {
        "PAGERDUTY_API_KEY": "your-pagerduty-api-key"
      }
    }
  }
}
```

## Available Tools

### Incident Tools

| Tool Name | Description | Input Schema |
|-----------|-------------|---------------|
| `list_incidents` | List existing incidents | Optional filters: current_user_context, service_ids, team_ids, statuses, since, until, limit |
| `show_incident` | Get detailed information about a specific incident | incident_id |
| `list_past_incidents` | List incidents from the past 6 months that are similar to the input incident | incident_id, limit, total |

### On-Call Tools

| Tool Name | Description | Input Schema |
|-----------|-------------|---------------|
| `list_oncalls` | List the on-call entries during a given time range | Optional filters: current_user_context, schedule_ids, user_ids, escalation_policy_ids, since, until, limit, earliest |

### Schedule Tools

| Tool Name | Description | Input Schema |
|-----------|-------------|---------------|
| `list_schedules` | List existing schedules | Optional filters: query, limit |
| `show_schedule` | Get detailed information about a specific schedule | schedule_id, since, until |

### Service Tools

| Tool Name | Description | Input Schema |
|-----------|-------------|---------------|
| `list_services` | List existing services | Optional filters: current_user_context, team_ids, query, limit |
| `show_service` | Get detailed information about a specific service | service_id |

### Team Tools

| Tool Name | Description | Input Schema |
|-----------|-------------|---------------|
| `list_teams` | List existing teams | Optional filters: query, limit |
| `show_team` | Get detailed information about a specific team | team_id |

### User Tools

| Tool Name | Description | Input Schema |
|-----------|-------------|---------------|
| `build_user_context` | Build a user context object containing the current user's permissions and access levels | None |
| `show_current_user` | Get the current user's PagerDuty profile | None |
| `list_users` | List existing users | Optional filters: current_user_context, team_ids, query, limit |
| `show_user` | Get detailed information about a specific user | user_id |

### Escalation Policy Tools

| Tool Name | Description | Input Schema |
|-----------|-------------|---------------|
| `list_escalation_policies` | List existing escalation policies | Optional filters: current_user_context, query, user_ids, team_ids, limit |
| `show_escalation_policy` | Get detailed information about a specific escalation policy | policy_id |

## Usage Examples

```python
# Example: Listing active incidents for the current user's teams
response = await claude.use_mcp_tool(
    server_name="pagerduty",
    tool_name="list_incidents",
    arguments={
        "statuses": ["triggered", "acknowledged"]
    }
)

# Example: Finding who is currently on-call
response = await claude.use_mcp_tool(
    server_name="pagerduty",
    tool_name="list_oncalls",
    arguments={}
)

# Example: Getting details about a specific service
response = await claude.use_mcp_tool(
    server_name="pagerduty",
    tool_name="show_service",
    arguments={
        "service_id": "PXYZ123"
    }
)
```

## Response Format

All API responses follow a consistent format:

```json
{
  "metadata": {
    "count": <int>,  // Number of results
    "description": "<str>"  // A short summary of the results
  },
  <resource_type>: [ // Always pluralized for consistency, even if one result is returned
    {
      ...
    },
    ...
  ],
  "error": {  // Only present if there's an error
    "message": "<str>",  // Human-readable error description
    "code": "<str>"  // Machine-readable error code
  }
}
```

## References

- [Official Documentation](https://github.com/wpfleger96/pagerduty-mcp-server/blob/main/docs/tools.md)
- [GitHub Repository](https://github.com/wpfleger96/pagerduty-mcp-server)
- [PyPI Package](https://pypi.org/project/pagerduty-mcp-server/)