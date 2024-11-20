local awful = require("awful")
local buttons = require("widgets.taglist.buttons")
local template = require("widgets.taglist.template")

local function create_taglist(s)
    return awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = buttons,
        widget_template = template,
    }
end

return create_taglist
