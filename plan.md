# Static Blog Framework Implementation Plan

## Overview
A lightweight, static, markdown-first blog framework for a profile site. Designed to be hosted on Cloudflare Pages with zero build steps, using Supabase as a headless backend and database.

## Tech Stack
- **Hosting:** Cloudflare Pages (Static HTML/CSS/JS).
- **Backend/Database/Auth:** Supabase (PostgreSQL, Row Level Security, GoTrue Auth).
- **Frontend UI:** HTML + Vanilla CSS (Custom properties for light/dark theming).
- **Frontend UX & Logic:** Vanilla JS.
- **Markdown Parsing:** `marked.js` (Client-side rendering).

## Data Model (Supabase)
**Table: `posts`**
- `id` (uuid, primary key)
- `slug` (text, unique)
- `title` (text)
- `content_md` (text)
- `excerpt` (text)
- `tags` (text array)
- `created_at` (timestamp)
- `updated_at` (timestamp)
- `is_published` (boolean)

**Security (Row Level Security - RLS):**
- **Public:** Can `SELECT` where `is_published = true`.
- **Authenticated (Admin):** Can `SELECT`, `INSERT`, `UPDATE`, `DELETE` all records.

## Phases of Development

### Phase 1: Foundation (Completed)
- [x] Pivot architecture from Python/Flask to Static Vanilla JS.
- [x] Generate `supabase_schema.sql` for PostgreSQL setup and RLS policies.
- [x] Set up base HTML, CSS, and JS file structure.
- [x] Implement dark/light mode toggle with `localStorage`.

### Phase 2: Core Views & Integration (Completed)
- [x] Initialize Supabase JS client (`js/supabase-client.js`).
- [x] Implement Profile root page (`index.html`).
- [x] Implement Blog Index page (`blog/index.html`) to dynamically fetch and display published posts.
- [x] Implement Single Post page (`blog/post.html`) to fetch by URL slug and render Markdown to HTML via `marked.js`.

### Phase 3: Admin Dashboard (Completed)
- [x] Create Admin login UI (`admin/index.html`).
- [x] Integrate Supabase Authentication (Email/Password).
- [x] Create post editor form (Title, Slug, Excerpt, Tags, Content, Publish toggle).
- [x] Implement insert logic to save new Markdown posts securely to the database.

### Phase 4: Polish & Extensions (Next Steps)
- [ ] Implement Tag Cloud and Tag filtering (fetch posts by specific tags).
- [ ] Implement Timeline grouping for posts (group by year/month).
- [ ] Enhance embeds: Client-side JS to parse specific shortcodes or links and convert them into iframes (e.g., YouTube/Twitter).
- [ ] Add post editing capabilities to the admin dashboard (Update/Delete).
