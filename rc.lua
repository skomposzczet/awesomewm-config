os.setlocale(os.getenv("LANG"))
pcall(require, "luarocks.loader")
require("awful.autofocus")
require("theme.catppuccin")
require("error")
require("signals")
require("rules")
require("daemon")
require("wibar")
require("start")
require("theme.catppuccin.notification")
