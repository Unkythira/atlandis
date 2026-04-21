#!/bin/bash

set -e
export DEBIAN_FRONTEND=noninteractive

read -rp "Github username: " GH_USER
echo "1. $GH_USER"
read -rp "Github repo name: " GH_REPO
echo "2. $GH_REPO"

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
echo "3. $SCRIPT_DIR"
PAT_FILE="$SCRIPT_DIR"/github_pat.age
echo "4. $SCRIPT_DIR"

sudo apt-get update -qq
sudo apt-get install -y age curl >/dev/null

GITHUB_TOKEN=$(age -d "$PAT_FILE")
echo "5. $GITHUB_TOKEN"

git config --global url."https://${GITHUB_TOKEN}@github.com/".insteadOf "https://github.com/"
echo "6. git config set"

sh -c "$(curl -fsLS get.chezmoi.io)" -- -b /usr/local/bin
echo "7. chezmoi installed"

chezmoi init --apply "$GH_USER/$GH_REPO"
