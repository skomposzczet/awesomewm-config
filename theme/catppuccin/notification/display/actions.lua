local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local naughty = require("naughty")
local dpi = require("beautiful.xresources").apply_dpi
local theme = require("theme.catppuccin.notification.theme")

local actions = {}

actions.create_actions_widget = function(n)
    return wibox.widget {
        {
            notification = n,
            base_layout = wibox.widget {
                spacing = dpi(3),
                layout = wibox.layout.flex.horizontal
            },
            widget_template = {
                {
                    {
                        {
                            id = 'text_role',
                            font = beautiful.notification_font,
                            widget = wibox.widget.textbox
                        },
                        left = dpi(6),
                        right = dpi(6),
                        widget = wibox.container.margin
                    },
                    widget = wibox.container.place
                },
                bg = theme.action.bg,
                forced_height = dpi(25),
                forced_width = dpi(70),
                shape = gears.shape.rounded_bar,
                widget = wibox.container.background
            },
            style = {
                underline_normal = false,
                underline_selected = true
            },
            widget = naughty.list.actions
        },
        shape = function(cr, w, h) gears.shape.rounded_rect(cr, w, h, 10) end,
        widget = wibox.container.background,
    }
end

return actions
