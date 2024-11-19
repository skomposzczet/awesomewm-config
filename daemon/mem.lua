local awful = require "awful"
local gears = require "gears"

local function get_mem_usage()
    local cmd = "free | grep Mem | awk '{print $3/$2 * 100.0}' | cut -f 1 -d '.'"

    awful.spawn.easy_async_with_shell(cmd, function(usage)
        usage = usage:match("%d+")
        awesome.emit_signal("signal::mem", usage)
    end)
end

gears.timer {
    timeout = 11,
    call_now = true,
    autostart = true,
    callback = function()
        get_mem_usage()
    end
}
