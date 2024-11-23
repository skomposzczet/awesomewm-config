local wibox = require "wibox"
local gears = require("gears")
local theme = require("theme.catppuccin.widgets")
local hover = theme.tasklist

local Vol = {}
Vol.__index = Vol

function Vol:update_widget(volume, mute)
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
    self.icon.markup = "<span foreground='" .. color .. "'>" .. glyph .. "</span>"
end

function Vol:connect_signals()
    awesome.connect_signal("signal::vol", function(args)
        local volume = args.volume
        local mute = args.mute
        self:update_widget(volume, mute)
    end)

    self.widget:connect_signal("button::press", function()
        awesome.emit_signal("signal::vol::mute", nil)
    end)

    self.widget:connect_signal("mouse::enter", function()
        if self.widget.bg ~= hover then
            self.widget.backup = self.widget.bg
            self.widget.has_backup = true
            self.widget.bg = hover
        end
    end)

    self.widget:connect_signal("mouse::leave", function()
        if self.widget.has_backup then
            self.widget.bg = self.widget.backup
        end
    end)
end

function Vol:init_widget()
    self:connect_signals()
end

function Vol:new()
    local icon = wibox.widget.textbox()
    icon.font = theme.icon.font .. " 15.5"
    icon.align = 'center'
    icon.markup = "<span foreground='" .. theme.vol.unk.color .. "'>" .. theme.vol.unk.glyph .. "</span>"

    local widget = wibox.widget{
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

    local vol = {
        icon = icon,
        widget = widget,
    }

    setmetatable(vol, Vol)
    return vol
end

local function create()
    local vol = Vol:new()
    vol:init_widget()
    return vol
end

return create
