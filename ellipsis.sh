#!/usr/bin/env bash

pkg.install() {
  git.clone https://github.com/robbyrussell/oh-my-zsh
  git.clone https://github.com/romkatv/powerlevel10k.git custom/powerlevel10k
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
