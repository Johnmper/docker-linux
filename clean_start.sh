#!/bin/bash
cd /ldod
# Basic configuration for git global
git config --global user.name "joaomgper"
git config --global user.email joaomgper94@gmail.com
git config --global core.editor vim
git config --global http.sslbackend gnutls
# Remove all file in directory, even hidden ones (without deleting dir)
shopt -s dotglob
rm -rfv linux-repo/*
shopt -u dotglob

# Initialize master repo
git init
git submodule add https://github.com/Johnmper/docker-linux .ws
# Clone repo kernel repo
git clone --branch master https://github.com/torvalds/linux.git linux-repo/.
git submodule add https://github.com/torvalds/linux.git linux-repo
