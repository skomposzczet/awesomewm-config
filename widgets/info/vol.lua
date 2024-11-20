local wibox = require "wibox"
local theme = require("theme.catppuccin.widgets")

local icon = wibox.widget.textbox()
icon.font = theme.icon.font .. " 15.5"
icon.align = 'center'
icon.markup = "<span foreground='" .. theme.vol.unk.color .. "'>" .. theme.vol.unk.glyph .. "</span>"

local function init_set_vol_signal()
    awesome.connect_signal("signal::vol", function(args)
        local volume = args.volume
        local mute = args.mute

        local color = theme.vol.unk.color
        local glyph = theme.vol.unk.glyph

        if mute then
            color = theme.vol.mute.color
            glyph = theme.vol.mute.glyph
        else
            color = theme.vol.unk.color
            if volume > 66 then
                glyph = theme.vol.high.glyph
            elseif volume > 33 then
                glyph = theme.vol.medium.glyph
            else
                glyph = theme.vol.low.glyph
            end
        end
        icon.markup = "<span foreground='" .. color .. "'>" .. glyph .. "</span>"
    end)
end

init_set_vol_signal()

local vol = wibox.widget {
    {
        icon,
        left = 6,
        right = 0,
        layout = wibox.container.margin,
    },
    forced_width = 30,
    layout = wibox.layout.fixed.horizontal,
}


return vol
