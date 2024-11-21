local wibox = require "wibox"
local theme = require("theme.catppuccin.widgets")

local icon = wibox.widget.textbox()
icon.font = theme.icon.font .. " 15.5"
icon.align = 'center'
icon.markup = "<span foreground='" .. theme.ght.unk.color .. "'>" .. theme.ght.unk.glyph .. "</span>"

local function init_set_ght_signal()
    awesome.connect_signal("signal::ght", function(level)
        local color = theme.ght.unk.color
        local glyph = theme.ght.unk.glyph

        if level > 66 then
            glyph = theme.ght.high.glyph
        elseif level > 33 then
            glyph = theme.ght.medium.glyph
        else
            glyph = theme.ght.low.glyph
        end
        icon.markup = "<span foreground='" .. color .. "'>" .. glyph .. "</span>"
    end)
end

init_set_ght_signal()

local ght = wibox.widget {
    {
        icon,
        left = 6,
        right = 0,
        layout = wibox.container.margin,
    },
    forced_width = 30,
    layout = wibox.layout.fixed.horizontal,
}


return ght
