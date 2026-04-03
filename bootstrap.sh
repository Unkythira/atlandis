#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

apt-get install -y age curl sudo > /dev/null 2>&2
echo "age installed"

# ./atlandis/github_pat.age
export GITHUB_TOKEN=$(age -d $GITHUB_PATH_1)
echo "github token set"

git config --global url."https://${GITHUB_TOKEN}@github.com/".insteadOf "https://github.com/"
echo "git config set"

sh -c "$(curl -fsLS get.chezmoi.io)" -- -b /usr/local/bin
echo "chezmoi installed"

