local Util = require("neomodern.util")

local M = {}

function M.generate(colors, info)
    colors.extra = info.extra
    colors.url = info.url
    colors.upstream = info.upstream
    colors.theme = string.lower(info.theme)
    local nu = Util.template(
        [=[
# name: ${theme} colors for ${extra}
# url: ${url}
# upstream: ${upstream}
# author: Casey Miller

# 1. copy to ~/.config/nushell/themes/${theme}.nu
# 2. load in your config.nu:
#       source ~/.config/nushell/themes/${theme}.nu

let theme = {
    alt: "${alt}",
    alt_bg: "${alt_bg}",
    bg: "${bg}",
    comment: "${comment}",
    constant: "${constant}",
    fg: "${fg}",
    func: "${func}",
    keyword: "${keyword}",
    line: "${line}",
    number: "${number}",
    operator: "${operator}",
    property: "${property}",
    string: "${string}",
    type: "${type}",
    visual: "${visual}",
    diag_red: "${diag_red}",
    diag_blue: "${diag_blue}",
    diag_yellow: "${diag_yellow}",
    diag_green: "${diag_green}",
}

$env.config.color_config = {
        separator: $theme.comment
        leading_trailing_space_bg: { attr: n }
        header: { fg: $theme.func attr: b}
        empty: $theme.property
        bool: $theme.number
        int: $theme.number
        float: $theme.number
        filesize: $theme.type
        duration: $theme.type
        date: $theme.property
        range: $theme.string
        string: $theme.string
        nothing: $theme.comment
        binary: $theme.constant
        cellpath: $theme.property
        row_index: { fg: $theme.func attr: b }
        record: $theme.property
        list: $theme.property
        block: $theme.property
        hints: $theme.comment
        search_result: { fg: $theme.property bg: $theme.visual }

        shape_and: { fg: $theme.keyword }
        shape_binary: $theme.operator
        shape_block: $theme.property
        shape_bool: $theme.number
        shape_closure: $theme.func
        shape_custom: $theme.func
        shape_datetime: { fg: $theme.string attr: b }
        shape_directory: $theme.string
        shape_external: $theme.func
        shape_externalarg: $theme.alt
        shape_filepath: $theme.type
        shape_flag: { fg: $theme.alt attr: b }
        shape_float: $theme.number
        shape_garbage: { fg: $theme.fg bg: "${diag_red}" attr: b }
        shape_globpattern: { fg: $theme.type attr: b }
        shape_int: $theme.number
        shape_internalcall: $theme.func
        shape_keyword: $theme.keyword
        shape_list: $theme.string
        shape_literal: $theme.string
        shape_match_pattern: $theme.type
        shape_matching_brackets: { fg: $theme.fg attr: b }
        shape_nothing: $theme.comment
        shape_operator: $theme.operator
        shape_or: $theme.keyword
        shape_pipe: $theme.operator
        shape_range: $theme.string
        shape_record: $theme.string
        shape_redirection: $theme.operator
        shape_signature: $theme.func
        shape_string: $theme.string
        shape_string_interpolation: $theme.alt
        shape_table: { fg: $theme.property attr: b }
        show_variable: $theme.fg
        shape_vardec1: { fg: $theme.fg attr: u }
}

$env.config.highlight_resolved_externals = true
$env.config.explore = {
    status_bar_background: { fg: $theme.fg, bg: $theme.line },
    command_bar_text: { fg: $theme.fg },
    highlight: { fg: $theme.type, bg: $theme.visual },
    status: {
        error: $theme.diag_red,
        warn: $theme.diag_yellow,
        info: $theme.diag_blue,
    },
    selected_cell: { bg: $theme.line fg: $theme.type },

}
$env.LS_COLORS = "di=32:ln=35:fi=37:ex=37:*.tar=33:*.tgz=33:*.arc=33:*.arj=33:*.taz=33:*.lha=33:*.lz4=33:*.lzh=33:*.lzma=33:*.tlz=33:*.txz=33:*.tzo=33:*.t7z=33:*.zip=33:*.z=33:*.dz=33:*.gz=33:*.lrz=33:*.lz=33:*.lzo=33:*.xz=33:*.zst=33:*.tzst=33:*.bz2=33:*.bz=33:*.tbz=33:*.tbz2=33:*.tz=33:*.deb=33:*.rpm=33:*.jar=33:*.war=33:*.ear=33:*.sar=33:*.rar=33:*.alz=33:*.ace=33:*.zoo=33:*.cpio=33:*.7z=33:*.rz=33:*.cab=33:*.wim=33:*.swm=33:*.dwm=33:*.esd=33:*.jpg=36:*.jpeg=36:*.mjpg=36:*.mjpeg=36:*.gif=36:*.bmp=36:*.pbm=36:*.pgm=36:*.ppm=36:*.tga=36:*.xbm=36:*.xpm=36:*.tif=36:*.tiff=36:*.png=36:*.svg=36:*.svgz=36:*.mng=36:*.pcx=36:*.webp=36:*.ico=36:*.pdf=36:*.ps=36:*.eps=36"
>>>>>>> main
]=],
        colors
    )

    return nu
end

return M
