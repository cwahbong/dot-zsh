# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [ -n "$ZDOTDIR" ]; then
	SCRIPTPATH=$ZDOTDIR
else
	SCRIPTPATH=$HOME
fi
ZSHRC=$(readlink -f "$SCRIPTPATH/.zshrc")

# Path to oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSHRC_PATH=$(dirname "$ZSHRC")
ZSH_CUSTOM=$ZSHRC_PATH/custom

# Set name of the theme to load.
ZSH_THEME="powerlevel10k/powerlevel10k"

CASE_SENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

HISTSIZE=10000
SAVEHIST=10000

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(fzf)

# User configuration
# export PATH="$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
if [[ "$TERM_PROGRAM" == "vscode" ]]; then
    export EDITOR='code --wait'
else
    export EDITOR='vim'
fi

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

unsetopt beep

# Our dot file manager: https://github.com/ellipsis/ellipsis
ELLIPSIS_INIT=~/.ellipsis/init.sh
[[ ! -f "$ELLIPSIS_INIT" ]] || source "$ELLIPSIS_INIT"

# Overwrite theme ls colors
DIR_COLORS_FILE=$HOME/.dir_colors
[[ ! -f "$DIR_COLORS_FILE" ]] || eval $(dircolors $HOME/.dir_colors)

# set term
if [ -z "$TMUX" ]; then
	export TERM="xterm-256color"
fi

# To customize prompt, run `p10k configure` or edit p10k.zsh.
source $ZSHRC_PATH/p10k.zsh
