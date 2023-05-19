#!/bin/sh

# Setup
# 1) install dein
# 2) install xsel if ubuntu
# 3) pip install pynvim
# 4) npm install neovim
# 5) install vim plugins (maybe `nvim +'call dein#install()' +qall`)
# 6) Install ripgrep

set -o nounset # error when referencing undefined variable
set -o errexit # exit when command fails

checkcurrentdir() {
    cd $(dirname $0)

    if [ "$PWD" != "${HOME}/.config/nvim/scripts" ]; then
      echo "ERROR: This repo must be cloned to ~/.config/nvim"
      exit 1
    fi
}

errormissingpip() {
    echo "ERROR: No pip installed."
    echo "Please install pip (pip3) before proceeding."
    exit 1
}

errormissingnode() {
    echo "ERROR: No Node installed."
    echo "Please install Node before proceeding."
    exit 1
}

errormissingnvim() {
    echo "ERROR: No Neovim installed."
    echo "Please install Neovim before proceeding."
    exit 1
}

warnmissingrg() {
    echo " - ⚠️  ripgrep is not installed. You'll want to install it for fzf!"
}

installpynvim() {
    echo " - ❌ pynvim missing. Installing it now..."
    pip3 install pynvim --user
    echo " - ✅ pynvim installed"
}

installdein() {
    INSTALL_DIR="${HOME}/.config/nvim/dein"
    echo "Installing dein for plugin mangement..."
    if [ -e "$INSTALL_DIR" ]; then
        echo " - 🆗 Dein directory already exists (${INSTALL_DIR}). Skipping."
        return
    fi
    echo " - Fetching dein..."
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > dein_installer.sh
    echo " - Running installer..."
    sh ./dein_installer.sh $INSTALL_DIR
    echo " - Cleaning up..."
    rm dein_installer.sh
    echo " - ✅ dein installed"
}

installplugins() {
    echo "Installing plugins..."
    nvim +'call dein#install()' +qall
    echo " - ✅ plugins installed"
}

echo "##########################"
echo "# Starting Neovim setup! #"
echo "##########################"

checkcurrentdir

echo "Checking dependencies..."

which nvim >/dev/null && echo " - ✅ Neovim installed" || errormissingnvim

# check for ripgrep
which rg >/dev/null && echo " - ✅ ripgrep installed" || warnmissingrg

# install pip
which pip3 >/dev/null && echo " - ✅ pip3 installed" || errormissingpip

# install node and neovim support
which node >/dev/null && echo " - ✅ node installed" || errormissingnode

# install pynvim
pip3 list | grep pynvim >/dev/null && echo " - ✅ pynvim installed" || installpynvim

installdein

installplugins

echo "Setup complete!"
