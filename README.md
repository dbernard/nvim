# Neovim Configuration

A modern Neovim configuration with LSP support, fuzzy finding, and developer-focused tooling.

## Setup

### Prerequisites

- **Neovim** (latest version recommended)
- **Node.js** (for LSP servers and plugins)
- **Python 3** with pip3
- **ripgrep** (recommended for fuzzy finding)

### Installation

1. Clone this repository to your Neovim config directory:
   ```bash
   git clone <your-repo-url> ~/.config/nvim
   ```

2. Run the setup script:
   ```bash
   ~/.config/nvim/scripts/setup.sh
   ```

The setup script will:
- Verify dependencies are installed
- Install pynvim for Python integration
- Install Python tools (isort, black, mypy, python-lsp-server)
- Install all Neovim plugins via Packer

### Updating

To update plugins and dependencies:
```bash
~/.config/nvim/scripts/update.sh
```

## Features

### Core Functionality
- **Package Management**: Packer.nvim for plugin management
- **Theme**: OneDark colorscheme
- **Status Line**: Lualine with icons
- **Key Mappings**: Space as leader key with Which-key help

### Development Tools
- **LSP Support**: Native Neovim LSP with nvim-lspconfig
- **Autocompletion**: nvim-cmp with LSP, path, and command completion
- **Snippets**: LuaSnip engine with custom Python snippets
- **Formatting**: Conform.nvim for code formatting
- **Linting**: nvim-lint for code analysis
- **Syntax Highlighting**: Treesitter for enhanced syntax highlighting

### Navigation & Search
- **Fuzzy Finding**: FZF integration with vim-rooter for project-aware searching
- **File Explorer**: Telescope for file/buffer/grep searching
- **Buffer Management**: Tab/Shift-Tab for buffer navigation

### Python Development
- **Isort Integration**: `<leader>i` for import sorting
- **LSP**: Python LSP server with full language support
- **Formatting**: Black integration via Conform
- **Linting**: Mypy support via nvim-lint

### Terminal & Git
- **Terminal**: ToggleTerm for integrated terminal management
- **Git Integration**: Fugitive for Git operations
- **Remote Clipboard**: OSC52 support for SSH clipboard access

### UI Enhancements
- **Dashboard**: Custom startup screen
- **Icons**: Web devicons throughout the interface
- **Color Preview**: Colorizer for hex/rgb color visualization
- **Rainbow Parentheses**: Bracket pair highlighting
- **Markdown Rendering**: Enhanced markdown display

### AI/Productivity
- **GitHub Copilot**: AI-powered code completion
- **Commentary**: Easy code commenting across filetypes

## Key Bindings

- `<Space>` - Leader key
- `<Tab>` / `<Shift-Tab>` - Navigate buffers
- `<Leader>q` - Close current buffer
- `<Ctrl-s>` - Save file
- `<Leader>i` - Run isort (Python)
- `<Leader>db` - Open dashboard

## Configuration Structure

```
~/.config/nvim/
├── init.lua              # Main configuration entry point
├── lua/
│   ├── plugins.lua       # Plugin definitions
│   ├── settings/
│   │   ├── general.lua   # General Neovim settings
│   │   └── mappings.lua  # Key mappings
│   ├── config/           # Plugin configurations
│   └── snippets/         # Custom snippets
├── scripts/
│   ├── setup.sh         # Initial setup script
│   └── update.sh        # Update script
└── utils/
    └── isort.cfg        # Isort configuration
```

This configuration prioritizes development productivity with modern tooling while maintaining fast startup times and clean organization.