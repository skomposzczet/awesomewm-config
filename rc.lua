pcall(require, "luarocks.loader")

local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

require("theme.catppuccin")

local keys = require("keys")
require("error")
require("signals")
require("rules")
require("daemon")
local cpu = require("widgets.cpu")
local mem = require("widgets.mem")
local pipe = require("widgets.pipe")
local separator = require("widgets.separator")

awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.floating,
}

-- {{{ Menu
myawesomemenu = {
    { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
    { "restart", awesome.restart },
    { "quit", function() awesome.quit() end },
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },}})

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })

-- {{{ Wibar
mytextclock = wibox.widget.textclock()

awful.screen.connect_for_each_screen(function(s)
    set_wallpaper(s)

    -- Each screen has its own tag table.
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
            pipe,
            mem,
            separator,
            cpu,
            pipe,
            mytextclock,
        },
    }
end)
-- }}}

root.buttons(keys.globalbuttons)
root.keys(keys.globalkeys)

local function load_tag()
    local f = io.open(os.getenv("HOME") .. "/.awm-tag", "r")
    if f == nil then
        return
    end
    local tag_name = f:read("*line")
    f:close()
    remove_last_tag()
    local t = awful.tag.find_by_name(nil, tag_name)
    if t then t:view_only() end
end

load_tag()

awful.spawn.with_shell(gears.filesystem.get_xdg_config_home() .. "awesome/startup.sh")
