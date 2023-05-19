" set leader
let g:mapleader = "\<Space>"

syntax enable                          " enable syntax highlighting
set hidden                             " Required for multiple buffers
set nowrap                             " Display long lines as just one line
set encoding=utf-8                     " The encoding displayed
set pumheight=10                       " Shrink the popup menu
set fileencoding=utf-8                 " Encoding written to file
set ruler                              " Show cursor position always
set cmdheight=2                        " More space for displaying messages
set iskeyword+=-                       " Treat dash separated words as a word text object
set mouse=a                            " Enable mouse
set splitbelow                         " Horizontal splits always below
set splitright                         " Vertical splits always right
set t_Co=256                           " Support 256 colors
set conceallevel=0                     " Shows `` in markdown files
set tabstop=2                          " Insert 2 spaces for a tab
set shiftwidth=2                       " Change the number of space characters inserted for indentation
set smarttab                           " Makes tabbing smarter - will realize we set 2 vs 4
set expandtab                          " Converts tabs to spaces
set smartindent                        " Makes indenting smarter
set autoindent                         " Better auto indenting
set laststatus=2                       " Always show the last status line
set number                             " Line numbers
set cursorline                         " Enable hightlighting of the current line
set background=dark                    " Tells vim what the background color looks like
set showtabline=2                      " Always show tabs
set noshowmode                         " We dont need to see -- INSERT -- anymore
set nobackup                           " Recommended by coc
set nowritebackup                      " Recommended by coc
set updatetime=300                     " Faster completion
set timeoutlen=500                     " Faster than default of 1000ms (which-key plug)
set formatoptions-=cro                 " Stop newline continuation of comments
set clipboard=unnamedplus              " Copy / Paste between vim and everything else
set termguicolors                      " Set to true for colorizer
set colorcolumn=80,120                 " Set a ruler at 80 characters
set nowrapscan                         " Don't wrap around buffer when searching

au! BufWritePost $MYVIMRC source %     " Auto source when writing to init.vim
