local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local naughty = require("naughty")
local dpi = require("beautiful.xresources").apply_dpi

require("theme.catppuccin.notification.display.settings")
local theme = require("theme.catppuccin.notification.theme")
local icon = require("theme.catppuccin.notification.display.icon")
local message = require("theme.catppuccin.notification.display.message")
local actions = require("theme.catppuccin.notification.display.actions")
local title = require("theme.catppuccin.notification.display.title")
local logger = require("logger")

naughty.connect_signal("request::display", function(n)
    logger.log(n)
    local actions_widget = actions.create_actions_widget(n)
    local message_widget = n.category == "media" and message.bar_message_widget(n.app_name, n.message) or message.message_widget()
    local icon_widget = icon.create_icon(n.icon, n.app_name, n.urgency)
    local title_widget = title.create_title_widget(n.title)
    local padding = wibox.widget{
        forced_height = 10,
        layout = wibox.layout.fixed.vertical
    }
    n.timeout = n.app_name == "battery" and 10 or n.timeout
    n.widget_template = naughty.layout.box {
        notification = n,
        type = "notification",
        shape = gears.shape.rectangle,
        border_width = beautiful.notification_border_width,
        widget_template = {
            {
                {
                    icon_widget,
                    {
                        {
                            title_widget,
                            message_widget,
                            {
                                padding,
                                actions_widget,
                                visible = n.actions and #n.actions > 0,
                                layout = wibox.layout.fixed.vertical
                            },
                            layout = wibox.layout.align.vertical,
                        },
                        margins = dpi(20),
                        widget = wibox.container.margin,
                    },
                    layout = wibox.layout.fixed.horizontal,
                },
                strategy = "max",
                width = dpi(450),
                height = dpi(280),
                widget = wibox.container.constraint,
            },
            shape = function(cr, width, height)
                -- rounding done by compositor - picom
                -- gears.shape.rounded_rect(cr, width, height, 10)
                gears.shape.rectangle(cr, width, height)
            end,
            bg = theme.text.bg,
            widget = wibox.container.background
        }
    }
end)
