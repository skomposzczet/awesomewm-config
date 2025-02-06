local awful = require "awful"

local function send_ght_signal(noti)
    local cmd = "xbacklight -get"

    awful.spawn.easy_async_with_shell(cmd, function(level)
        local args = {
            level = tonumber(level),
            noti = noti,
        }
        awesome.emit_signal("signal::ght", args)
    end)
end

send_ght_signal()

local function inc()
    local cmd = "xbacklight -inc 5"
    awful.spawn(cmd)
    send_ght_signal(true)
end

local function dec()
    local cmd = "xbacklight -dec 5"
    awful.spawn(cmd)
    send_ght_signal(true)
end

local function min()
    local cmd = "xbacklight -set 20"
    awful.spawn(cmd)
    send_ght_signal(true)
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
    send_ght_signal(false)
    connect_mute()
end

init()

return ght
