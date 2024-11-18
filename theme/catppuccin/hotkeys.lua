local hotkeys_popup = require("awful.hotkeys_popup.widget")
local colors = require("theme.catppuccin.colors")

local group_colors = {
    colors.macchiato.rosewater,
    colors.macchiato.flamingo,
    colors.macchiato.pink,
    colors.macchiato.mauve,
    colors.macchiato.red,
    colors.macchiato.maroon,
    colors.macchiato.peach,
    colors.macchiato.yellow,
    colors.macchiato.green,
    colors.macchiato.teal,
    colors.macchiato.sky,
    colors.macchiato.sapphire,
    colors.macchiato.blue,
    colors.macchiato.lavender,
}

local groups = {
    {name = "awesome", data = {color = nil, rule = {}}},
    {name = "client", data = {color = nil, rule = {}}},
    {name = "client: minimize/maximize", data = {color = nil, rule = {}}},
    {name = "client: minimize/maximize", data = {color = nil, rule = {}}},
    {name = "launcher", data = {color = nil, rule = {}}},
    {name = "layout", data = {color = nil, rule = {}}},
    {name = "media", data = {color = nil, rule = {}}},
    {name = "rofi", data = {color = nil, rule = {}}},
    {name = "screen", data = {color = nil, rule = {}}},
    {name = "screenshot", data = {color = nil, rule = {}}},
    {name = "tag", data = {color = nil, rule = {}}},
    {name = "tmux: misc", data = {color = nil, rule_any = { class = { "org.wezfurlong.wezterm" } }}},
    {name = "tmux: panes", data = {color = nil, rule_any = { class = { "org.wezfurlong.wezterm" } }}},
    {name = "tmux: sessions", data = {color = nil, rule_any = { class = { "org.wezfurlong.wezterm" } }}},
    {name = "tmux: windows", data = {color = nil, rule_any = { class = { "org.wezfurlong.wezterm" } }}},
    {name = "Firefox: tabs", data = {color = colors.macchiato.lavender, rule_any = { class = { "firefox" } }}},
}

local function apply_group_colors()
    for i, value in pairs(groups) do
        local data = value["data"]
        if data["color"] == nil then
            local index = (i-1) % #group_colors + 1
            data["color"] = group_colors[index]
        end
        hotkeys_popup.add_group_rules(value["name"], data)
    end
end

apply_group_colors()
