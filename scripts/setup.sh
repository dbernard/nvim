#!/bin/sh

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

installplugins() {
    echo "Installing plugins..."
    nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
    echo " - ✅ plugins installed"
}

installdeps() {
    echo "Installing other dependencies..."
    pip install isort
    echo " - ✅ isort installed"
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

installplugins

installdeps

echo "Setup complete!"
