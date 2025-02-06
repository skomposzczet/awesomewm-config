local awful = require "awful"

local function send_vol_signal(noti)
    local cmd_volume = "amixer -c 1 -D default sget Master | awk -F'[][]' '/Left:/ { print $2 }' | rev | cut -c2- | rev"
    local cmd_mute = "amixer -c 1 -D default sget Master | grep Left | grep off | wc -l"

    awful.spawn.easy_async_with_shell(cmd_volume, function(volume)
        awful.spawn.easy_async_with_shell(cmd_mute, function(mute)
            local args = {
                volume = tonumber(volume),
                mute = tonumber(mute) == 1,
                noti = noti,
            }
            awesome.emit_signal("signal::vol", args)
        end)
    end)
end

local function inc()
    local cmd = "amixer -c 1 -D default sset Master -M 5%+"
    awful.spawn(cmd)
    send_vol_signal(true)
end

local function dec()
    local cmd = "amixer -c 1 -D default sset Master -M 5%-"
    awful.spawn(cmd)
    send_vol_signal(true)
end

local function mute()
    local cmd = "amixer -c 1 -D default sset Master -M toggle"
    awful.spawn(cmd)
    send_vol_signal(true)
end

local vol = {
    inc = inc,
    dec = dec,
    mute = mute,
}

local function connect_mute()
    awesome.connect_signal("signal::vol::mute", function()
        mute()
    end)
end

local function init()
    send_vol_signal(false)
    connect_mute()
end

init()

return vol
