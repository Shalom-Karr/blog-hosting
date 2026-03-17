-- Run this script in your Supabase SQL Editor

-- 1. Create the posts table
CREATE TABLE public.posts (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  slug text UNIQUE NOT NULL,
  title text NOT NULL,
  content_md text NOT NULL,
  excerpt text,
  tags text[] DEFAULT '{}'::text[],
  created_at timestamp with time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
  updated_at timestamp with time zone,
  is_published boolean DEFAULT false
);

-- 2. Create the site_settings table (for Name, Bio, and Avatar)
CREATE TABLE public.site_settings (
  id integer PRIMARY KEY DEFAULT 1,
  name text DEFAULT 'Your Name',
  bio text DEFAULT 'Full-stack developer building cool things on the internet.',
  avatar_url text DEFAULT 'https://via.placeholder.com/150'
);

-- Enforce single row for settings
ALTER TABLE public.site_settings ADD CONSTRAINT single_row CHECK (id = 1);

-- 3. Enable Row Level Security (RLS)
ALTER TABLE public.posts ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.site_settings ENABLE ROW LEVEL SECURITY;

-- 4. Create Security Policies for Posts
CREATE POLICY "Public posts are viewable by everyone" ON public.posts FOR SELECT USING (is_published = true);
CREATE POLICY "Authenticated users can read all posts" ON public.posts FOR SELECT USING (auth.role() = 'authenticated');
CREATE POLICY "Authenticated users can insert posts" ON public.posts FOR INSERT WITH CHECK (auth.role() = 'authenticated');
CREATE POLICY "Authenticated users can update posts" ON public.posts FOR UPDATE USING (auth.role() = 'authenticated');
CREATE POLICY "Authenticated users can delete posts" ON public.posts FOR DELETE USING (auth.role() = 'authenticated');

-- 5. Create Security Policies for Site Settings
CREATE POLICY "Public settings are viewable by everyone" ON public.site_settings FOR SELECT USING (true);
CREATE POLICY "Authenticated users can update settings" ON public.site_settings FOR UPDATE USING (auth.role() = 'authenticated');
CREATE POLICY "Authenticated users can insert settings" ON public.site_settings FOR INSERT WITH CHECK (auth.role() = 'authenticated');

-- 6. Insert default settings
INSERT INTO public.site_settings (id, name, bio, avatar_url) VALUES (1, 'Your Name', 'Full-stack developer building cool things on the internet.', 'https://via.placeholder.com/150') ON CONFLICT DO NOTHING;
