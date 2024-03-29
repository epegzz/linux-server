# Helper to find out whether we are on linux or on MacOS
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=linux;;
    Darwin*)    machine=mac;;
    *)          machine="UNKNOWN:${unameOut}"
esac

# ls aliases
lsColorsArg="--color"
if [[ "$machine" = "mac" ]]
then
  lsColorsArg="-G"
fi

alias ll="ls -lh ${lsColorsArg}"
alias lla="ls -lah ${lsColorsArg}"
alias la="ls -Ah ${lsColorsArg}"
alias l="ls -CF ${lsColorsArg}"
alias ls="ls ${lsColorsArg}"

# Colors!
export TERM=xterm-256color

# navigation key bindings
bindkey "^[[E" beginning-of-line # iterm
bindkey "^[[F" end-of-line # iterm
bindkey '^A' beginning-of-line # tmux
bindkey '^E' end-of-line # tmux
bindkey '^[[1;3C' forward-word # tmux
bindkey '^[[1;3D' backward-word # tmux
bindkey '^[W' backward-kill-word
bindkey '^[V' kill-word
bindkey '^[^[[C' forward-word # tmux
bindkey '^[^[[D' backward-word # tmux

# Make word jumping stop on any non alpha num character
export WORDCHARS=''
export MOTION_WORDCHARS='~!#$%^&*(){}[]<>?.+;-/'

# Zsh settings for history
export HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd:cd ..:cd.."
export HISTSIZE=25000
export HISTFILE=~/.zsh_history
export SAVEHIST=10000
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

# Play safe!
alias 'rm=rm -i'
alias 'mv=mv -i'
alias 'cp=cp -i'

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
setopt histignorealldups sharehistory

# Load some zinit plugins
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting
zinit load zdharma/history-search-multi-word

# Load ZSH Pure prompt
# (Note: Needs to be installed first)
fpath+=~/.zsh/pure
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure
autoload -U promptinit; promptinit
prompt pure

# Autojump
. /usr/share/autojump/autojump.sh

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# fd
alias fd=fdfind

# ld
alias ld=lazydocker
