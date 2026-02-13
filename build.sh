#!/usr/bin/env bash
# Build the combined Mythic Bastionland Journals site:
# 1. Build the parent (realm picker) into _site
# 2. Build each realm directly into _site/<realm> using root Bundler env

set -e
cd "$(dirname "$0")"

echo "Building parent site..."
bundle exec jekyll build

for realm in braeburn cloverfell ferngully; do
  if [ ! -d "$realm" ]; then
    echo "Skipping $realm (directory not found)"
    continue
  fi
  echo "Building $realm into _site/$realm..."
  bundle exec jekyll build \
    --source "$realm" \
    --destination "_site/$realm" \
    --config "$realm/_config.yml"
done

touch _site/.nojekyll
echo "Done. Output is in _site/"
