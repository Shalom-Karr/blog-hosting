// js/supabase-client.js

// Safely check for environment variables
function getEnv(key, fallback) {
    if (typeof window !== 'undefined' && window.ENV && window.ENV[key]) return window.ENV[key];
    return fallback;
}

const SUPABASE_URL = getEnv('SUPABASE_URL', 'YOUR_SUPABASE_PROJECT_URL');
const SUPABASE_ANON_KEY = getEnv('SUPABASE_ANON_KEY', 'YOUR_SUPABASE_ANON_KEY');

// Initialize the global supabase client (requires the CDN script in your HTML)
const supabaseClient = window.supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);
