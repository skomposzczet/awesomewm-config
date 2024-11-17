local awful = require("awful")
local gears = require("gears")

-- Handle clients when screen is removed
tag.connect_signal("request::screen", function(t)
    local fallback_tag

    -- Find tag with same name on any other screen
    for s in screen do
        if s ~= t.screen then
            fallback_tag = awful.tag.find_by_name(s, t.name)
            if fallback_tag then break end
        end
    end

    -- Delete the tag and move clients to other screen
    -- t:delete(fallback_tag or awful.tag.find_fallback(), true)
    if fallback_tag then
        t:swap(fallback_tag)
    end

    -- Make sure clients are onscreen
    local clients = fallback_tag:clients() or {}
    gears.timer.delayed_call(function()
        for _,c in pairs(clients) do
            awful.placement.no_offscreen(c)
        end
    end)
end)
