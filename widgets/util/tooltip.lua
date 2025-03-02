local awful = require("awful")

local Tooltip = {}
Tooltip.__index = Tooltip

function Tooltip:new(obj, cmd)
    local tooltip = {
        last_result = "...",
        obj = obj,
        callback = nil,
        align = "bottom_left",
        timoeut = 1,
        tooltip = nil,
    }

    tooltip.callback = function()
        awful.spawn.easy_async_with_shell(cmd, function(result)
            tooltip.last_result = result:sub(1, -2)
        end)
        return tooltip.last_result
    end

    setmetatable(tooltip, Tooltip)
    return tooltip
end

function Tooltip:with_timeout(timeout)
    self.timeout = timeout
end

function Tooltip:start()
    self.tooltip = awful.tooltip {
        objects = { self.obj },
        align = self.align,
        timeout = self.timeout,
        timer_function = self.callback,
    }
    self.callback()
end

return Tooltip
