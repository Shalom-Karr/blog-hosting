# Static Blog Framework

A lightweight, static, markdown-first blog framework designed to easily integrate into a personal profile site. Built with Vanilla JS, styled with Tailwind CSS, and powered by Supabase. It is completely static and ready to be deployed to Cloudflare Pages with zero build steps.

## ✨ Features

- **Zero Build Steps:** Pure HTML, CSS, and Vanilla JS.
- **Headless CMS:** Powered by [Supabase](https://supabase.com/) (PostgreSQL + Auth) for secure data storage and authentication.
- **Markdown Support:** Client-side markdown parsing using [`marked.js`](https://marked.js.org/).
- **Rich Admin Editor:** Manage your posts with a beautiful, built-in markdown editor using [EasyMDE](https://github.com/Ionaru/easy-markdown-editor).
- **Dark Mode:** Built-in Dark/Light theme toggle using Tailwind CSS and `localStorage`.
- **Dev Mode:** Mock login feature in the Admin panel to test the UI and editor locally without needing a Supabase database connection.
- **Responsive Layout:** Clean, readable, sidebar-based layout optimized for reading.

## 🛠️ Tech Stack

- **Frontend:** HTML5, Vanilla JS
- **Styling:** [Tailwind CSS](https://tailwindcss.com/) (via CDN) + Tailwind Typography
- **Backend/Database:** [Supabase](https://supabase.com) (PostgreSQL & GoTrue Auth)
- **Deployment:** Designed for [Cloudflare Pages](https://pages.cloudflare.com/)

---

## 🚀 Getting Started

### 1. Database Setup (Supabase)

1. Create a new project at [Supabase](https://supabase.com).
2. Go to the **SQL Editor** in your Supabase dashboard.
3. Copy the contents of `supabase_schema.sql` from this repository and run it. This will create the `posts` table and set up the necessary Row Level Security (RLS) policies.
4. Go to **Authentication > Users** in Supabase and create a new user with an email and password. This will be your admin login.

### 2. Connect Your Frontend

1. Open `js/supabase-client.js`.
2. Replace `YOUR_SUPABASE_PROJECT_URL` and `YOUR_SUPABASE_ANON_KEY` with your actual project details.
   *(You can find these in your Supabase Dashboard under **Project Settings > API**).*

### 3. Run Locally

Because the app uses JavaScript modules and fetches data asynchronously, you need to serve the files using a local web server (opening `index.html` directly in the browser via `file://` will cause CORS issues).

Using Python (if installed):
```bash
# Python 3
python -m http.server 8000
```

Using Node.js (npx):
```bash
npx serve .
```

Then, open your browser and go to `http://localhost:8000`.

### 4. Admin Dashboard

Navigate to `http://localhost:8000/admin/index.html` to manage your blog.

- **Production Mode:** Log in using the email and password you created in Supabase to create, edit, and publish real posts.
- **Dev Mode:** Click "Enter Dev Mode (Mock Login)" to bypass authentication and use a mock database. This is great for testing the editor UI and styling locally without affecting your real database.

---

## ☁️ Deployment

This project is perfectly suited for **Cloudflare Pages**, GitHub Pages, Vercel, or Netlify.

**To deploy to Cloudflare Pages:**
1. Push this repository to GitHub.
2. Log into Cloudflare Dashboard > Pages > Create a project > Connect to Git.
3. Select your repository.
4. **Important**: Under **Build settings**, set the **Build command** to:
   ```bash
   bash scripts/inject-env.sh
   ```
5. Set the **Build output directory** to: `.` *(just a single dot)*.
6. Under **Environment variables**, add `SUPABASE_URL` and `SUPABASE_ANON_KEY` and populate them with your Supabase API keys.
7. Deploy!

*(Note: Since Supabase keys in this project are anonymous public keys restricted by RLS, it is safe for them to be exposed in the frontend client code).*

## 📄 License

MIT License. Do whatever you want with this code!