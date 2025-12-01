# Development Dockerfile with hot reload support
FROM ghcr.io/getzola/zola:v0.17.1

WORKDIR /app

# Expose Zola's default development server port
EXPOSE 1111
# Expose the livereload WebSocket port
EXPOSE 1024

# Start Zola in serve mode with watch for live reload
# Bind to 0.0.0.0 to make it accessible from outside the container
CMD ["serve", "--interface", "0.0.0.0", "--port", "1111"]

