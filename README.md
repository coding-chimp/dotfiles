# Bastian's dot files

These are config files to set up a system the way I like it.

## Installation

    git clone git@github.com:coding-chimp/dotfiles.git
    cd ~/.dotfiles
    rake install

Install [Homebrew]

    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

Install Homebrew packages

    bundle brew

Vim plugins are managed through [minpac]. You'll need to install minpac to get them.

    git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac

Run `:PackUpdate` in vim.

The statusline configuration for vim uses symbols from the [Powerline] font.
In [iTerm] you can use [PowerlineSymbols.otf] as a fallback font. In
Terminal.app you need to use one of the patched fonts from the
[powerline-fonts] repository.

[Homebrew]: https://brew.sh/
[minpac]: https://github.com/k-takata/minpac
[Powerline]: https://github.com/powerline/powerline
[iTerm]: https://www.iterm2.com/
[PowerlineSymbols.otf]: https://github.com/powerline/powerline/blob/develop/font/PowerlineSymbols.otf
[powerline-fonts]: https://github.com/powerline/fonts
