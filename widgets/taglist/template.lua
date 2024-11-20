local wibox = require("wibox")
local values = require("theme.catppuccin.widgets")
local hover = values.taglist

local template = {
    {
        {
            id = 'text_role',
            widget = wibox.widget.textbox,
        },
        left = 5,
        right = 5,
        widget = wibox.container.margin
    },
    id = 'background_role',
    widget = wibox.container.background,
    create_callback = function(self)
        self:connect_signal('mouse::enter', function()
            if self.bg ~= hover then
                self.backup = self.bg
                self.has_backup = true
            end
            self.bg = hover
        end)
        self:connect_signal('mouse::leave', function()
            if self.has_backup then self.bg = self.backup end
        end)
    end,
}

return template
