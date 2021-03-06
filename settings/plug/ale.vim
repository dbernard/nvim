" Customize Ale
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_lint_on_enter = 0

" Linters
let g:ale_linters = {'python': ['flake8', 'mypy']}

" Fixers
let g:ale_fixers = {'python': ['remove_trailing_lines', 'trim_whitespace']}
let g:ale_fix_on_save = 1

" Key mappings
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
