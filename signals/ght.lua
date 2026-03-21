local awful = require "awful"
local logger = require("logger")

local DELTA = "delta"
local SET = "set"

local DELTA_VAL = 5
local SET_VAL = 20

local function send_ght_signal(mode, value, noti)
    local cmd = "xbacklight -get"

    awful.spawn.easy_async_with_shell(cmd, function(level)
        local lvl = tonumber(level)
        if mode == DELTA then
            lvl = lvl + value
        elseif mode == SET then
            lvl = value
        else
            logger.log("light changed with incorrect mode: " .. mode .. "; noti current")
        end
        local args = {
            level = lvl,
            noti = noti,
        }
        awesome.emit_signal("signal::ght", args)
    end)
end

send_ght_signal()

local function inc()
    send_ght_signal(DELTA, DELTA_VAL, true)
    local cmd = "xbacklight -inc " .. DELTA_VAL .. " -time 500 -steps 60"
    awful.spawn(cmd)
end

local function dec()
    send_ght_signal(DELTA, -DELTA_VAL, true)
    local cmd = "xbacklight -dec " .. DELTA_VAL .. " -time 500 -steps 60"
    awful.spawn(cmd)
end

local function min()
    send_ght_signal(SET, SET_VAL, true)
    local cmd = "xbacklight -set " .. SET_VAL .. " -time 500 -steps 60"
    awful.spawn(cmd)
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
