# Mythic Bastionland Journals

A single site that combines three campaign journals: **Ballads of Braeburn**, **Chronicles of Cloverfell**, and **Fern Gully Annals**. The home page lets you choose a realm; each link goes to that realm’s full sub-site.

## Structure

- **Root** — Realm picker (home page with links to each journal).
- **/braeburn/** — Ballads of Braeburn (full site).
- **/cloverfell/** — Chronicles of Cloverfell (full site).
- **/ferngully/** — Fern Gully Annals (full site).

The `braeburn`, `cloverfell`, and `ferngully` directories are copies of those projects. To refresh them from the originals, re-run your copy/rsync from `Projects/Code/` into this repo (see “Updating a realm” below).

## Build

From this directory:

```bash
./build.sh
```

This will:

1. Build the parent site (realm picker) into `_site/`.
2. Build each realm (`braeburn`, `cloverfell`, `ferngully`) and merge its output into `_site/braeburn/`, `_site/cloverfell/`, `_site/ferngully/`.

You need Ruby 3+ and Bundler, or use Docker (e.g. the same `serve.sh`-style approach as in each realm) to run Jekyll.

## Serve locally

After building, serve the combined site from `_site/`, e.g.:

```bash
# After ./build.sh, from this directory:
bundle exec jekyll serve
# Or use Docker if you use it for the sub-projects
```

Then open the root URL (e.g. `http://localhost:4000/`). Use the same `baseurl` as for production (see below) when testing.

## Deploy (GitHub Pages)

The repo includes a workflow (`.github/workflows/deploy-pages.yml`) that runs `./build.sh` and deploys the combined `_site/` to GitHub Pages. **You must use this** so that the realm sub-sites (Braeburn, Cloverfell, Ferngully) are built and included; the default “build from branch” only builds the root and would 404 on realm links.

1. In the repo: **Settings → Pages → Build and deployment → Source** choose **GitHub Actions** (not “Deploy from a branch”).
2. Push to `main`; the workflow builds and deploys. The site will be at `https://<username>.github.io/mythic-journals/`.

`baseurl` is already set to `/mythic-journals` in the configs for that URL.

## Updating a realm

To pull in the latest content for one realm from the original project (e.g. after editing braeburn in `Projects/Code/braeburn`):

```bash
# From Projects/Code/
rsync -a --exclude='_site' --exclude='.jekyll-cache' --exclude='.git' braeburn/ mythic-journals/braeburn/
```

Then run `./build.sh` again from `mythic-journals/`.
