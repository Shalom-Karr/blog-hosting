#!/bin/bash
# scripts/inject-env.sh
# This script runs during the Cloudflare Pages build process.
# It creates a global window.ENV object with the Supabase credentials.

echo "Injecting Environment Variables..."

# Create the js/env.js file
cat <<EOF > js/env.js
window.ENV = {
  SUPABASE_URL: "${SUPABASE_URL}",
  SUPABASE_ANON_KEY: "${SUPABASE_ANON_KEY}"
};
EOF

echo "js/env.js created successfully!"