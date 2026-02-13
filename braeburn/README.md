# Ballads of Braeburn

A Mythic Bastionland campaign journal, built with Jekyll and hosted on GitHub Pages.

## Setup

1. Create a new GitHub repository named `braeburn`
2. Push all these files to the `main` branch
3. Go to **Settings → Pages**
4. Under "Source," select **Deploy from a branch** → `main` → `/ (root)`
5. Wait a minute or two, then visit `https://yourusername.github.io/braeburn/`

If your repo has a different name, update the `baseurl` in `_config.yml` to match (e.g., `baseurl: "/your-repo-name"`).

## Adding a New Chapter

1. Create a new file in `_chapters/` named `chapter-N.md`
2. Use this front matter template:

```yaml
---
layout: chapter
title: "Your Chapter Title"
chapter_number: 3
description: "One-line summary of the chapter."
previous_chapter: /chapters/chapter-2/
---
```

3. Write your chapter content in markdown below the front matter
4. Update the previous chapter's front matter to add `next_chapter: /chapters/chapter-3/`
5. Commit and push — the site rebuilds automatically

## Structure

```
_config.yml          # Site configuration
_layouts/
  default.html       # Base layout (header, nav, footer)
  chapter.html       # Chapter page layout (with prev/next nav)
_chapters/           # Chapter write-ups (auto-listed on /chapters/)
  chapter-1.md
  chapter-2.md
assets/css/
  style.css          # All styling
index.md             # Homepage
the-company.md       # Player character profiles
chapters.md          # Chapter index page
npcs.md              # NPC tracker
the-realm.md         # Holdings, myths, loose threads
```

## Updating Content

All pages are plain markdown files. Edit any `.md` file, commit, and push. GitHub Pages rebuilds automatically within a couple minutes.
