local beautiful = require("beautiful")
local gears = require("gears")
local dpi = require("beautiful.xresources").apply_dpi
local colors = require("theme.catppuccin.colors")


local assets_dir = gears.filesystem.get_xdg_config_home() .. "awesome/theme/catppuccin/assets"

beautiful.useless_gap = dpi(5)

beautiful.taglist_squares_sel = assets_dir .. "/square_sel.png"
beautiful.taglist_squares_unsel = assets_dir .. "/square_unsel.png"
beautiful.taglist_font = "Agave-Regular 12.5"
beautiful.taglist_bg_focus = ""
beautiful.taglist_fg_focus = colors.macchiato.flamingo
beautiful.taglist_fg_occupied = colors.macchiato.mauve
beautiful.taglist_bg_urgent = ""
beautiful.taglist_fg_urgent = colors.macchiato.green

beautiful.tasklist_disable_icon = true
beautiful.tasklist_plain_task_name = true
beautiful.tasklist_align = "left"

beautiful.border_width = 2
beautiful.border_normal = colors.macchiato.base
beautiful.border_focus = colors.mocha.mauve

-- beautiful.titlebar_bg = "#000000"

beautiful.fg_normal = colors.macchiato.subtext0
beautiful.fg_focus = colors.macchiato.text
beautiful.bg_normal = colors.macchiato.crust
beautiful.bg_focus = colors.macchiato.surface0
beautiful.fg_urgent = colors.mocha.maroon
beautiful.bg_urgent = colors.mocha.crust

beautiful.font = "Agave-Regular 11.5"
beautiful.awesome_icon = assets_dir .. "/logo.png"
beautiful.wallpaper = gears.filesystem.get_xdg_config_home() .. "wallpaper/wallpaper.png"
