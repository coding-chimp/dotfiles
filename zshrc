# prompt
setopt prompt_subst
export PROMPT=$'
%~
%{\e[0;%(?.32.31)m%}>%{\e[0m%} '
export RPROMPT='$fg[white]%} $(rbenv version-name)$(~/bin/git_cwd_info)%{$reset_color%}'

# completion
autoload -Uz compinit
compinit
setopt complete_in_word
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
export WORDCHARS='*?[]~=&;!#$%^(){}'

# history settings
setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zsh_history
HISTSIZE=4096
SAVEHIST=4096

# enable extended globbing
setopt extendedglob
setopt nullglob

# allow [ or ] wherever you want
unsetopt nomatch

# vi mode
bindkey -v
bindkey "^F" vi-cmd-mode
bindkey jj vi-cmd-mode

# handy keybindings
bindkey "\e\e[C"  forward-word
bindkey "\e\e[D"  backward-word

# use vim as the visual editor
export VISUAL=vim
export EDITOR=$VISUAL

if [ $(uname -s) = 'Darwin' ]; then
  export LANG="en_AU.UTF-8"
  export PATH="$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/X11/bin"
  export MANPATH="/usr/local/share/man:/usr/X11/man:/usr/share/man"
  export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH"
else
  export PATH="$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"
fi

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

unsetopt autocd

# Set a really fast key repeat.
defaults write NSGlobalDomain KeyRepeat -int 0

# Disable press-and-hold for keys in favor of key repeat.
defaults write -g ApplePressAndHoldEnabled -bool false

# heroku
export PATH="/usr/local/heroku/bin:$PATH"

. ~/.zsh/aliases
. ~/.zsh/functions

# added by travis gem
[ -f /Users/codechimp/.travis/travis.sh ] && source /Users/codechimp/.travis/travis.sh
