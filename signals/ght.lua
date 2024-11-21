local awful = require "awful"

local function send_ght_signal()
    local cmd = "xbacklight -get"

    awful.spawn.easy_async_with_shell(cmd, function(level)
        level = tonumber(level)
        awesome.emit_signal("signal::ght", level)
    end)
end

send_ght_signal()

local function inc()
    local cmd = "xbacklight -inc 5"
    awful.spawn(cmd)
    send_ght_signal()
end

local function dec()
    local cmd = "xbacklight -dec 5"
    awful.spawn(cmd)
    send_ght_signal()
end

local ght = {
    inc = inc,
    dec = dec,
}

return ght
