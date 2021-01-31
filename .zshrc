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

# some more ls aliases
alias ls="ls -G --color"
alias ll='ls -lh -G --color'
alias lla='ls -lah -G --color'
alias la='ls -Ah -G --color'
alias l='ls -CF -G --color'

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
fpath+=~/.zsh/pure
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure
autoload -U promptinit; promptinit

# Autojump
. /usr/share/autojump/autojump.sh
