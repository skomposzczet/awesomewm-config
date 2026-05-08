local wibox = require("wibox")
local helpers = require("helpers")
local values = require("theme.catppuccin.widgets")
local colors = values.some_text

local function utf8_iter(s)
    local i = 1
    local n = #s

    return function()
        if i > n then return nil end

        local c = s:byte(i)

        local len =
            (c < 0x80) and 1 or
            (c < 0xE0) and 2 or
            (c < 0xF0) and 3 or
            4

        local char = s:sub(i, i + len - 1)
        i = i + len

        return char
    end
end

local function create_sometext(text)
    local lyt = wibox.layout.fixed.horizontal()

    for char in utf8_iter(text) do
        local tb = wibox.widget {
            markup = helpers.formatted(char, nil, 'Iosevka Nerd Font Medium 14'),
            widget = wibox.widget.textbox
        }
        local bg = wibox.widget {
            tb,
            widget = wibox.container.background
        }

        bg:connect_signal("mouse::enter", function()
            bg.fg = colors.text_hover
        end)
        bg:connect_signal("mouse::leave", function()
            bg.fg = colors.text_normal
        end)

        lyt:add(bg)
    end

    return lyt
end

return create_sometext
