local wibox = require "wibox"
local gears = require("gears")
local theme = require("theme.catppuccin.widgets")

local icon = wibox.widget.textbox()
icon.font = theme.icon.font .. " 12.5"
icon.align = 'center'
icon.markup = "<span foreground='" .. theme.cpu.icon.fg .. "'> </span>"

local usage = wibox.widget.textbox()
usage.font = theme.text.font .. " 11"
usage.align = 'center'
usage.markup = "n/a%"

local function init_set_usage_signal()
    awesome.connect_signal("signal::cpu", function(cpu_usage)
        usage.markup = "<span foreground='" .. theme.cpu.text.fg .. "'>" .. cpu_usage .. "%</span>"
    end)
end

init_set_usage_signal()

local cpu = wibox.widget {
    {
        {
            icon,
            shape = function(cr, h, w) gears.shape.partially_rounded_rect(cr, h, w, true, false, false, true) end,
            bg = theme.cpu.icon.bg,
            forced_width = 25,
            widget = wibox.container.background,
        },
        {
            usage,
            shape = function(cr, h, w) gears.shape.partially_rounded_rect(cr, h, w, false, true, true, false) end,
            bg = theme.cpu.text.bg,
            forced_width = 50,
            widget = wibox.container.background,
        },
        layout = wibox.layout.fixed.horizontal,
    },
    margins = 3,
    widget = wibox.container.margin,
}

return cpu
