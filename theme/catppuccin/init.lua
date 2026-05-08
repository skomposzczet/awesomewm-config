local beautiful = require("beautiful")
require("theme.catppuccin.hotkeys")
local gears = require("gears")
local dpi = require("beautiful.xresources").apply_dpi
local colors = require("theme.catppuccin.colors")

beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")

local assets_dir = gears.filesystem.get_xdg_config_home() .. "awesome/theme/catppuccin/assets"

beautiful.useless_gap = dpi(5)

-- beautiful.wibar_bg = colors.mocha.crust

beautiful.taglist_squares_sel = assets_dir .. "/square_sel.png"
beautiful.taglist_squares_unsel = assets_dir .. "/square_unsel.png"
beautiful.taglist_font = "Agave Nerd Font 14"
beautiful.taglist_fg_empty = colors.macchiato.overlay0
beautiful.taglist_bg_focus = ""
beautiful.taglist_fg_focus = colors.macchiato.peach
beautiful.taglist_fg_occupied = colors.mocha.mauve
beautiful.taglist_bg_urgent = ""
beautiful.taglist_fg_urgent = colors.macchiato.green

beautiful.tasklist_disable_icon = true
beautiful.tasklist_plain_task_name = true
beautiful.tasklist_align = "left"
beautiful.tasklist_bg_normal = ""
beautiful.tasklist_bg_focus = ""
beautiful.tasklist_bg_urgent = ""
beautiful.tasklist_bg_minimize = ""

beautiful.border_width = 1
beautiful.border_normal = colors.macchiato.base
beautiful.border_focus = colors.mocha.mauve

-- beautiful.titlebar_bg = "#000000"

beautiful.fg_normal = colors.macchiato.overlay2
beautiful.fg_focus = colors.macchiato.text
beautiful.bg_normal = colors.mocha.crust
beautiful.bg_focus = beautiful.bg_normal
beautiful.fg_urgent = colors.mocha.maroon
beautiful.bg_urgent = beautiful.bg_normal
beautiful.fg_minimize = colors.macchiato.surface2
beautiful.bg_minimize = beautiful.bg_normal

beautiful.bg_systray = beautiful.bg_normal

beautiful.hotkeys_bg = colors.macchiato.mantle
beautiful.hotkeys_fg = colors.macchiato.subtext0
beautiful.hotkeys_modifiers_fg = colors.macchiato.subtext0
beautiful.hotkeys_label_bg = colors.mocha.mauve
beautiful.hotkeys_label_fg = colors.mocha.base
beautiful.hotkeys_font = "FiraCode Nerd Font 9"
beautiful.hotkeys_description_font = "FiraCode Nerd Font 8"

beautiful.font = "Overpass Nerd Font 15"
beautiful.awesome_icon = assets_dir .. "/nixos-logo.png"
beautiful.wallpaper = gears.filesystem.get_xdg_config_home() .. "wallpaper/wallpaper.png"
beautiful.wallpaper = "/home/d3rfnam/Downloads/train.jpg"
beautiful.wallpaper = "/home/d3rfnam/Downloads/green2.jpg"

