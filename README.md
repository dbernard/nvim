## Setting up

Clone this directory to `~/.config/nvim` and run `./setup.sh`.

### Treesitter

[Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) is installed
with the rest of the plugins listing in `plugins.vim`, but parsers for each
language still need to be installed manually: `:TSInstall python`.

Recommended languages:
 - python
 - bash
 - lua
 - javascript
 - tsx
 - html
 - css

 You can keep these updated with `TSUpdate`.

## TODO
1. float term
2. lazy git
3. Customize which_key menu
9. Dashboard?
10. Nerd Font compatible font + dev icons? (for fun)
