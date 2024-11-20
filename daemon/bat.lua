local awful = require "awful"
local gears = require "gears"

local function get_bat_usage()
    local cmd = "acpi | cut -d, -f 2 | xargs"
    local cmdc = "acpi | grep -e '\\s[Cc]harging' | wc -l"

    awful.spawn.easy_async_with_shell(cmd, function(usage)
        awful.spawn.easy_async_with_shell(cmdc, function(charging)
            usage = usage:match("%d+")
            local args = {
                usage = usage,
                charging = charging,
            }
            awesome.emit_signal("signal::bat", args)
        end)
    end)
end

gears.timer {
    timeout = 5,
    call_now = true,
    autostart = true,
    callback = function()
        get_bat_usage()
    end
}
