local menubar = require("menubar")
menubar.utils.terminal = "wezterm"

local super = "Mod4"
local shift = "Shift"
local ctrl = "Control"
local screenshot_dir = os.getenv("HOME") .. "/Pictures/Screenshots"

local mod = {
    super = super,
    shift = shift,
    ctrl = ctrl,
    screenshot_dir = screenshot_dir,
}

return mod
