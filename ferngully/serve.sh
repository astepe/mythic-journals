#!/usr/bin/env bash
# Serve the Fern Gully Jekyll site locally at http://localhost:4000
# Requires Docker (start Docker Desktop first) or Ruby 3+ with `bundle install`

set -e
cd "$(dirname "$0")"

if command -v docker >/dev/null 2>&1; then
  if docker info >/dev/null 2>&1; then
    echo "Starting Jekyll with Docker (ARM64 native on Apple Silicon)..."
    echo "First build may take a moment. You'll see 'Server running...' when ready."
    echo "Open http://localhost:4000/ferngully/ in your browser"
    echo "Press Ctrl+C to stop"
    # Use -it when running in a real terminal so Ctrl+C is forwarded to the container
    TTY_FLAG=""
    [ -t 0 ] && [ -t 1 ] && TTY_FLAG="-it"
    docker run --rm $TTY_FLAG -p 4000:4000 \
      -v "$(pwd):/var/jekyll" \
      -v ferngully-bundle-arm64:/usr/local/bundle \
      -w /var/jekyll mrxder/jekyll-docker-arm64:latest \
      jekyll serve --host 0.0.0.0 --force_polling
    exit 0
  else
    echo "Docker is installed but the daemon is not running."
    echo "Start Docker Desktop, then run: ./serve.sh"
    exit 1
  fi
fi

# Fallback: try bundle exec (needs Ruby 3+ and bundle install)
if command -v bundle >/dev/null 2>&1; then
  echo "Starting Jekyll with Bundler..."
  echo "Open http://localhost:4000/ferngully/ in your browser"
  bundle exec jekyll serve
  exit 0
fi

echo "To run the site locally, use one of:"
echo "  1. Start Docker Desktop, then run: ./serve.sh"
echo "  2. Install Ruby 3+ and run: bundle install && bundle exec jekyll serve"
exit 1
