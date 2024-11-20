local awful = require("awful")
local buttons = require("widgets.tasklist.buttons")
local template = require("widgets.tasklist.template")
local style = require("widgets.tasklist.style")
local layout = require("widgets.tasklist.layout")

local function create_tasklist(s)
    return awful.widget.tasklist {
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
        buttons = buttons,
        style = style,
        layout = layout,
        widget_template = template,
    }
end

return create_tasklist
