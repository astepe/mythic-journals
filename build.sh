#!/usr/bin/env bash
# Build the combined Mythic Bastionland Journals site:
# 1. Build the parent (realm picker) into _site
# 2. Build each realm sub-site and merge into _site/braeburn, _site/cloverfell, _site/ferngully

set -e
cd "$(dirname "$0")"

echo "Building parent site..."
bundle exec jekyll build

for realm in braeburn cloverfell ferngully; do
  if [ ! -d "$realm" ]; then
    echo "Skipping $realm (directory not found)"
    continue
  fi
  echo "Building $realm..."
  (cd "$realm" && bundle exec jekyll build)
  echo "Merging $realm into _site/$realm..."
  rm -rf "_site/$realm"
  cp -r "$realm/_site" "_site/$realm"
done

echo "Done. Output is in _site/"
