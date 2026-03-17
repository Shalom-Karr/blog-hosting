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

-- 2. Enable Row Level Security (RLS)
ALTER TABLE public.posts ENABLE ROW LEVEL SECURITY;

-- 3. Create Security Policies
-- Allow anyone to read published posts
CREATE POLICY "Public posts are viewable by everyone"
ON public.posts FOR SELECT
USING (is_published = true);

-- Allow authenticated users (you) to read all posts, including drafts
CREATE POLICY "Authenticated users can read all posts"
ON public.posts FOR SELECT
USING (auth.role() = 'authenticated');

-- Allow authenticated users to insert, update, and delete posts
CREATE POLICY "Authenticated users can insert posts"
ON public.posts FOR INSERT
WITH CHECK (auth.role() = 'authenticated');

CREATE POLICY "Authenticated users can update posts"
ON public.posts FOR UPDATE
USING (auth.role() = 'authenticated');

CREATE POLICY "Authenticated users can delete posts"
ON public.posts FOR DELETE
USING (auth.role() = 'authenticated');
