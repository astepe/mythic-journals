# Mythic Bastionland Journals

A single site that combines three campaign journals: **Ballads of Braeburn**, **Chronicles of Cloverfell**, and **Fern Gully Annals**. The home page lets you choose a realm; each link goes to that realm's full sub-site.

## Structure

- **Root** — Realm picker (home page with links to each journal).
- **`_shared/`** — Shared layouts, CSS, and scripts used by all realms.
- **`braeburn/`** — Ballads of Braeburn (content + realm-specific config).
- **`cloverfell/`** — Chronicles of Cloverfell (content + realm-specific config).
- **`ferngully/`** — Fern Gully Annals (content + realm-specific config).

### Shared vs. realm-specific

Each realm directory contains only **realm-specific content** (chapters, pages, images, and `_config.yml`). Shared assets are symlinked from `_shared/`:

| File | Points to |
|------|-----------|
| `<realm>/_layouts/default.html` | `_shared/_layouts/default.html` |
| `<realm>/_layouts/chapter.html` | `_shared/_layouts/chapter.html` |
| `<realm>/assets/css/style.css` | `_shared/assets/css/style.css` |
| `<realm>/serve.sh` | `_shared/serve.sh` |
| `<realm>/Gemfile` | Root `Gemfile` |
| `<realm>/Gemfile.lock` | Root `Gemfile.lock` |

The shared `default.html` layout is **data-driven** — it reads `realm_title_line1` and `realm_title_line2` from each realm's `_config.yml` to render the header, and uses `site.title` for the footer. This means you never need to edit layouts when adding a new realm; just set the config vars.

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

The repo includes a workflow (`.github/workflows/deploy-pages.yml`) that runs `./build.sh` and deploys the combined `_site/` to GitHub Pages. **You must use this** so that the realm sub-sites (Braeburn, Cloverfell, Ferngully) are built and included; the default "build from branch" only builds the root and would 404 on realm links.

1. In the repo: **Settings → Pages → Build and deployment → Source** choose **GitHub Actions** (not "Deploy from a branch").
2. Push to `main`; the workflow builds and deploys. The site will be at `https://<username>.github.io/mythic-journals/`.
3. If the home page loads but realm links return 404, re-check that Pages source is still set to **GitHub Actions**.

`baseurl` is already set to `/mythic-journals` in the configs for that URL.

## Adding a new realm

1. Create a new directory (e.g. `newrealm/`) with `_config.yml`, content pages, `_chapters/`, and `assets/images/`.
2. In `_config.yml`, set `title`, `realm_title_line1`, `realm_title_line2`, `baseurl`, etc.
3. Create the symlinks:
   ```bash
   cd newrealm
   mkdir -p _layouts assets/css
   ln -s ../../_shared/_layouts/default.html _layouts/default.html
   ln -s ../../_shared/_layouts/chapter.html _layouts/chapter.html
   ln -s ../../../_shared/assets/css/style.css assets/css/style.css
   ln -s ../_shared/serve.sh serve.sh
   ln -s ../Gemfile Gemfile
   ln -s ../Gemfile.lock Gemfile.lock
   ```
4. Add `newrealm` to the realm list in `build.sh` and to `index.md`.
5. Add `newrealm` to the `exclude` list in the root `_config.yml`.
