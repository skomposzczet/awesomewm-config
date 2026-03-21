local colors = require("theme.catppuccin.colors")

local theme = {
    icon = {
        font = "UbuntuMono Nerd Font",
    },
    text = {
        font = "FiraCode Nerd Font",
    },

    cpu = {
        icon = {
            fg = colors.macchiato.base,
            bg = colors.macchiato.maroon,
        },
        text = {
            fg = colors.macchiato.maroon,
            bg = colors.macchiato.surface0 .. "90",
        },
    },
    mem = {
        icon = {
            fg = colors.macchiato.crust,
            bg = colors.macchiato.sky,
        },
        text = {
            fg = colors.macchiato.sky,
            bg = colors.macchiato.surface0 .. "90",
        },
    },
    clk = {
        icon = {
            fg = colors.macchiato.surface0,
            bg = colors.macchiato.mauve,
        },
        text = {
            fg = colors.macchiato.overlay2,
            bg = colors.macchiato.surface0 .. "90",
            font = "UbuntuMono Nerd Font 15",
        },
    },
    bat = {
        icon = {
            bg = colors.macchiato.surface0,
        },
        text = {
            fg = colors.macchiato.text,
            bg = colors.macchiato.surface0 .. "90",
        },
        unk = {
            color = colors.macchiato.lavender,
            glyph = "󰂑 ",
        },
        max = {
            color = colors.macchiato.green,
            glyph = " 󰁹 ",
        },
        high = {
            color = colors.macchiato.lavender,
            charging_glyph = "󰂊 ",
            nocharging_glyph = " 󰂂 ",
        },
        medium = {
            color = colors.macchiato.peach,
            charging_glyph = "󰢝 ",
            nocharging_glyph = " 󰁾 ",
        },
        low = {
            color = colors.macchiato.maroon,
            charging_glyph = "󰂇 ",
            nocharging_glyph = " 󰁼 ",
        },
        critical = {
            color = colors.macchiato.red,
            charging_glyph = "󰢜 ",
            nocharging_glyph = " 󰁺 ",
        },
    },
    vol = {
        fake = {
            glyph = "󰕾 ",
            glyph_void = "  ",
            color = colors.macchiato.overlay0,
        },
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
            glyph = "󰕿   ",
        },
    },
    ght = {
        fake = {
            glyph = "󰃠 ",
            glyph_void = "  ",
            color = colors.macchiato.overlay0,
        },
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
            glyph = "󰃞 ",
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
