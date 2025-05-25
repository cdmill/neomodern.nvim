# name: iceclimber colors for Nushell
# url: https://github.com/nushell/nushell
# upstream: https://github.com/cdmill/neomodern.nvim/raw/main/extras/nushell/iceclimber.nu
# author: Casey Miller

# 1. copy to ~/.config/nushell/themes/iceclimber.nu
# 2. load in your config.nu:
#       source ~/.config/nushell/themes/iceclimber.nu

let theme = {
    alt: "#abbceb",
    alt_bg: "#111113",
    bg: "#171719",
    comment: "#555568",
    constant: "#86a3f0",
    fg: "#bbbac1",
    func: "#cc93b8",
    keyword: "#8a88db",
    line: "#1d1d22",
    number: "#cfa18c",
    operator: "#9b99a3",
    property: "#629da3",
    string: "#6b6b99",
    type: "#a8a6de",
    visual: "#2a2a31",
    diag_red: "#e67e80",
    diag_blue: "#778fd1",
    diag_yellow: "#ad9368",
    diag_green: "#658c6d",
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
        shape_garbage: { fg: $theme.fg bg: "#e67e80" attr: b }
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

}
