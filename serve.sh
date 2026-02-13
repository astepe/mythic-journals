#!/usr/bin/env bash
# Build the combined site and serve it locally at http://localhost:4000
# Requires Docker (start Docker Desktop first) or Ruby 3+ with bundle install in parent and each realm

set -e
cd "$(dirname "$0")"

if command -v docker >/dev/null 2>&1; then
  if docker info >/dev/null 2>&1; then
    echo "Building and serving Mythic Bastionland Journals with Docker..."
    echo "First run may take a few minutes (building parent + braeburn + cloverfell + ferngully)."
    echo "Open http://localhost:4000/ in your browser (realm picker)."
    echo "Press Ctrl+C to stop"
    TTY_FLAG=""
    [ -t 0 ] && [ -t 1 ] && TTY_FLAG="-it"
    docker run --rm $TTY_FLAG -p 4000:4000 \
      -v "$(pwd):/var/jekyll" \
      -v mythic-journals-bundle-arm64:/usr/local/bundle \
      -w /var/jekyll mrxder/jekyll-docker-arm64:latest \
      bash -c "bundle config set --local path /usr/local/bundle && bundle install && ./build.sh && echo 'Serving at http://localhost:4000/' && python3 -m http.server 4000 --directory _site"
    exit 0
  else
    echo "Docker is installed but the daemon is not running."
    echo "Start Docker Desktop, then run: ./serve.sh"
    exit 1
  fi
fi

# Fallback: build and serve with local Ruby/Bundler
if command -v bundle >/dev/null 2>&1; then
  echo "Building combined site..."
  ./build.sh
  echo "Serving at http://localhost:4000/"
  python3 -m http.server 4000 --directory _site
  exit 0
fi

echo "To run the site locally, use one of:"
echo "  1. Start Docker Desktop, then run: ./serve.sh"
echo "  2. Install Ruby 3+ and run: ./build.sh && python3 -m http.server 4000 --directory _site"
exit 1
