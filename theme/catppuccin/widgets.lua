local colors = require("theme.catppuccin.colors")

local theme = {
    icon = {
        font = "UbuntuMono Nerd Font",
    },
    text = {
        font = "FiraCode Nerd Font",
    },

    cpu = {
        color = colors.macchiato.maroon,
    },
    mem = {
        color = colors.macchiato.sky,
    },
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
    vol = {
        unk = {
            color = colors.macchiato.text,
            glyph = "󰕾 ",
        },
        mute = {
            color = colors.macchiato.overlay0,
            glyph = "󰖁 ",
        },
        high = {
            glyph = "󰕾 ",
        },
        medium = {
            glyph = "󰖀 ",
        },
        low = {
            glyph = "󰕿 ",
        },
    },
    ght = {
        unk = {
            color = colors.macchiato.text,
            glyph = "󰳲 ",
        },
        high = {
            glyph = "󰃠 ",
        },
        medium = {
            glyph = "󰃞 ",
        },
        low = {
            glyph = "󰃜 ",
        },
    },

    taglist = {
        color = colors.macchiato.surface1,
    },
    tasklist = {
        color = colors.macchiato.surface1,
    },
}

return theme
