local wibox = require("wibox")
local naughty = require("naughty")
local dpi = require("beautiful.xresources").apply_dpi
local helpers = require("helpers")
local theme = require("theme.catppuccin.notification.theme")

local icon = {}

icon.create_icon_widget_template = function ()
    return wibox.widget {
        font = theme.icon.font,
        align = "center",
        valign = "center",
        widget = wibox.widget.textbox
    }
end

icon.create_icon = function (cairo_icon, app_name, urgency)
    if cairo_icon ~= nil then
        return wibox.widget{
            {
                {
                    resize_strategy = "scale",
                    resize = true,
                    scaling_quality = "best",
                    max_scaling_factor = 2,
                    halign = "center",
                    valign = "center",
                    widget = naughty.widget.icon,
                },
                halign = "center",
                valign = "center",
                widget = wibox.container.place
            },
            forced_width = dpi(50),
            bg = theme.icon.bg,
            widget = wibox.container.background,
        }
    else
        local glyph = theme.icon.glyph[app_name] == nil and theme.icon.glyph.info or theme.icon.glyph[app_name]
        local color = urgency == 'critical' and theme.icon.color.critical or theme.icon.color.info

        return wibox.widget{
            {
                markup = helpers.formatted(glyph, color),
                widget = icon.create_icon_widget_template(),
            },
            forced_width = dpi(50),
            bg = theme.icon.bg,
            widget = wibox.container.background,
        }
    end
end

return icon
