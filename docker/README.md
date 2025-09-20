# MeshView Docker Container

This Dockerfile builds a containerized version of the [MeshView](https://github.com/pablorevilla-meshtastic/meshview) application. It uses a lightweight Python environment and sets up the required virtual environment as expected by the application.

## Image Details

- **Base Image**: `python:3.12-slim`
- **Working Directory**: `/app`
- **Python Virtual Environment**: `/app/env`
- **Exposed Port**: `8081`

## Build Instructions

Build the Docker image:

```bash
docker build -t meshview-docker-image .
```

## Run Instructions (docker-compose)

- Setup the config.ini (prior to building or with docker volume pointing to a new one).
- Ensure that the packets.db file exists (use touch command) and use docker volume for persistence.
- Configure the compose file.
- Run the stack (docker-compose.yml). 

```bash
docker-compose up -d
```
