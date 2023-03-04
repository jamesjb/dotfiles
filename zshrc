#
# zshrc --- Shell initialization file for ZSH.
#
# Copyright (C) 2023, James Bielman <jamesjb@gmail.com>
# All Rights Reserved.
#

if [ -f "$HOME/.zshrc_pre_local" ]; then
    source "$HOME/.zshrc_pre_local"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
plugins=(git aws)

source $ZSH/oh-my-zsh.sh

# OS-specific setup.
OS=`uname`

if [ "$OS" = "Darwin" ]; then
    # Set up paths for Homebrew.
    if [ -d /opt/homebrew/bin ]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi

    # Alias 'ls' to GNU ls with desired options if available.
    if (($+commands[gls])); then
        alias ls='gls --color=auto -F -B'
    else
        echo "Warning: GNU ls not found, install coreutils with Homebrew."
    fi
fi

# Make the 'path' array (which is tied to "PATH") unique so we can append to it
# without fear of duplication.
typeset -U path

unsetopt inc_append_history
unsetopt share_history
unsetopt automenu

prompt_context() {
  if [[ "$USERNAME" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)%n@${MACHINE_SHORT_NAME:-%m}"
  fi
}

if [ -f "$HOME/.zshrc_post_local" ]; then
    source "$HOME/.zshrc_post_local"
fi
