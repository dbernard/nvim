# dylan.nvim

```
    ████                  ████
  ██▒▒▒▒██              ██▒▒▒▒██
  ██░░▒▒▒▒██          ██▒▒▒▒░░██
  ██░░▒▒▒▒▒▒██████████▒▒▒▒▒▒░░██
  ██░░▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒░░██
  ██░░▒▒▒▒▒▒▒▒░░░░░░▒▒▒▒▒▒▒▒░░██
  ██▒▒▒▒▒▒▒▒▒▒▒▒░░▒▒▒▒▒▒▒▒▒▒▒▒██
██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██

██  ██  ██      ▒▒  ██  ██      ██
██░░  ██      ▒▒██▒▒  ██      ░░██
██░░░░      ▒▒▒▒▒▒▒▒▒▒      ░░░░██
██░░░░░░▒▒▒▒▒▒▒▒██▒▒▒▒▒▒▒▒░░░░░░██
  ██▒▒▒▒▒▒▒▒▒▒██████▒▒▒▒▒▒▒▒▒▒██
    ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██     < myaa.
    ██████████████████████████
```

## Setting up

Clone this directory to `~/.config/nvim` and run `./scripts/setup.sh`.

Keep plugins up to date with `./scripts/update.sh`.

### Other Resources
Patched font required for Telescope devicons. Recommend the Hack Nerd Font.

### Treesitter

[Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) is installed
with the rest of the plugins listing in `lua/plugins.lua`, but parsers for each
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
2. lazy git
