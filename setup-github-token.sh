#!/bin/bash

# Setup GitHub token for pushing to repository

echo "🔐 GitHub Token Setup for PI-GENERATOR-APP"
echo "========================================="

# Check if token already exists
if git credential-osxkeychain get <<< "
protocol=https
host=github.com
" | grep -q "password="; then
    echo "✅ GitHub token already configured in keychain"
    echo "Trying to push..."
    git push -u origin main
    exit $?
fi

echo "📝 To push to GitHub, you need a Personal Access Token (PAT)."
echo ""
echo "Follow these steps:"
echo ""
echo "1. Visit: https://github.com/settings/tokens"
echo "2. Click 'Generate new token (classic)'"
echo "3. Select 'repo' scope (all permissions)"
echo "4. Generate token and COPY it (you won't see it again!)"
echo ""
echo "5. Paste your token here (it will be saved securely in macOS keychain):"

# Read token securely
read -sp "GitHub Token: " GITHUB_TOKEN
echo ""

if [ -z "$GITHUB_TOKEN" ]; then
    echo "❌ No token provided. Exiting."
    exit 1
fi

# Store token in keychain
git credential-osxkeychain store <<EOF
protocol=https
host=github.com
username=personal-access-token
password=$GITHUB_TOKEN
EOF

echo "✅ Token saved to macOS keychain"
echo ""
echo "🔄 Pushing to GitHub..."

# Try to push
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "🎉 Success! Your code is now on GitHub."
    echo "🌐 Visit: https://github.com/tommycoltd-boop/PI-GENERATOR-APP"
    echo ""
    echo "Next: Enable GitHub Pages in repository settings to get HTTPS link."
else
    echo ""
    echo "❌ Push failed. Please check:"
    echo "   - Token has correct permissions (repo scope)"
    echo "   - Repository exists: https://github.com/tommycoltd-boop/PI-GENERATOR-APP"
    echo "   - You have write access to the repository"
fi