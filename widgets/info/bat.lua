local wibox = require "wibox"
local gears = require("gears")
local theme = require("theme.catppuccin.widgets")
local Noti = require("theme.catppuccin.notification.noti")

local icon = wibox.widget.textbox()
icon.font = theme.icon.font.." 12.5"
icon.align = 'center'
icon.markup = "<span foreground='" .. theme.bat.unk.color .. "'>".. theme.bat.unk.glyph .. "</span>"

local usage = wibox.widget.textbox()
usage.font = theme.text.font .. " 11"
usage.align = 'center'
usage.markup = "n/a%"

local noti_sent = false
local noti_threshold = 10

local function send_noti()
    Noti:new():spawn({
        app_name = "battery",
        urgency = "critical",
        message = "Battery level low < " .. tostring(noti_threshold) .. "%",
        title = "Battery is dying...",
    })
end

local function handle_noti(bat_usage, charging)
    if bat_usage < noti_threshold and not charging then
        if not noti_sent then
            send_noti()
            noti_sent = true
        end
    else
        noti_sent = false
    end
end

local function update_icon(bat_usage, charging)
    handle_noti(bat_usage, charging)

    local color = theme.bat.unk.color
    local glyph = theme.bat.unk.glyph

    if bat_usage == 100 then
        color = theme.bat.max.color
        glyph = theme.bat.max.glyph
    elseif bat_usage < 5 then
        color = theme.bat.critical.color
        if charging then
            glyph = theme.bat.critical.charging_glyph
        else
            glyph = theme.bat.critical.nocharging_glyph
        end
    elseif bat_usage < 20 then
        color = theme.bat.low.color
        if charging then
            glyph = theme.bat.low.charging_glyph
        else
            glyph = theme.bat.low.nocharging_glyph
        end
    elseif bat_usage < 50 then
        color = theme.bat.medium.color
        if charging then
            glyph = theme.bat.medium.charging_glyph
        else
            glyph = theme.bat.medium.nocharging_glyph
        end
    else
        color = theme.bat.high.color
        if charging then
            glyph = theme.bat.high.charging_glyph
        else
            glyph = theme.bat.high.nocharging_glyph
        end
    end
    icon.markup = "<span foreground='" .. color .. "'> " .. glyph .. "</span>"
end

local function init_set_usage_signal()
    awesome.connect_signal("signal::bat", function(args)
        local bat_usage = tonumber(args.usage)
        local charging = string.find(args.charging, 1)
        usage.markup = "<span foreground='" .. theme.bat.text.fg .. "'>" .. bat_usage .. "%</span>"
        update_icon(bat_usage, charging)
    end)
end

init_set_usage_signal()

local bat = wibox.widget {
    {
        {
            icon,
            shape = function(cr, h, w) gears.shape.partially_rounded_rect(cr, h, w, true, false, false, true) end,
            bg = theme.bat.icon.bg,
            forced_width = 30,
            widget = wibox.container.background,
        },
        {
            usage,
            shape = function(cr, h, w) gears.shape.partially_rounded_rect(cr, h, w, false, true, true, false) end,
            bg = theme.bat.text.bg,
            forced_width = 50,
            widget = wibox.container.background,
        },
        layout = wibox.layout.fixed.horizontal,
    },
    margins = 3,
    widget = wibox.container.margin,
}

return bat
