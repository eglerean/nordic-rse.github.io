# Docker Development Setup

Simple Docker setup for developing the Nordic RSE website with live reload.

## Quick Start

Start the development server:

```bash
docker compose up
```

The site will be available at **http://localhost:1111**

Any changes you make to your files on the host machine will automatically:
- Trigger a rebuild
- Refresh your browser

## Prerequisites

- Docker (version 20.10 or later)
- Docker Compose (version 2.0 or later)

## Usage

### Start the server

```bash
docker compose up
```

Or run in detached mode (background):

```bash
docker compose up -d
```

### Stop the server

Press `Ctrl+C` in the terminal, or if running detached:

```bash
docker compose down
```

### View logs

```bash
docker compose logs -f
```

### Rebuild the container

If you update the Dockerfile or need a fresh build:

```bash
docker compose up --build
```

## How It Works

1. The `Dockerfile` uses the official Zola Docker image
2. `docker-compose.yml` mounts your project directory into the container
3. Zola runs in `serve` mode with file watching enabled
4. Changes to any files (content, templates, config) trigger automatic rebuilds
5. The browser automatically refreshes when changes are detected

## Development Workflow

1. **Start the server:**
   ```bash
   docker compose up
   ```

2. **Edit files on your host machine:**
   - Modify markdown files in `content/`
   - Update templates in `templates/`
   - Change styles in `static/css/`
   - Edit `config.toml`

3. **See changes instantly in your browser at http://localhost:1111**

4. **Stop when done:**
   - Press `Ctrl+C`

## Customization

### Change Port

Edit `docker-compose.yml` to use a different port:

```yaml
ports:
  - "3000:1111"  # Expose on port 3000 instead
```

### Change Base URL

If you need a different base URL for development, edit the `CMD` in the `Dockerfile`:

```dockerfile
CMD ["zola", "serve", "--interface", "0.0.0.0", "--port", "1111", "--base-url", "http://your-url:1111"]
```

## Troubleshooting

### Port Already in Use

If port 1111 is already in use, either:
- Stop the conflicting service
- Change the port in `docker-compose.yml`

### Changes Not Reflecting

1. Check if the container is running:
   ```bash
   docker compose ps
   ```

2. View logs for errors:
   ```bash
   docker compose logs
   ```

3. Rebuild the container:
   ```bash
   docker compose down
   docker compose up --build
   ```
## Resources

- [Zola Documentation](https://www.getzola.org/documentation/)
- [Zola Docker Deployment Guide](https://www.getzola.org/documentation/deployment/docker-image/)
- [Docker Compose Documentation](https://docs.docker.com/compose/)
