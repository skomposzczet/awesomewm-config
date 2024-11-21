local wibox = require "wibox"
local gears = require("gears")
local theme = require("theme.catppuccin.widgets")
local hover = theme.tasklist

local icon = wibox.widget.textbox()
icon.font = theme.icon.font .. " 15.5"
icon.align = 'center'
icon.markup = "<span foreground='" .. theme.vol.unk.color .. "'>" .. theme.vol.unk.glyph .. "</span>"

local vol = wibox.widget{
    {
        {
            widget = icon,
            id = 'text_role',
        },
        left = 6,
        right = 3,
        widget = wibox.container.margin
    },
    id = 'background_role',
    shape = gears.shape.rounded_rect,
    widget = wibox.container.background,
}

local function update_widget(volume, mute)
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
end

local function connect_signals()
    awesome.connect_signal("signal::vol", function(args)
        local volume = args.volume
        local mute = args.mute
        update_widget(volume, mute)
    end)

    vol:connect_signal("button::press", function()
        awesome.emit_signal("signal::vol::mute", nil)
    end)

    vol:connect_signal("mouse::enter", function()
        if vol.bg ~= hover then
            vol.backup = vol.bg
            vol.has_backup = true
            vol.bg = hover
        end
    end)

    vol:connect_signal("mouse::leave", function()
        if vol.has_backup then
            vol.bg = vol.backup
        end
    end)
end

local function init_widget()
    connect_signals()
end

init_widget()

return vol
