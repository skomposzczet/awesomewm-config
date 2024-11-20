local awful = require("awful")
local wibox = require("wibox")
local keys = require("keys")
local widgets = require("widgets")
local settings= require("wibar.settings")

local mytextclock = wibox.widget.textclock()

awful.screen.connect_for_each_screen(function(s)
    set_wallpaper(s)

    awful.tag(settings.tags, s, settings.default_layout)

    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = keys.taglist_buttons
    }

    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = keys.tasklist_buttons
    }

    s.mywibox = awful.wibar({
        position = "top",
        screen = s,
        height = 25,
    })

    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            widgets.misc.launcher,
            s.mytaglist,
            s.mypromptbox,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.systray(),
            widgets.misc.pipe,
            widgets.info.mem,
            widgets.info.cpu,
            widgets.info.bat,
            widgets.misc.pipe,
            mytextclock,
        },
    }
end)
