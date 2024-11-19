local awful = require "awful"
local gears = require "gears"

local function get_cpu_usage()
    local cmd = "echo $((100-$(vmstat 1 2 | tail -1 | awk '{print $15}')))"

    awful.spawn.easy_async_with_shell(cmd, function(usage)
        usage = usage:match("%d+")
        awesome.emit_signal("signal::cpu", usage)
    end)
end

gears.timer {
    timeout = 7,
    call_now = true,
    autostart = true,
    callback = function()
        get_cpu_usage()
    end
}
