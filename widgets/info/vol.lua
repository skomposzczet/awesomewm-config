local awful = require("awful")
local wibox = require "wibox"
local gears = require("gears")
local theme = require("theme.catppuccin.widgets")
local hover = theme.tasklist

local Vol = {}
Vol.__index = Vol

function Vol:update_widget(volume, mute)
    if volume == nil then return end -- bug
    local color = theme.vol.unk.color
    local glyph = theme.vol.unk.glyph
    local fake_color = theme.vol.fake.color
    local fake_glyph = theme.vol.fake.glyph

    if mute then
        color = theme.vol.mute.color
        glyph = theme.vol.mute.glyph
        fake_glyph = theme.vol.fake.glyph_void
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
    self.fake.markup = "<span foreground='" .. fake_color .. "'>" .. fake_glyph .. "</span>"
end

function Vol:connect_signals()
    awesome.connect_signal("signal::vol", function(args)
        local volume = args.volume
        local mute = args.mute
        self:update_widget(volume, mute)
    end)

    self.widget:connect_signal("button::press", function(_, _, _, button)
        if button == 1 then
            awesome.emit_signal("signal::vol::mute", nil)
        elseif button == 3 then
            awful.spawn("pavucontrol")
        end
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

    local fake = wibox.widget.textbox()
    fake.font = theme.icon.font .. " 15.5"
    fake.align = 'center'
    fake.markup = "<span foreground='" .. theme.vol.fake.color .. "'>" .. theme.vol.fake.glyph .. "</span>"

    local widget = wibox.widget{
        {
            {
                fake,
                icon,
                layout = wibox.layout.stack,
            },
            left = 4,
            bottom = 2,
            widget = wibox.container.margin
        },
        forced_width = 26,
        shape = gears.shape.rounded_rect,
        widget = wibox.container.background,
    }

    local vol = {
        icon = icon,
        fake = fake,
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
