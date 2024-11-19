local wibox = require "wibox"
local beautiful = require "beautiful"
local dpi = beautiful.xresources.apply_dpi
local values = require("theme.catppuccin.widgets")

local icon = wibox.widget.textbox()
icon.font = values.icon_font.." 12.5"
icon.align = 'center'
icon.markup = "<span foreground='" .. values.mem .. "'> </span>"

local usage = wibox.widget.textbox()
usage.font = values.text_font .. " 11"
usage.align = 'center'
usage.markup = "n/a%"

local function init_set_usage_signal()
    awesome.connect_signal("signal::mem", function(mem_usage)
        usage.markup = string.format("%d%%", tonumber(mem_usage))
    end)
end

init_set_usage_signal()

local mem = wibox.widget {
    {
        {
            icon,
            usage,
            spacing = dpi(8),
            layout = wibox.layout.fixed.horizontal,
        },
        left = 1,
        right = 0,
        layout = wibox.container.margin,
    },
    forced_width = 65,
    layout = wibox.layout.fixed.horizontal,
}


return mem