# name: ICECLIMBER colors for Fish
# url: https://fishshell.com/docs/current/index.html
# upstream: https://github.com/cdmill/neomodern.nvim/raw/main/extras/fish/iceclimber.fish
# author: Casey Miller

# use in ~/.config/fish/conf.d/

# preferred bg: 171719
# alt background: 111113

### Full palette. 
### Colors defined in neomdern/palette/ICECLIMBER.lua
set -g alt abbceb 
set -g constant 86a3f0 
set -g comment 555568 
set -g fg bbbac1 
set -g func cc93b8 
set -g keyword 8a88db 
set -g number cfa18c 
set -g operator 9b99a3 
set -g property 629da3 
set -g str 6b6b99 
set -g type a8a6de 

# Syntax Highlighting Colors
set -g fish_color_normal bbbac1
set -g fish_color_command cc93b8
set -g fish_color_keyword 8a88db
set -g fish_color_quote 6b6b99
set -g fish_color_redirection 86a3f0
set -g fish_color_end 9b99a3
set -g fish_color_error e67e80
set -g fish_color_param bbbac1
set -g fish_color_valid_path a8a6de
set -g fish_color_option abbceb
set -g fish_color_comment 555568
set -g fish_color_selection --background=1d1d22
set -g fish_color_operator 9b99a3
set -g fish_color_escape 8a88db
set -g fish_color_autosuggestion 555568
set -g fish_color_cwd 6b6b99
set -g fish_color_hostname cfa18c
set -g fish_color_status e67e80
set -g fish_color_cancel cfa18c
set -g fish_color_search_match --background=1d1d22

# Completion Pager Colors
set -g fish_pager_color_progress abbceb
set -g fish_pager_color_prefix a8a6de
set -g fish_pager_color_completion bbbac1
set -g fish_pager_color_description 555568
set -g fish_pager_color_selected_prefix abbceb
set -g fish_pager_color_selected_completion abbceb
set -g fish_pager_color_selected_background --background=1d1d22
