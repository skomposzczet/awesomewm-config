local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup")
local keys = require("keys")
local widgets = require("widgets")

awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.floating,
}

myawesomemenu = {
    { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
    { "restart", awesome.restart },
    { "quit", function() awesome.quit() end },
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },}})

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })

mytextclock = wibox.widget.textclock()

awful.screen.connect_for_each_screen(function(s)
    set_wallpaper(s)

    awful.tag({ " ", "󰈹 ", " ", " ", "󰟞 ", "󰒊 ", "󰧞 ", "󰊠 ", " " }, s, awful.layout.layouts[1])

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
            mylauncher,
            s.mytaglist,
            s.mypromptbox,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.systray(),
            widgets.misc.pipe,
            widgets.info.mem,
            widgets.misc.separator,
            widgets.info.cpu,
            widgets.misc.pipe,
            mytextclock,
        },
    }
end)
