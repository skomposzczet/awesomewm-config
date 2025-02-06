local naughty = require("naughty")

local Noti = {}
Noti.__index = Noti

function Noti:spawn(args)
    if self.noti then
        self.noti:destroy()
    end
    self.noti = naughty.notification(args)
    return self.noti
end

function Noti:new()
    local noti = {
        noti = nil,
    }

    setmetatable(noti, Noti)
    return noti
end

return Noti
