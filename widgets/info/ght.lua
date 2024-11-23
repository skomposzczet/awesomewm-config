local wibox = require "wibox"
local gears = require("gears")
local theme = require("theme.catppuccin.widgets")
local hover = theme.tasklist

local Ght = {}
Ght.__index = Ght

function Ght:update_widget(level)
    local color = theme.ght.unk.color
    local glyph = theme.ght.unk.glyph

    if level > 66 then
        glyph = theme.ght.high.glyph
    elseif level > 33 then
        glyph = theme.ght.medium.glyph
    else
        glyph = theme.ght.low.glyph
    end
    self.icon.markup = "<span foreground='" .. color .. "'>" .. glyph .. "</span>"
end

function Ght:connect_signals()
    awesome.connect_signal("signal::ght", function(level)
        self:update_widget(level)
    end)

    self.widget:connect_signal("button::press", function()
        awesome.emit_signal("signal::ght::min", nil)
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

function Ght:init()
    self:connect_signals()
end

function Ght:new()
    local icon = wibox.widget.textbox()
    icon.font = theme.icon.font .. " 13.5"
    icon.align = 'center'
    icon.markup = "<span foreground='" .. theme.ght.unk.color .. "'>" .. theme.ght.unk.glyph .. "</span>"

    local widget = wibox.widget{
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

    local ght = {
        icon = icon,
        widget = widget,
    }

    setmetatable(ght, Ght)
    return ght
end

local function create()
    local ght = Ght:new()
    ght:init()
    return ght
end

return create
