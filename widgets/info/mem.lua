local wibox = require "wibox"
local gears = require("gears")
local theme = require("theme.catppuccin.widgets")

local icon = wibox.widget.textbox()
icon.font = theme.icon.font .. " 12.5"
icon.align = 'center'
icon.markup = "<span foreground='" .. theme.mem.icon.fg .. "'> </span>"

local usage = wibox.widget.textbox()
usage.font = theme.text.font .. " 11"
usage.align = 'center'
usage.markup = "n/a%"

local function init_set_usage_signal()
    awesome.connect_signal("signal::mem", function(mem_usage)
        usage.markup = "<span foreground='" .. theme.mem.text.fg .. "'>" .. mem_usage .. "%</span>"
    end)
end

init_set_usage_signal()

local mem = wibox.widget {
    {
        icon,
        shape = function(cr, h, w) gears.shape.partially_rounded_rect(cr, h, w, true, false, false, true) end,
        bg = theme.mem.icon.bg,
        forced_width = 25,
        widget = wibox.container.background,
    },
    {
        usage,
        shape = function(cr, h, w) gears.shape.partially_rounded_rect(cr, h, w, false, true, true, false) end,
        bg = theme.mem.text.bg,
        forced_width = 50,
        widget = wibox.container.background,
    },
    layout = wibox.layout.fixed.horizontal,
}

return mem
