local Util = require("neomodern.util")

local M = {}

function M.generate(colors, info)
    colors.extra = info.extra
    colors.url = info.url
    colors.upstream = info.upstream
    colors.theme = info.theme
    local yazi = Util.template(
        [=[
# name: ${theme} colors for ${extra}
# url: ${url}
# upstream: ${upstream}
# author: Casey Miller

[manager]
cwd = { fg = "${func}" }

hovered         = { fg = "${type}", bg = "${line}" }
preview_hovered = { fg = "${type}", bg = "${line}" }

find_keyword  = { fg = "${property}", italic = true }
find_position = { fg = "${property}", bg = "reset", italic = true }

marker_copied   = { fg = "${number}", bg = "${number}" }
marker_cut      = { fg = "${diag_red}", bg = "${diag_red}", crossed = true }
marker_marked   = { bg = "${alt}", blink = true }
marker_selected = { bg = "${alt}", blink = true }

tab_active   = { fg = "${constant}", bg = "${line}", bold = true, reversed = true }
tab_inactive = { fg = "${comment}", bg = "${line}" }
tab_width    = 1

count_cut      = { fg = "${diag_red}" }
count_copied   = { fg = "${number}" }
count_selected = { fg = "${alt}", italic = true, blink = true }

border_symbol = "│"
border_style  = { fg = "${comment}" }

[mode]
normal_main   = { fg = "${bg}", bg = "${keyword}" }
normal_alt    = { fg = "${bg}", bg = "${keyword}" }
select_main   = { fg = "${bg}", bg = "${alt}" }
select_alt    = { fg = "${bg}", bg = "${alt}" }
unset_main    = { fg = "${bg}", bg = "${property}" }
unset_alt     = { fg = "${bg}", bg = "${property}" }

[status]
overall = {  fg = "${comment}", bg = "${bg}", bold = true }
sep_left = { open = "", close = "" }
sep_right = { open = "", close = "" }

progress_label  = { fg = "${constant}", bg = "${visual}" }
progress_normal = { fg = "${constant}", bg = "${visual}" }
progress_error  = { fg = "${diag_red}", bg = "${visual}" }

permissions_t = { fg = "${type}" }
permissions_r = { fg = "${property}" }
permissions_w = { fg = "${keyword}" }
permissions_x = { fg = "${func}" }
permissions_s = { fg = "${constant}" }

[input]
border   = { fg = "${comment}" }
title    = { fg = "${constant}" }
value    = {}
selected = { fg = "${fg}", bg = "${visual}" }

[confirm]
border   = { fg = "${comment}" }
title = { fg = "${constant}" }
btn_yes = { fg = "${diag_red}", bg = "${line}" }
btn_no = { fg = "${diag_green}", bg = "${line}" }

[tasks]
border  = { fg = "${comment}" }
title    = { fg = "${constant}" }
hovered = { underline = true }

[which]
mask            = { bg = "${dim}" }
cand            = { fg = "${number}" }
rest            = { fg = "${type}" }
desc            = { fg = "${property}" }
separator       = "  "
separator_style = { fg = "${operator}"}

[spot]
border = { fg = "${comment}" }
title = { fg = "${constant}" }
tbl_col = { fg = "${property}" }
tbl_cell = { fg = "${type}", bg = "${line}" }

[help]
on      = { fg = "${number}" }
run    = { fg = "${property}" }
desc    = { fg = "${comment}" }
hovered = { bg = "${line}", bold = true }
footer  = { fg = "${keyword}", bg = "${line}" }

[notify]
title_info = { fg = "${constant}" }
title_warn = { fg = "${diag_warn}" }
title_error = { fg = "${diag_red}" }

[filetype]
rules = [
    # Media
    { mime = "image/*", fg = "${constant}"},
    { mime = "{audio,video}/*", fg = "${constant}"},

    # Archives
    { mime = "application/{,g}zip", fg = "${operator}"},
    { mime = "application/x-{tar,bzip*,7z-compressed,xz,rar}", fg = "${operator}"},

    # Fallback
    { name = "*", fg = "${fg}"},
    { name = "*/", fg = "${string}"}
]
  ]=],
        colors
    )
    return yazi
end

return M
