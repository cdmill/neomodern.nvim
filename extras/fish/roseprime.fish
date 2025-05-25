# name: ROSEPRIME colors for Fish
# url: https://fishshell.com/docs/current/index.html
# upstream: https://github.com/cdmill/neomodern.nvim/raw/main/extras/fish/roseprime.fish
# author: Casey Miller

# use in ~/.config/fish/conf.d/

# preferred bg: 121315
# alt background: 111111

### Full palette. 
### Colors defined in neomdern/palette/ROSEPRIME.lua
set -g alt a8a6f5 
set -g constant 95b1fc 
set -g comment 666a82 
set -g fg adadcc 
set -g func c4959c 
set -g keyword 6397cf 
set -g number cfa18c 
set -g operator 838196 
set -g property ad82a2 
set -g str d2af98 
set -g type 9bbdb8 

# Syntax Highlighting Colors
set -g fish_color_normal adadcc
set -g fish_color_command c4959c
set -g fish_color_keyword 6397cf
set -g fish_color_quote d2af98
set -g fish_color_redirection 95b1fc
set -g fish_color_end 838196
set -g fish_color_error ba5f60
set -g fish_color_param adadcc
set -g fish_color_valid_path 9bbdb8
set -g fish_color_option a8a6f5
set -g fish_color_comment 666a82
set -g fish_color_selection --background=16171b
set -g fish_color_operator 838196
set -g fish_color_escape 6397cf
set -g fish_color_autosuggestion 666a82
set -g fish_color_cwd d2af98
set -g fish_color_hostname cfa18c
set -g fish_color_status ba5f60
set -g fish_color_cancel cfa18c
set -g fish_color_search_match --background=16171b

# Completion Pager Colors
set -g fish_pager_color_progress a8a6f5
set -g fish_pager_color_prefix 9bbdb8
set -g fish_pager_color_completion adadcc
set -g fish_pager_color_description 666a82
set -g fish_pager_color_selected_prefix a8a6f5
set -g fish_pager_color_selected_completion a8a6f5
set -g fish_pager_color_selected_background --background=16171b
