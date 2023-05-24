#!/bin/sh
set -o nounset # error when referencing undefined variable
set -o errexit # exit when command fails

# Install any missing plugins, then update everything
echo "Installing / updating plugins..."
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
echo "✅ Done."
