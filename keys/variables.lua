local menubar = require("menubar")
menubar.utils.terminal = "wezterm"

local modkey = "Mod4"
local shiftkey = "Shift"
local ctrlkey = "Control"
local screenshot_dir = os.getenv("HOME") .. "/Pictures/Screenshots"

local vars = {
    modkey,
    shiftkey,
    ctrlkey,
    screenshot_dir,
}

return vars
