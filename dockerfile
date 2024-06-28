FROM mcr.microsoft.com/devcontainers/base:ubuntu

# Install the xz-utils package
RUN apt-get update && apt-get install -y xz-utils curl

# Install Go 1.22.4
RUN curl -OL https://golang.org/dl/go1.22.4.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.22.4.linux-amd64.tar.gz && \
    rm go1.22.4.linux-amd64.tar.gz

# Set up Go environment variables
ENV PATH="/usr/local/go/bin:${PATH}"

# Verify Go installation
RUN go version
