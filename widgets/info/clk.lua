local calendar_widget = require("popups.cal")
local wibox = require "wibox"
local gears = require("gears")
local theme = require("theme.catppuccin.widgets")
local lgi = require("lgi")
local Gio = lgi.require("Gio")

local icon = wibox.widget.textbox()
icon.font = theme.icon.font .. " 11.5"
icon.align = 'center'
icon.markup = "<span foreground='" .. theme.clk.icon.fg .. "'> </span>"

local clock = wibox.widget.textclock("<span foreground='" .. theme.clk.text.fg .. "' font='" .. theme.clk.text.font .."'>%a %b %d, %H:%M</span>")
clock.font = theme.text.font .. " 11"
clock.align = 'center'
local awful = require("awful")
local myclock_t = awful.tooltip {
    objects        = { clock},
    align = "bottom_left",
    timer_function = function()
        return os.date("%T")
    end,
}

-- https://github.com/awesomeWM/awesome/issues/344
local function listen_to_signals()
    local bus = lgi.Gio.bus_get_sync(Gio.BusType.SYSTEM)
    local sender = "org.freedesktop.login1"
    local interface = "org.freedesktop.login1.Manager"
    local object = "/org/freedesktop/login1"
    local member = "PrepareForSleep"
    bus:signal_subscribe(sender, interface, member, object, nil, Gio.DBusSignalFlags.NONE,
    function(bus, sender, object, interface, signal, params)
        -- "signals are sent right before (with the argument True) and
        -- after (with the argument False) the system goes down for
        -- reboot/poweroff, resp. suspend/hibernate."
        if not params[1] then
            require("gears.timer").start_new(2, function()
                myclock_t:force_update()
            end)
        end
    end)
end

listen_to_signals()

local clk = wibox.widget {
    {
        {
            icon,
            shape = function(cr, h, w) gears.shape.partially_rounded_rect(cr, h, w, true, false, false, true) end,
            bg = theme.clk.icon.bg,
            forced_width = 25,
            widget = wibox.container.background,
        },
        {
            clock,
            shape = function(cr, h, w) gears.shape.partially_rounded_rect(cr, h, w, false, true, true, false) end,
            bg = theme.clk.text.bg,
            forced_width = 195,
            widget = wibox.container.background,
        },
        layout = wibox.layout.fixed.horizontal,
    },
    margins = 3,
    widget = wibox.container.margin,
}

local cw = calendar_widget({
    theme = 'naughty',
    placement = 'top_right',
    radius = 0,
    previous_month_button = 2,
    next_month_button = 1,
})
clk:connect_signal("button::press",
    function(_, _, _, button)
        if button == 1 then cw.toggle() end
    end)

return clk
