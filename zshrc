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

CASE_SENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

HISTSIZE=10000
SAVEHIST=10000

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(fzf starship)

# User configuration
export PATH="$HOME/.local/bin:$PATH"

# Set the editor according to the development session. This is usually used by
# git or other tools requiring an external editor.
if [[ "$TERM_PROGRAM" == "vscode" ]]; then
    export EDITOR='code --wait'
else
    export EDITOR='vim'
fi

source starship.zsh

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
