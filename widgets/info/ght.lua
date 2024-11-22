local wibox = require "wibox"
local gears = require("gears")
local theme = require("theme.catppuccin.widgets")
local hover = theme.tasklist

local icon = wibox.widget.textbox()
icon.font = theme.icon.font .. " 13.5"
icon.align = 'center'
icon.markup = "<span foreground='" .. theme.ght.unk.color .. "'>" .. theme.ght.unk.glyph .. "</span>"

local ght = wibox.widget{
    {
        {
            widget = icon,
            id = 'text_role',
        },
        left = 5,
        right = 5,
        widget = wibox.container.margin
    },
    id = 'background_role',
    shape = gears.shape.rounded_rect,
    widget = wibox.container.background,
}

local function update_widget(level)
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
end

local function connect_signals()
    awesome.connect_signal("signal::ght", function(level)
        update_widget(level)
    end)

    ght:connect_signal("button::press", function()
        awesome.emit_signal("signal::ght::min", nil)
    end)

    ght:connect_signal("mouse::enter", function()
        if ght.bg ~= hover then
            ght.backup = ght.bg
            ght.has_backup = true
            ght.bg = hover
        end
    end)

    ght:connect_signal("mouse::leave", function()
        if ght.has_backup then
            ght.bg = ght.backup
        end
    end)
end

local function init()
    connect_signals()
end

init()

return ght
