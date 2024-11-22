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

local function min()
    local cmd = "xbacklight -set 20"
    awful.spawn(cmd)
    send_ght_signal()
end

local ght = {
    inc = inc,
    dec = dec,
}

local function connect_mute()
    awesome.connect_signal("signal::ght::min", function()
        min()
    end)
end

local function init()
    send_ght_signal()
    connect_mute()
end

init()

return ght
