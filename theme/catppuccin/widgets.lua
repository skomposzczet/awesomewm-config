local colors = require("theme.catppuccin.colors")

local theme = {
    icon_font = "UbuntuMono Nerd Font",
    text_font = "FiraCode Nerd Font",

    cpu = colors.macchiato.maroon,
    mem = colors.macchiato.green,
    bat = {
        unk = {
            color = colors.macchiato.lavender,
            glyph = "󰂑 ",
        },
        max = {
            color = colors.macchiato.green,
            glyph = "󰁹 ",
        },
        high = {
            color = colors.macchiato.lavender,
            charging_glyph = "󰂊 ",
            nocharging_glyph = "󰂂 ",
        },
        medium = {
            color = colors.macchiato.peach,
            charging_glyph = "󰢝 ",
            nocharging_glyph = "󰁾 ",
        },
        low = {
            color = colors.macchiato.maroon,
            charging_glyph = "󰂇 ",
            nocharging_glyph = "󰁼 ",
        },
        critical = {
            color = colors.macchiato.red,
            charging_glyph = "󰢜 ",
            nocharging_glyph = "󰁺 ",
        },
    },

    taglist = colors.macchiato.surface1,
    tasklist = colors.macchiato.surface1,
}

return theme
