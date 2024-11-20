local gears = require("gears")
local wibox = require("wibox")

local layout = {
    spacing = 10,
    spacing_widget = {
        {
            forced_width = 5,
            shape = gears.shape.circle,
            widget = wibox.widget.separator
        },
        valign = 'center',
        halign = 'center',
        widget = wibox.container.place,
    },
    layout = wibox.layout.flex.horizontal
}

return layout
