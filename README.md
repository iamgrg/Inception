# Inception

## Overview

Inception is a System Administration and Networking project focused on using Docker to create a multi-container development environment. This project simulates a small infrastructure where each service runs in its own container, using Docker and Docker Compose.

## Objectives

- Learn to virtualize services using Docker containers.
- Understand the interaction between containers.
- Manage data persistence through Docker volumes.
- Secure services with TLS.

## Build Instructions

Use the provided Makefile to automate the setup of the entire infrastructure:
```bash
make all
```

## Usage

Once the containers are set up, the services can be accessed through the configured domain names and ports as specified in the Docker Compose configuration file.

## Features

- Nginx Container: Configured to handle HTTPS traffic only, serving as the reverse proxy to other services.
- WordPress Container: Runs WordPress with PHP-FPM, without Nginx within the same container.
- MariaDB Container: Provides a MariaDB server for the WordPress database.
- Volumes: Two volumes to persist the WordPress database and files.
- Networking: Custom Docker network to facilitate secure and efficient communication between containers.

## Configuration

All configurations are managed through Dockerfiles and a docker-compose.yml located in the srcs directory.
Environment variables and other configurations are managed through a .env file for better security and flexibility.

## Containers Setup

- Nginx: Configured for HTTPS using TLSv1.2 or TLSv1.3.
- WordPress: Integrated with PHP-FPM for dynamic content management.
- MariaDB: Used for database management, isolated from other services for security.

## Security
- HTTPS setup with TLSv1.2 or TLSv1.3.
- Environment variables are used to manage sensitive information, ensuring no sensitive data is hard-coded into Dockerfiles or images.

## Directory Structure

bash
```
/
├── Makefile
├── srcs
│   ├── docker-compose.yml
│   ├── .env
│   └── requirements
│       ├── nginx
│       │   ├── Dockerfile
│       │   ├── .dockerignore
│       │   └── conf
│       ├── mariadb
│       │   ├── Dockerfile
│       │   ├── .dockerignore
│       │   └── conf
│       └── wordpress
│           ├── Dockerfile
│           ├── .dockerignore
│           └── conf
```

## Contributors

- @iamgrg

## License

![MIT License](https://img.shields.io/badge/license-MIT-green)
Distributed under the MIT License.
