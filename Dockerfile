# Use the latest Ubuntu image
FROM ubuntu:latest

# Update and install required packages
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    sudo

# Install Visual Studio Code (code-server)
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Set the working directory
WORKDIR /app

# Expose port 8080
EXPOSE 8080

# Start code-server on port 8080 without authentication
CMD ["code-server", "--bind-addr=0.0.0.0:8080", "--auth=none", "--user-data-dir=/app/data"
