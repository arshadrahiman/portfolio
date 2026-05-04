#!/bin/bash
set -e

echo "🚀 Starting Deployment to about-me repository..."

# 1. Build the project
echo "📦 Building Flutter Web..."
flutter build web --base-href "/about-me/"

# 2. Prepare the about-me directory
echo "🧹 Preparing about-me directory..."
# We want to keep .git but delete everything else
find about-me -maxdepth 1 -not -name 'about-me' -not -name '.git' -exec rm -rf {} +

# 3. Copy build files
echo "📂 Copying build artifacts..."
cp -r build/web/* about-me/

# 4. Commit and push
echo "📤 Committing and pushing to production..."
cd about-me
git add .
git commit -m "Deploy: Localization and language toggle features ($(date))" || echo "No changes to commit"
git push origin production

echo "✅ Deployment to about-me successful!"
