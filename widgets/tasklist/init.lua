local awful = require("awful")
local buttons = require("widgets.tasklist.buttons")
local template = require("widgets.tasklist.template")
local style = require("widgets.tasklist.style")
local layout = require("widgets.tasklist.layout")
local create_sometext = require("widgets.misc.sometext")
local wibox = require("wibox")

local TEXT = "na pewno są planety na których nie ma zim"

local Tasklist = {}
Tasklist.__index = Tasklist

function Tasklist:update()
    local focused = awful.screen.focused()
    if self.tasklist.screen ~= focused then
        return
    end
    local t = focused.selected_tag
    if not t then return end
    if #t:clients() < 1 then
        self.text.visible = true
        self.tasklist.visible = false
    else
        self.text.visible = false
        self.tasklist.visible = true
    end
end

local function create_tasklist(s)
    local tasklist = awful.widget.tasklist {
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
        buttons = buttons,
        style = style,
        layout = layout,
        widget_template = template,
    }
    return tasklist
end

local function create_textwidget()
    local lyt = create_sometext(TEXT)

    return wibox.widget {
        lyt,
        left = 100,
        widget = wibox.container.margin,
    }
end

local function stack_widgets(tasklist, textwidget)
    return wibox.widget {
        layout = wibox.layout.stack,
        textwidget,
        tasklist,
    }
end

function Tasklist:connect_signals()
    local callback = function()
        self:update()
    end
    tag.connect_signal("property::selected", callback)
    client.connect_signal("manage", callback)
    client.connect_signal("unmanage", callback)
end

function Tasklist:init_widget()
    self:connect_signals()
end

function Tasklist:new(s, with_text)
    local tasklist = create_tasklist(s)
    if not with_text then
        local tl = {
            widget = tasklist,
        }

        setmetatable(tl, Tasklist)
        return tl
    end

    local text = create_textwidget()
    local widget = stack_widgets(tasklist, text)
    local tl = {
        widget = widget,
        text = text,
        tasklist = tasklist,
    }
    setmetatable(tl, Tasklist)
    return tl
end

local function create(s, with_text)
    local tl = Tasklist:new(s, with_text)
    tl:init_widget()
    return tl
end

return create
