local beautiful = require("beautiful")
local colors = require("theme.catppuccin.colors")

beautiful.notification_font = "FiraCode Nerd Font Mono 14"
beautiful.notification_margin = 15

local theme = {
    icon = {
        font = "Agave Nerd Font 25",
        bg = colors.macchiato.mantle,
        glyph = {
            info = " ",
            critical = " ",
            battery = "󱃍 " ,
            brightness = "󰳲 ",
            volume = " 󰕾 ",
            mute = " 󰖁 ",
        },
        color = {
            info = colors.macchiato.green,
            critical = colors.macchiato.red,
        },
    },
    text = {
        bg = colors.macchiato.base,
        fg = colors.macchiato.text,
    },
    action = {
        bg = colors.macchiato.mantle,
    },
    level = {
        fg = colors.macchiato.text,
        fg_blank = colors.macchiato.overlay1,
        bg = colors.macchiato.surface2,
    },
}

return theme
