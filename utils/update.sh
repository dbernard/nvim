#!/bin/sh
set -o nounset # error when referencing undefined variable
set -o errexit # exit when command fails

# Install any missing plugins, then update everything
echo "Installing plugins..."
nvim +'call dein#install()' +qall
echo "✅ Done."

echo "Updating plugins..."
nvim +'call dein#update()' +qall
echo "✅ Done."
