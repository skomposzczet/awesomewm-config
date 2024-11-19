pcall(require, "luarocks.loader")

local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
require("theme.catppuccin")

local keys = require("keys")
require("error")
require("signals")
require("rules")
require("daemon")
require("wibar")

root.buttons(keys.globalbuttons)
root.keys(keys.globalkeys)

local function load_tag()
    local f = io.open(os.getenv("HOME") .. "/.awm-tag", "r")
    if f == nil then
        return
    end
    local tag_name = f:read("*line")
    f:close()
    remove_last_tag()
    local t = awful.tag.find_by_name(nil, tag_name)
    if t then t:view_only() end
end

load_tag()

awful.spawn.with_shell(gears.filesystem.get_xdg_config_home() .. "awesome/startup.sh")
