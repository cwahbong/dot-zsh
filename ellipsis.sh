#!/usr/bin/env bash

pkg.install() {
  git.clone https://github.com/robbyrussell/oh-my-zsh
}

pkg.link() {
  fs.link_file oh-my-zsh
  fs.link_file zshrc
}

pkg.pull() {
  (
    cd oh-my-zsh
    msg.bold "updating oh-my-zsh"
    git pull
  )
  hooks.pull
}
