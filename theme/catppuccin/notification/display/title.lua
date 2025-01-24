local wibox = require("wibox")
local beautiful = require("beautiful")
local helpers = require("helpers")
local theme = require("theme.catppuccin.notification.theme")

local title = {}

title.create_title_widget = function(ntitle)
    return wibox.widget{
        align = "center",
        visible = true,
        font = beautiful.notification_font,
        markup = helpers.bold(helpers.formatted(ntitle, theme.text.fg)),
        widget = wibox.widget.textbox,
    }
end

return title
