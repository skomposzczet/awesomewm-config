local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")
local menubar = require("menubar")
local mod = require("keys.mod")
local gears = require("gears")
local vol = require("signals.vol")
local ght = require("signals.ght")

local keys = gears.table.join(
    awful.key(
        {mod.super, mod.ctrl},
        "l",
        function()
            awful.util.spawn("loginctl lock-session")
        end,
        {description = "lock screen", group = "awesome"}
    ),
    -- Media
    awful.key(
        {},
        "XF86MonBrightnessUp",
        ght.inc,
        {description = "increase brightness", group = "media"}
    ),
    awful.key(
        {},
        "XF86MonBrightnessDown",
        ght.dec,
        {description = "decrease brightness", group = "media"}
    ),
    awful.key(
        {},
        "XF86AudioRaiseVolume",
        vol.inc,
        {description = "increase volume", group = "media"}
    ),
    awful.key(
        {},
        "XF86AudioLowerVolume",
        vol.dec,
        {description = "decrease volume", group = "media"}
    ),
    awful.key(
        {},
        "XF86AudioMute",
        vol.mute,
        {description = "mute/unmute", group = "media"}
    ),
    awful.key({mod.super}, "s", hotkeys_popup.show_help, {description = "show help", group = "awesome"}),
    awful.key({mod.super}, "Left", awful.tag.viewprev, {description = "view previous", group = "tag"}),
    awful.key({mod.super}, "Right", awful.tag.viewnext, {description = "view next", group = "tag"}),
    awful.key({mod.super}, "Escape", awful.tag.history.restore, {description = "go back", group = "tag"}),
    awful.key(
        {mod.super},
        "j",
        function()
            awful.client.focus.byidx(1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key(
        {mod.super},
        "k",
        function()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),
    awful.key(
        {mod.super},
        "w",
        function()
            mymainmenu:show()
        end,
        {description = "show main menu", group = "awesome"}
    ),
    -- Layout manipulation
    awful.key(
        {mod.super, mod.shift},
        "j",
        function()
            awful.client.swap.byidx(1)
        end,
        {description = "swap with next client by index", group = "client"}
    ),
    awful.key(
        {mod.super, mod.shift},
        "k",
        function()
            awful.client.swap.byidx(-1)
        end,
        {description = "swap with previous client by index", group = "client"}
    ),
    awful.key(
        {mod.super, mod.ctrl},
        "j",
        function()
            awful.screen.focus_relative(1)
        end,
        {description = "focus the next screen", group = "screen"}
    ),
    awful.key(
        {mod.super, mod.ctrl},
        "k",
        function()
            awful.screen.focus_relative(-1)
        end,
        {description = "focus the previous screen", group = "screen"}
    ),
    awful.key({mod.super}, "u", awful.client.urgent.jumpto, {description = "jump to urgent client", group = "client"}),
    awful.key(
        {mod.super},
        "Tab",
        function()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}
    ),
    -- Standard program
    awful.key(
        {mod.super},
        "Return",
        function()
            awful.spawn(menubar.utils.terminal)
        end,
        {description = "open a terminal", group = "launcher"}
    ),
    awful.key(
        {mod.super},
        "b",
        function()
            awful.spawn("firefox")
        end,
        {description = "open a firefox", group = "launcher"}
    ),
    awful.key(
        {mod.super, mod.ctrl},
        "r",
        function()
            -- save_current_tag()
            awesome.restart()
        end,
        {description = "reload awesome", group = "awesome"}
    ),
    awful.key({mod.super, mod.shift}, "q", awesome.quit, {description = "quit awesome", group = "awesome"}),
    awful.key(
        {mod.super},
        "l",
        function()
            awful.tag.incmwfact(0.05)
        end,
        {description = "increase master width factor", group = "layout"}
    ),
    awful.key(
        {mod.super},
        "h",
        function()
            awful.tag.incmwfact(-0.05)
        end,
        {description = "decrease master width factor", group = "layout"}
    ),
    awful.key(
        {mod.super, mod.shift},
        "h",
        function()
            awful.tag.incnmaster(1, nil, true)
        end,
        {description = "increase the number of master clients", group = "layout"}
    ),
    awful.key(
        {mod.super, mod.shift},
        "l",
        function()
            awful.tag.incnmaster(-1, nil, true)
        end,
        {description = "decrease the number of master clients", group = "layout"}
    ),
    awful.key(
        {mod.super, mod.ctrl},
        "h",
        function()
            awful.tag.incncol(1, nil, true)
        end,
        {description = "increase the number of columns", group = "layout"}
    ),
    awful.key(
        {mod.super, mod.ctrl},
        "l",
        function()
            awful.tag.incncol(-1, nil, true)
        end,
        {description = "decrease the number of columns", group = "layout"}
    ),
    awful.key(
        {mod.super},
        "space",
        function()
            awful.layout.inc(1)
        end,
        {description = "select next", group = "layout"}
    ),
    awful.key(
        {mod.super, mod.shift},
        "space",
        function()
            awful.layout.inc(-1)
        end,
        {description = "select previous", group = "layout"}
    ),
    awful.key(
        {mod.super},
        "r",
        function()
            awful.spawn('rofi -show combi -modes combi -combi-modes "drun,run" -show-icons -icon-theme "Papirus-Dark"')
        end,
        {description = "run rofi", group = "rofi"}
    ),
    awful.key(
        {mod.super},
        "i",
        function()
            awful.spawn("rofi -show power-menu -modi power-menu:rofi-power-menu")
        end,
        {description = "run rofi power menu", group = "rofi"}
    ),
    awful.key(
        {mod.super},
        "a",
        function()
            awful.spawn("rofi-pass")
        end,
        {description = "run rofi pass", group = "rofi"}
    ),
    awful.key(
        {},
        "Print",
        function()
            awful.spawn("gscreenshot -s -f " .. mod.screenshot_dir)
        end,
        {description = "screenshot select", group = "screenshot"}
    ),
    awful.key(
        {mod.shift},
        "Print",
        function()
            awful.spawn("gscreenshot -f " .. mod.screenshot_dir)
        end,
        {description = "screenshot", group = "screenshot"}
    ),
    awful.key(
        {mod.super},
        "x",
        function()
            awful.prompt.run {
                prompt = "Run Lua code: ",
                textbox = awful.screen.focused().mypromptbox.widget,
                exe_callback = awful.util.eval,
                history_path = awful.util.get_cache_dir() .. "/history_eval"
            }
        end,
        {description = "lua execute prompt", group = "awesome"}
    ),
    awful.key(
        {mod.super},
        "p",
        function()
            menubar.show()
        end,
        {description = "show the menubar", group = "launcher"}
    )
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    keys = gears.table.join(keys,
        awful.key(
            {mod.super},
            "#" .. i + 9,
            function()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    tag:view_only()
                end
            end,
            {description = "view tag #" .. i, group = "tag"}
        ),
        awful.key(
            {mod.super, mod.ctrl},
            "#" .. i + 9,
            function()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    awful.tag.viewtoggle(tag)
                end
            end,
            {description = "toggle tag #" .. i, group = "tag"}
        ),
        awful.key(
            {mod.super, mod.shift},
            "#" .. i + 9,
            function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:move_to_tag(tag)
                    end
                end
            end,
            {description = "move focused client to tag #" .. i, group = "tag"}
        ),
        awful.key(
            {mod.super, mod.ctrl, mod.shift},
            "#" .. i + 9,
            function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:toggle_tag(tag)
                    end
                end
            end,
            {description = "toggle focused client on tag #" .. i, group = "tag"}
        )
    )
end

return keys
