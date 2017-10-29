#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
prompt damoekri

unsetopt correct
unsetopt correct_all

alias gs="git status"
alias log="git log"
alias ll="ls -al"
alias vim=nvim
alias cls=clear
