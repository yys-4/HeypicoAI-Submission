# Simple Flask Web Application with Docker Compose and NGINX Load Balancer

This project is a simple "Hello, World!" style web application using Flask. It is containerized using Docker and run as two separate services using Docker Compose. An NGINX server is also included in the Docker Compose setup to act as a round-robin load balancer between the two application instances.

## Application Code (`task5/app.py`)

This is the main application file. It's a simple Flask web server that displays a greeting message. The message is retrieved from the `SERVER_MESSAGE` environment variable. If the variable is not set, it defaults to "Hello from an unknown server!".

## Containerization (`task5/Dockerfile`)

This file contains the instructions to build a Docker image for the application. It uses a Python base image, installs the dependencies from `requirements.txt`, copies the application code, and sets the command to run the application.

## Services and Load Balancing (`task5/docker-compose.yml` and `task5/nginx.conf`)

The `docker-compose.yml` file defines the services that make up the application:

*   **`webapp1` & `webapp2`**: Two instances of the Flask application, each with a different `SERVER_MESSAGE`.
*   **`nginx-proxy`**: An NGINX service that acts as a reverse proxy for the two web applications.

The `nginx.conf` file configures the NGINX server to perform round-robin load balancing between `webapp1` and `webapp2`.

## How to Run

1.  Make sure you have Docker and Docker Compose installed.
2.  Navigate to the `task5` directory.
3.  Run the following command:
    ```bash
    docker-compose up
    ```
4.  Open your web browser and navigate to `http://localhost`. You should see a message from one of the servers. If you refresh the page, you should see the message change as NGINX routes you to the other server.
