// js/supabase-client.js

// Safely check for environment variables across different environments (Vite, Webpack, or a window global)
function getEnv(key, fallback) {
    if (typeof import.meta !== 'undefined' && import.meta.env && import.meta.env[key]) return import.meta.env[key];
    if (typeof process !== 'undefined' && process.env && process.env[key]) return process.env[key];
    if (typeof window !== 'undefined' && window.ENV && window.ENV[key]) return window.ENV[key];
    return fallback;
}

const SUPABASE_URL = getEnv('VITE_SUPABASE_URL', getEnv('SUPABASE_URL', 'YOUR_SUPABASE_PROJECT_URL'));
const SUPABASE_ANON_KEY = getEnv('VITE_SUPABASE_ANON_KEY', getEnv('SUPABASE_ANON_KEY', 'YOUR_SUPABASE_ANON_KEY'));

// Initialize the global supabase client (requires the CDN script in your HTML)
const supabaseClient = window.supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);
