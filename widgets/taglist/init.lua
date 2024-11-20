local awful = require("awful")
local buttons = require("widgets.taglist.buttons")

local function create_taglist(s)
    return awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = buttons,
    }
end

return create_taglist
