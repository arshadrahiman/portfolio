#!/bin/bash
set -e

export PATH="/Users/arshadulrahman/.local/node/bin:$PATH"

echo "🚀 Starting Deployment to about-me repository..."

# 1. Build the React project
echo "📦 Building React Website with Vite..."
npm run build

# 2. Prepare the about-me directory
echo "🧹 Preparing about-me directory..."
cd about-me
git fetch origin
git reset --hard origin/production
cd ..

# We want to keep .git and CNAME but delete everything else (old flutter web artifacts, etc.)
find about-me -maxdepth 1 -not -name 'about-me' -not -name '.git' -not -name 'CNAME' -exec rm -rf {} +

# 3. Copy build files from dist
echo "📂 Copying React build artifacts from dist/ to about-me/..."
cp -r dist/* about-me/

# 4. Ensure CNAME file for custom domain www.arshadrahman.in
echo "🌐 Ensuring CNAME file for www.arshadrahman.in..."
echo "www.arshadrahman.in" > about-me/CNAME

# 5. Commit and push to about-me repository
echo "📤 Committing and pushing to production..."
cd about-me
git add .
git commit -m "Deploy: React Website release ($(date))" || echo "No changes to commit"
git push origin production

echo "✅ Deployment to about-me (GitHub Pages) successful!"
