local wibox = require "wibox"
local beautiful = require "beautiful"
local dpi = beautiful.xresources.apply_dpi
local values = require("theme.catppuccin.widgets")

local icon = wibox.widget.textbox()
icon.font = values.icon_font.." 12.5"
icon.align = 'center'
icon.markup = "<span foreground='" .. values.bat.unk.color .. "'>".. values.bat.unk.glyph .. "</span>"

local usage = wibox.widget.textbox()
usage.font = values.text_font .. " 11"
usage.align = 'center'
usage.markup = "n/a%"

local function update_icon(bat_usage, charging)
    local color = values.bat.unk.color
    local glyph = values.bat.unk.glyph
    if bat_usage == 100 then
        color = values.bat.max.color
        glyph = values.bat.max.glyph
    elseif bat_usage < 5 then
        color = values.bat.critical.color
        if charging then
            glyph = values.bat.critical.charging_glyph
        else
            glyph = values.bat.critical.nocharging_glyph
        end
    elseif bat_usage < 20 then
        color = values.bat.low.color
        if charging then
            glyph = values.bat.low.charging_glyph
        else
            glyph = values.bat.low.nocharging_glyph
        end
    elseif bat_usage < 50 then
        color = values.bat.medium.color
        if charging then
            glyph = values.bat.medium.charging_glyph
        else
            glyph = values.bat.medium.nocharging_glyph
        end
    else
        color = values.bat.high.color
        if charging then
            glyph = values.bat.high.charging_glyph
        else
            glyph = values.bat.high.nocharging_glyph
        end
    end
    icon.markup = "<span foreground='" .. color .. "'>" .. glyph .. "</span>"
end

local function init_set_usage_signal()
    awesome.connect_signal("signal::bat", function(args)
        local bat_usage = tonumber(args.usage)
        local charging = string.find(args.charging, 1)
        usage.markup = string.format("%d%%", bat_usage)
        update_icon(bat_usage, charging)
    end)
end

init_set_usage_signal()

local bat = wibox.widget {
    {
        {
            icon,
            usage,
            spacing = dpi(8),
            layout = wibox.layout.fixed.horizontal,
        },
        left = 1,
        right = 0,
        layout = wibox.container.margin,
    },
    forced_width = 65,
    layout = wibox.layout.fixed.horizontal,
}


return bat
