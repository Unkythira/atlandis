#!/bin/bash

set -e
export DEBIAN_FRONTEND=noninteractive

read -rp "Github username: " GH_USER
read -rp "Github repo name: " GH_REPO

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PAT_FILE="$SCRIPT_DIR"/github_pat.age

sudo apt-get update -qq
sudo apt-get install -y age curl >/dev/null

GITHUB_TOKEN=$(age -d "$PAT_FILE")

git config --global url."https://${GITHUB_TOKEN}@github.com/".insteadOf "https://github.com/"

sudo sh -c "$(curl -fsLS get.chezmoi.io)" -- -b /usr/local/bin

chezmoi init --apply "$GH_USER/$GH_REPO"
