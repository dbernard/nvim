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

# Python packages go in a dedicated venv (~/.venvs/nvim — the first candidate
# init.lua checks for python3_host_prog). Installing with bare pip3 breaks on
# PEP-668 "externally managed" systems (Debian 12+, Ubuntu 23+).
VENV="${HOME}/.venvs/nvim"

ensurevenv() {
    if [ ! -x "${VENV}/bin/python" ]; then
        echo " - Creating Python venv at ${VENV}..."
        python3 -m venv "${VENV}"
    fi
    echo " - ✅ venv ready (${VENV})"
}

installpynvim() {
    echo " - ❌ pynvim missing. Installing it now..."
    "${VENV}/bin/pip" install pynvim
    echo " - ✅ pynvim installed"
}

installplugins() {
    echo "Installing plugins..."
    nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
    echo " - ✅ plugins installed"
}

installdeps() {
    echo "Installing Python dependencies..."
    "${VENV}/bin/pip" install isort black mypy 'python-lsp-server[all]'
    # expose the CLI tools (pylsp for LSP, formatters) outside the venv
    mkdir -p "${HOME}/.local/bin"
    for tool in pylsp black isort mypy; do
        ln -sf "${VENV}/bin/${tool}" "${HOME}/.local/bin/${tool}"
    done
    echo " - ✅ Python dependencies installed (isort, black, mypy, python-lsp-server)"
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

# python venv + pynvim
ensurevenv
"${VENV}/bin/pip" show pynvim >/dev/null 2>&1 && echo " - ✅ pynvim installed" || installpynvim

installplugins

installdeps

echo "Setup complete!"
