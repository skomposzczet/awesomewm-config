local awful = require("awful")
local wibox = require("wibox")
local widgets = require("widgets")
local settings= require("wibar.settings")
local util = require("wibar.util")
local create_taglist = require("widgets.taglist")
local create_tasklist = require("widgets.tasklist")

awful.screen.connect_for_each_screen(function(s)
    set_wallpaper(s)

    awful.tag(settings.tags, s, settings.default_layout)

    s.mytaglist = create_taglist(s)

    s.mytasklist = create_tasklist(s)

    s.mywibox = awful.wibar({
        position = "top",
        screen = s,
        height = 25,
    })

    s.widgets = {
        vol = widgets.info.vol(),
        ght = util.is_laptop_screen(s) and widgets.info.ght() or { widget = nil },
    }

    local right = {}
    if s == screen.primary then
        right = {
            layout = wibox.layout.fixed.horizontal,
            wibox.layout.margin(wibox.widget.systray(), 2, 2, 2, 2),
            s.widgets.ght.widget,
            s.widgets.vol.widget,
            widgets.misc.pipe,
            widgets.info.mem,
            widgets.info.cpu,
            widgets.info.bat,
            widgets.info.clk,
        }
    else
        right = {
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.systray(),
            s.widgets.ght.widget,
            s.widgets.vol.widget,
            widgets.misc.pipe,
            widgets.info.bat,
            widgets.info.clk,
        }
    end

    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        {
            layout = wibox.layout.fixed.horizontal,
            widgets.misc.launcher,
            s.mytaglist,
            s.mypromptbox,
        },
        s.mytasklist,
        right,
    }
end)
