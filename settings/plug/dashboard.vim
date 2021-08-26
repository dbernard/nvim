" Dashboard config
let g:dashboard_default_executive = 'telescope'
let g:dashboard_session_directory = $HOME.'/.cache/nvim/session'

" Shortcuts
let s:dashboard_shortcut = {}
let s:dashboard_shortcut['last_session'] = 'SPC s l'
let s:dashboard_shortcut['find_file'] = 'SPC f f'
let s:dashboard_shortcut['find_word'] = 'SPC f g'
let s:dashboard_shortcut['file_browser'] = 'SPC f b'
let s:dashboard_shortcut['help_tags'] = 'SPC f h'

" Shortcut icons
let s:dashboard_shortcut_icon = {}
let s:dashboard_shortcut_icon['last_session'] = ' '
let s:dashboard_shortcut_icon['find_file'] = ' '
let s:dashboard_shortcut_icon['find_word'] = ' '
let s:dashboard_shortcut_icon['file_browser'] = 'ﱮ '
let s:dashboard_shortcut_icon['help_tags'] = ' '

" Dashboard Sections
hi DashboardShortCut guifg=HotPink
let g:dashboard_custom_section = {
      \'last_session': {
        \'description': [s:dashboard_shortcut_icon['last_session'].'Open last session        '.s:dashboard_shortcut['last_session']],
        \'command': function('dashboard#handler#last_session'),
      \},
      \'find_file': {
        \'description': [s:dashboard_shortcut_icon['find_file'].'Find file                '.s:dashboard_shortcut['find_file']],
        \'command': function('dashboard#handler#find_file'),
      \},
      \'find_word': {
        \'description': [s:dashboard_shortcut_icon['find_word'].'Find word                '.s:dashboard_shortcut['find_word']],
        \'command': function('dashboard#handler#find_word'),
      \},
      \'file_browser': {
        \'description': [s:dashboard_shortcut_icon['file_browser'].'File browser             '.s:dashboard_shortcut['file_browser']],
        \'command': 'Telescope file_browser',
      \},
      \'help_tags': {
        \'description': [s:dashboard_shortcut_icon['help_tags'].'Help tags                '.s:dashboard_shortcut['help_tags']],
        \'command': 'Telescope help_tags',
      \},
\}

" Header
hi DashboardHeader guifg=LightSlateBlue
let g:dashboard_custom_header = [
\'    ████                  ████    ',
\'  ██▒▒▒▒██              ██▒▒▒▒██  ',
\'  ██░░▒▒▒▒██          ██▒▒▒▒░░██  ',
\'  ██░░▒▒▒▒▒▒██████████▒▒▒▒▒▒░░██  ',
\'  ██░░▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒░░██  ',
\'  ██░░▒▒▒▒▒▒▒▒░░░░░░▒▒▒▒▒▒▒▒░░██  ',
\'  ██▒▒▒▒▒▒▒▒▒▒▒▒░░▒▒▒▒▒▒▒▒▒▒▒▒██  ',
\'██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██',
\'                                  ',
\'██  ██  ██      ▒▒  ██  ██      ██',
\'██░░  ██      ▒▒██▒▒  ██      ░░██',
\'██░░░░      ▒▒▒▒▒▒▒▒▒▒      ░░░░██',
\'██░░░░░░▒▒▒▒▒▒▒▒██▒▒▒▒▒▒▒▒░░░░░░██',
\'  ██▒▒▒▒▒▒▒▒▒▒██████▒▒▒▒▒▒▒▒▒▒██  ',
\'    ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██    ',
\'    ██████████████████████████    ',
\'                                  ',
\'            dylan.nvim            ',
\]

" Footer
let s:total_plugins = len(dein#get())
let has_py3_support_icon = ""
if has("python3")
  let has_py3_support_icon = ""
endif

hi DashboardFooter guifg=PaleGreen3
let g:dashboard_custom_footer = [
\ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
\ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
\ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
\ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
\ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
\ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
\ '                                                       ',
\ '                  loaded '.s:total_plugins.' plugins  ',
\ '                 '.has_py3_support_icon.' Python 3 support',
\]
