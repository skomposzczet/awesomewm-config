local beautiful = require("beautiful")
local gears = require("gears")
local dpi = require("beautiful.xresources").apply_dpi

local assets_dir = gears.filesystem.get_xdg_config_home() .. "awesome/theme/catppuccin/assets"

beautiful.useless_gap = dpi(5)

beautiful.taglist_squares_sel = assets_dir .. "/square_sel.png"
beautiful.taglist_squares_unsel = assets_dir .. "/square_unsel.png"
beautiful.taglist_font = "Agave-Regular 10.5"

beautiful.tasklist_disable_icon = true
beautiful.tasklist_plain_task_name = true
beautiful.tasklist_align = "left"

beautiful.border_width = 2
beautiful.border_normal = "#292929"
beautiful.border_focus = "#cba6f7"
beautiful.taglist_font = "Icons 10"

-- beautiful.titlebar_bg = "#000000"

beautiful.fg_normal = "#999999"
beautiful.fg_focus = "#DDDCFF"
beautiful.bg_normal = "#11111b"
beautiful.bg_focus = "#313244"
beautiful.fg_urgent = "#CC9393"
beautiful.bg_urgent = "#2A1F1E"

beautiful.font = "Agave-Regular 11.5"
beautiful.awesome_icon = assets_dir .. "/logo.png"
beautiful.wallpaper = gears.filesystem.get_xdg_config_home() .. "wallpaper/wallpaper.png"
