#!/bin/bash

# GitHub Pages Deployment Script
# Usage: ./deploy.sh <your-github-username> <repository-name>

if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: ./deploy.sh <your-github-username> <repository-name>"
    echo "Example: ./deploy.sh myusername engine-install-guide"
    exit 1
fi

USERNAME=$1
REPO_NAME=$2

# Check if remote already exists
if git remote get-url origin > /dev/null 2>&1; then
    echo "Remote 'origin' already exists. Updating..."
    git remote set-url origin https://github.com/${USERNAME}/${REPO_NAME}.git
else
    echo "Adding remote 'origin'..."
    git remote add origin https://github.com/${USERNAME}/${REPO_NAME}.git
fi

# Push to GitHub
echo "Pushing to GitHub..."
git branch -M main
git push -u origin main

echo ""
echo "✓ Code pushed to GitHub!"
echo ""
echo "Next steps to enable GitHub Pages:"
echo "1. Go to https://github.com/${USERNAME}/${REPO_NAME}/settings/pages"
echo "2. Under 'Source', select 'Deploy from a branch'"
echo "3. Select 'main' branch and '/ (root)' folder"
echo "4. Click 'Save'"
echo "5. Your site will be available at: https://${USERNAME}.github.io/${REPO_NAME}/"
echo ""

