local awful = require("awful")
local buttons = require("widgets.tasklist.buttons")

local function create_tasklist(s)
    return awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = buttons,
    }
end

return create_tasklist
