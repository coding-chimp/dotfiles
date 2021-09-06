# prompt
setopt prompt_subst
export PROMPT=$'
%~
%{\e[0;%(?.32.31)m%}>%{\e[0m%} '
export RPROMPT='$fg[white]%} $(current_ruby)$(~/.bin/git_cwd_info)%{$reset_color%}'

# completion
autoload -Uz compinit
compinit
setopt complete_in_word
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
export WORDCHARS='*?[]~=&;!#$%^(){}'

. ~/.zsh/aliases
. ~/.zsh/functions
. ~/.zsh/current_ruby
. ~/.zsh/bundler.plugin.zsh
. ~/.zsh/zsh-autosuggestions.zsh

if [[ -f ~/.zsh/work.zsh ]]; then
  . ~/.zsh/work.zsh # put company specific stuff in there so we don't check it in
fi

# titlebar
autoload -U add-zsh-hook
PR_TITLEBAR=''
set-window-title
add-zsh-hook precmd set-window-title

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

# use nvim as the visual editor
export VISUAL=nvim
export EDITOR=$VISUAL

if [ $(uname -s) = 'Darwin' ]; then
  export LANG="en_AU.UTF-8"
  export PATH="$HOME/.bin:/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/X11/bin"
  export MANPATH="/usr/local/share/man:/usr/X11/man:/usr/share/man"
  export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH"
else
  export PATH="$HOME/.bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"
fi

# rbenv
if which rbenv >/dev/null; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init - zsh)"
fi

unsetopt autocd

# nvm
if which nvm >/dev/null && [ ! -f /opt/dev/sh/nvm/nvm.sh ]; then
  . ~/.zsh/load-nvmrc
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

# heroku
export PATH="/usr/local/heroku/bin:$PATH"

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-solarized.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# golang
export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

[[ -x /usr/local/bin/brew ]] && eval $(/usr/local/bin/brew shellenv)
