local wibox = require "wibox"
local gears = require("gears")
local theme = require("theme.catppuccin.widgets")

local icon = wibox.widget.textbox()
icon.font = theme.icon.font .. " 11.5"
icon.align = 'center'
icon.markup = "<span foreground='" .. theme.clk.icon.fg .. "'> </span>"

local clock = wibox.widget.textclock("<span foreground='" .. theme.clk.text.fg .. "' font='" .. theme.clk.text.font .."'>%a %b %d, %H:%M</span>")
clock.font = theme.text.font .. " 11"
clock.align = 'center'

local clk = wibox.widget {
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
}

return clk
