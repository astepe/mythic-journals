---
layout: default
title: Chapters
permalink: /chapters/
---

<h1 class="page-title">Chapters</h1>
<p class="page-description">A record of what has transpired in the realm of Braeburn — what the knight and his squire have seen and endured.</p>

<ul class="card-list">
  {% assign chapters = site.chapters %}
  {% if chapters %}{% assign chapters = chapters | sort: 'chapter_number' | reverse %}{% endif %}
  {% for chapter in chapters %}
  <li>
    <a href="{{ chapter.url | relative_url }}" class="card">
      <div class="card-title">{{ chapter.title }}</div>
      <div class="card-meta">Chapter {{ chapter.chapter_number }}</div>
      <div class="card-excerpt">{{ chapter.description }}</div>
    </a>
  </li>
  {% endfor %}
</ul>
