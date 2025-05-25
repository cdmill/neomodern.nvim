# name: HOJICHA colors for Fish
# url: https://fishshell.com/docs/current/index.html
# upstream: https://github.com/cdmill/neomodern.nvim/raw/main/extras/fish/hojicha.fish
# author: Casey Miller

# use in ~/.config/fish/conf.d/

# preferred bg: 161616
# alt background: 111111

### Full palette. 
### Colors defined in neomdern/palette/HOJICHA.lua
set -g alt a7ab93 
set -g constant b0b58a 
set -g comment 696969 
set -g fg adacac 
set -g func 808796 
set -g keyword a18b7f 
set -g number b5ae84 
set -g operator 856b6c 
set -g property 9c797d 
set -g str 8a968f 
set -g type 8a879c 

# Syntax Highlighting Colors
set -g fish_color_normal adacac
set -g fish_color_command 808796
set -g fish_color_keyword a18b7f
set -g fish_color_quote 8a968f
set -g fish_color_redirection b0b58a
set -g fish_color_end 856b6c
set -g fish_color_error 9e5560
set -g fish_color_param adacac
set -g fish_color_valid_path 8a879c
set -g fish_color_option a7ab93
set -g fish_color_comment 696969
set -g fish_color_selection --background=1b1c1d
set -g fish_color_operator 856b6c
set -g fish_color_escape a18b7f
set -g fish_color_autosuggestion 696969
set -g fish_color_cwd 8a968f
set -g fish_color_hostname b5ae84
set -g fish_color_status 9e5560
set -g fish_color_cancel b5ae84
set -g fish_color_search_match --background=1b1c1d

# Completion Pager Colors
set -g fish_pager_color_progress a7ab93
set -g fish_pager_color_prefix 8a879c
set -g fish_pager_color_completion adacac
set -g fish_pager_color_description 696969
set -g fish_pager_color_selected_prefix a7ab93
set -g fish_pager_color_selected_completion a7ab93
set -g fish_pager_color_selected_background --background=1b1c1d
