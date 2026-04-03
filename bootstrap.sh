#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

read -sp "Github username: " GITHUB_USERNAME && echo
read -sp "Github repo: " GITHUB_REPO && echo
GITHUB_PATH_1=./"$GITHUB_REPO"/github_pat.age

sudo apt-get install -y age curl > /dev/null 2>&1
echo "age installed"

# ./atlandis/github_pat.age
GITHUB_TOKEN=$(age -d $GITHUB_PATH_1)
echo "github token set"

git config --global url."https://${GITHUB_TOKEN}@github.com/".insteadOf "https://github.com/"
echo "git config set"

sh -c "$(curl -fsLS get.chezmoi.io)" -- -b /usr/local/bin
echo "chezmoi installed"

chezmoi init --apply $GITHUB_USERNAME

