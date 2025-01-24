local beautiful = require("beautiful")
local naughty = require("naughty")
local dpi = require("beautiful.xresources").apply_dpi

beautiful.notification_bg = "#00000000"
beautiful.notification_border_width = 0
beautiful.notification_spacing = dpi(25)
naughty.config.defaults['icon_size'] = 100
