local wibox = require("wibox")
local gears = require("gears")
local naughty = require("naughty")
local dpi = require("beautiful.xresources").apply_dpi
local theme = require("theme.catppuccin.notification.theme")

local message = {}

message.message_widget = function()
    return wibox.widget {
        align = "center",
        widget = naughty.widget.message,
    }
end

message.bar_message_widget = function(type, perc)
    local blank = type == "mute"
    perc = tonumber(perc)
    return wibox.widget {
        {
            {
                max_value = 100,
                value = perc,
                forced_height = dpi(10),
                forced_width = dpi(130),
                paddings = dpi(1),
                border_width = 0,
                bar_border_width = 0,
                margins = dpi(5),
                color = blank and theme.level.fg_blank or theme.level.fg,
                background_color = theme.level.bg,
                shape = gears.shape.rounded_bar,
                widget = wibox.widget.progressbar,
            },
            {
                -- markup = perc .. "%",
                -- align = "center",
                -- widget = wibox.widget.textbox,
        align = "center",
        widget = naughty.widget.message,
            },
            expand = "inside",
            layout = wibox.layout.align.horizontal
        },
        forced_width = dpi(170),
        widget = wibox.widget.background,
    }
end

return message
