brew install zsh tmux vim cmatrix autojump python3 ispell

# Emacs
brew tap d12frosted/emacs-plus
brew install emacs-plus
brew linkapps emacs-plus
# Need fonts source code pro https://github.com/syl20bnr/spacemacs/issues/6226

# https://github.com/ggreer/the_silver_searcher
brew install the_silver_searcher

brew tap caskroom/cask
brew cask install caffeine google-chrome iterm2 slate alfred sourcetree dropbox slack istat-menus
# Use Python2's pip 
pip install percol

# Slate
# https://github.com/jigish/slate
# Enable Slate in Mac: http://mizage.com/help/accessibility.html
if [ ! -f ~/.slate ]; then
    ln -s ~/frank_config/macos/.slate ~/.slate
fi

if [ ! -f ~/.slate.js ]; then
    ln -s ~/frank_config/macos/.slate.js ~/.slate.js
fi


# chsh -s $(which zsh)
