local awful = require("awful")

awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.floating,
}

local tags = { " ", "󰈹 ", " ", " ", "󰟞 ", " ", " 󰧞 ", "󰊠 ", " " }

local settings = {
    tags = tags,
    default_layout = awful.layout.layouts[1],
}

return settings
