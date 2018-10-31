brew install zsh tmux vim cmatrix autojump python3 ispell mosh

# Emacs
brew tap d12frosted/emacs-plus
brew install emacs-plus
brew linkapps emacs-plus
# Need fonts source code pro https://github.com/syl20bnr/spacemacs/issues/6226

# https://github.com/ggreer/the_silver_searcher
brew install the_silver_searcher

# https://github.com/peco/peco
brew install peco

# Gtags
# https://www.gnu.org/software/global/
# brew install global --with-pygments --with-ctags

brew tap caskroom/cask
# font
brew tap caskroom/fonts

# Common Tools
brew cask install caffeine google-chrome iterm2 slate alfred dropbox istat-menus mattr-slate
# Programming Tools
brew cask install meld sourcetree font-source-code-pro icdiff ripgrep
# brew cask install vagrant virtualbox

# Optional Tools
# brew cask install db-browser-for-sqlite

# Use Python2's pip
pip install percol

# Python3
pip3 install httpie ipython

# Slate
# https://github.com/jigish/slate
# Enable Slate in Mac: http://mizage.com/help/accessibility.html
if [ ! -f ~/.slate ]; then
    ln -s ~/frank_config/macos/.slate ~/.slate
fi

if [ ! -f ~/.slate.js ]; then
    ln -s ~/frank_config/macos/.slate.js ~/.slate.js
fi

if [ ! -f ~/.spacemacs ]; then
    ln -s ~/frank_config/.spacemacs ~/.spacemacs
fi

if [ ! -f ~/.emacs.prviate.el ]; then
    ln -s ~/frank_config/.emacs.private.el ~/.emacs.private.el
fi

if [ ! -d ~/.emacs.prviate.d ]; then
    ln -s ~/frank_config/.emacs.private.d ~/.emacs.private.d
fi

if [ ! -f ~/.xonshrc ]; then
    ln -s ~/frank_config/.xonshrc ~/.xonshrc
fi

# Set zsh as default shell
# chsh -s $(which zsh)
