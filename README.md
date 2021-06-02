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
3. Customize which_key menu
5. Keybind for maximizing window
7. Recolor python theme (This might be done if I set up treesitter)
9. Dashboard?
10. Nerd Font compatible font + dev icons? (for fun)
11. Customize nN behavior
