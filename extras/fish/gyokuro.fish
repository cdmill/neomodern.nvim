# name: GYOKURO colors for Fish
# url: https://fishshell.com/docs/current/index.html
# upstream: https://github.com/cdmill/neomodern.nvim/raw/main/extras/fish/gyokuro.fish
# author: Casey Miller

# use in ~/.config/fish/conf.d/

# preferred bg: 1b1c1d
# alt background: 161617

### Full palette. 
### Colors defined in neomdern/palette/GYOKURO.lua
set -g alt a69e6f 
set -g constant 868db5 
set -g comment 767777 
set -g fg bbbac1 
set -g func 8bab85 
set -g keyword 72966c 
set -g number d6a9b3 
set -g operator b08c7d 
set -g property 748fa6 
set -g str a2ad7b 
set -g type bbc7b1 

# Syntax Highlighting Colors
set -g fish_color_normal bbbac1
set -g fish_color_command 8bab85
set -g fish_color_keyword 72966c
set -g fish_color_quote a2ad7b
set -g fish_color_redirection 868db5
set -g fish_color_end b08c7d
set -g fish_color_error 9e5560
set -g fish_color_param bbbac1
set -g fish_color_valid_path bbc7b1
set -g fish_color_option a69e6f
set -g fish_color_comment 767777
set -g fish_color_selection --background=222324
set -g fish_color_operator b08c7d
set -g fish_color_escape 72966c
set -g fish_color_autosuggestion 767777
set -g fish_color_cwd a2ad7b
set -g fish_color_hostname d6a9b3
set -g fish_color_status 9e5560
set -g fish_color_cancel d6a9b3
set -g fish_color_search_match --background=222324

# Completion Pager Colors
set -g fish_pager_color_progress a69e6f
set -g fish_pager_color_prefix bbc7b1
set -g fish_pager_color_completion bbbac1
set -g fish_pager_color_description 767777
set -g fish_pager_color_selected_prefix a69e6f
set -g fish_pager_color_selected_completion a69e6f
set -g fish_pager_color_selected_background --background=222324
