#!/bin/bash

# Smart Contract Generator - GitHub Deployment Script
# This script helps deploy the contract generator to GitHub Pages

set -e

echo "🚀 Smart Contract Generator - GitHub Deployment"
echo "=============================================="

# Check prerequisites
echo "📋 Checking prerequisites..."
if ! command -v git &> /dev/null; then
    echo "❌ Git is not installed. Please install git first."
    exit 1
fi

if ! command -v gh &> /dev/null; then
    echo "⚠️  GitHub CLI (gh) is not installed."
    echo "   You can install it from: https://cli.github.com/"
    echo "   Or follow manual deployment steps below."
    MANUAL_DEPLOY=true
else
    echo "✅ GitHub CLI found"
    MANUAL_DEPLOY=false
fi

# Check GitHub CLI login status
if [ "$MANUAL_DEPLOY" = false ]; then
    if ! gh auth status &> /dev/null; then
        echo "⚠️  GitHub CLI is not logged in."
        echo "   Please login with: gh auth login"
        MANUAL_DEPLOY=true
    else
        echo "✅ GitHub CLI is logged in"
    fi
fi

# Ask for repository name
echo ""
echo "📦 Repository Setup"
echo "------------------"
read -p "Enter GitHub repository name (e.g., contract-generator): " REPO_NAME
read -p "Enter GitHub username/organization (press Enter for your username): " GH_USER

if [ -z "$GH_USER" ]; then
    GH_USER=$(gh api user --jq .login 2>/dev/null || echo "")
    if [ -z "$GH_USER" ]; then
        echo "⚠️  Could not detect GitHub username. Please enter manually."
        read -p "GitHub username: " GH_USER
    fi
fi

REPO_URL="https://github.com/$GH_USER/$REPO_NAME"

echo ""
echo "📝 Deployment Summary"
echo "--------------------"
echo "Repository: $REPO_URL"
echo "Files to deploy:"
echo "  - index.html (landing page)"
echo "  - contract-gemini.html (main app)"
echo "  - contract-simple*.html (alternative versions)"
echo "  - contract-generator/ (additional tools)"
echo "  - README.md (documentation)"

read -p "Continue with deployment? (y/N): " -n 1 -r
echo ""
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "❌ Deployment cancelled."
    exit 0
fi

# Deployment methods
if [ "$MANUAL_DEPLOY" = false ]; then
    echo "🔄 Using GitHub CLI for deployment..."
    
    # Create repository
    echo "Creating repository $REPO_NAME..."
    gh repo create "$REPO_NAME" --public --description "Smart Contract Generator for trade documents" --push --source=. --remote=origin
    
    # Enable GitHub Pages
    echo "Enabling GitHub Pages..."
    gh api -X POST "/repos/$GH_USER/$REPO_NAME/pages" -f source='{"branch":"main","path":"/root"}' || echo "Note: GitHub Pages may need manual setup"
    
    echo "✅ Repository created and pushed!"
    
else
    echo "📖 Manual Deployment Instructions"
    echo "--------------------------------"
    echo ""
    echo "1. Create a new repository on GitHub:"
    echo "   Visit: https://github.com/new"
    echo "   Repository name: $REPO_NAME"
    echo "   Make it public"
    echo "   DO NOT initialize with README, .gitignore, or license"
    echo ""
    echo "2. Push your code:"
    echo ""
    echo "   # Add remote origin"
    echo "   git remote add origin $REPO_URL.git"
    echo ""
    echo "   # Rename branch to main (if needed)"
    echo "   git branch -M main"
    echo ""
    echo "   # Push to GitHub"
    echo "   git push -u origin main"
    echo ""
    echo "3. Enable GitHub Pages:"
    echo "   - Go to your repository on GitHub"
    echo "   - Settings → Pages"
    echo "   - Source: Deploy from a branch"
    echo "   - Branch: main, folder: / (root)"
    echo "   - Save"
    echo ""
    echo "4. Wait for deployment (1-2 minutes)"
    echo "   Your site will be available at: https://$GH_USER.github.io/$REPO_NAME/"
    echo ""
    
    # Offer to set remote anyway
    read -p "Would you like to set the remote origin now? (y/N): " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        git remote add origin "$REPO_URL.git" 2>/dev/null || git remote set-url origin "$REPO_URL.git"
        echo "✅ Remote origin set to: $REPO_URL.git"
        echo "   You can now push with: git push -u origin main"
    fi
fi

# Final instructions
echo ""
echo "🎉 Deployment Complete!"
echo "====================="
echo ""
echo "Your Smart Contract Generator will be available at:"
echo "🌐 https://$GH_USER.github.io/$REPO_NAME/"
echo ""
echo "Next Steps:"
echo "1. Wait 1-2 minutes for GitHub Pages to build"
echo "2. Visit the URL above to verify deployment"
echo "3. Set your API keys in contract-gemini.html"
echo "4. Share with your team!"
echo ""
echo "📱 Mobile Testing:"
echo "   The HTTPS link will enable clipboard access on iOS Safari."
echo "   Test the 📋 Paste button on your iPhone."
echo ""
echo "Need help? Check README.md for detailed instructions."