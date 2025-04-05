#!/bin/bash

# MCP Partner Hub Publishing Script
# This script helps you publish the MCP Partner Hub repository to GitHub

echo "===== MCP Partner Hub Publishing Script ====="
echo ""

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "Error: git is not installed. Please install git first."
    exit 1
fi

# Check if GitHub CLI is installed (optional)
HAS_GH=false
if command -v gh &> /dev/null; then
    HAS_GH=true
    echo "GitHub CLI detected. We can use it for easier repository creation."
else
    echo "GitHub CLI not detected. We'll use manual repository creation."
fi

# Get GitHub username
read -p "Enter your GitHub username: " GITHUB_USERNAME
echo ""

# Get repository name
read -p "Enter repository name (default: mcp-partner-hub): " REPO_NAME
REPO_NAME=${REPO_NAME:-mcp-partner-hub}
echo ""

# Repository description
REPO_DESC="A centralized repository for discovering and comparing Model Context Protocol (MCP) servers from ISV partners"

# Create GitHub repository
echo "===== Step 1: Creating GitHub Repository ====="
if [ "$HAS_GH" = true ]; then
    echo "Creating repository using GitHub CLI..."
    echo "gh repo create $GITHUB_USERNAME/$REPO_NAME --public --description \"$REPO_DESC\""
    echo ""
    echo "After creating the repository, continue with this script."
    read -p "Press Enter when ready to continue..."
else
    echo "Please create a new repository on GitHub:"
    echo "1. Go to https://github.com/new"
    echo "2. Enter '$REPO_NAME' as the Repository name"
    echo "3. Enter '$REPO_DESC' as the Description"
    echo "4. Select 'Public' visibility"
    echo "5. Do NOT initialize with README, .gitignore, or license (we'll push our own)"
    echo "6. Click 'Create repository'"
    echo ""
    echo "After creating the repository, continue with this script."
    read -p "Press Enter when ready to continue..."
fi

# Initialize git repository
echo ""
echo "===== Step 2: Initializing Local Git Repository ====="
echo "Initializing git repository in the current directory..."
git init

# Add all files
echo "Adding all files to git..."
git add .

# Commit files
echo "Committing files..."
git commit -m "Initial commit: MCP Partner Hub repository"

# Add remote repository
echo ""
echo "===== Step 3: Connecting to Remote Repository ====="
echo "Adding remote repository..."
git remote add origin "https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"

# Push to GitHub
echo ""
echo "===== Step 4: Pushing to GitHub ====="
echo "Pushing to GitHub..."
echo "You may be prompted to enter your GitHub credentials."
git push -u origin main || git push -u origin master

# Setup GitHub Pages
echo ""
echo "===== Step 5: Setting Up GitHub Pages ====="
echo "To set up GitHub Pages:"
echo "1. Go to https://github.com/$GITHUB_USERNAME/$REPO_NAME/settings/pages"
echo "2. Under 'Source', select 'main' branch (or 'master' if that's what you used)"
echo "3. Select '/docs' folder"
echo "4. Click 'Save'"
echo ""
echo "After a few minutes, your documentation will be available at:"
echo "https://$GITHUB_USERNAME.github.io/$REPO_NAME/"

# Share repository
echo ""
echo "===== Step 6: Sharing the Repository ====="
echo "Share your repository with AWS partners and customers:"
echo "- Repository URL: https://github.com/$GITHUB_USERNAME/$REPO_NAME"
echo "- Documentation URL: https://$GITHUB_USERNAME.github.io/$REPO_NAME/"
echo ""
echo "You can use the email template in PUBLISH.md to share with partners."

echo ""
echo "===== Publishing Complete! ====="
echo "Your MCP Partner Hub repository is now published on GitHub."
echo "Remember to maintain and update the repository regularly."