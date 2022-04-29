# Kafka Schema Registry Examples

This repo provides a cli tool that allows execute operations over a Confluent schema registry instance. Use this tool only for academic use cases.

### Dependencies
- Make
- Docker
- Confluent Schema Registry

### Build CLI tool:

```bash
make build
```

### Run CLI tool:

```bash
make cli
```

## Setup

### Environment Variables

| Name                | Default Value         | Description                                                       |   |
|---------------------|-----------------------|-------------------------------------------------------------------|---|
| SCHEMA_REGISTRY_URL | http://127.0.0.1:8081 | The CLI tool is going to connect to this schema registry instance |   |