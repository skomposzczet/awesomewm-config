local logger = {}

local debug_filename = os.getenv("HOME") .. "/.awm-debug.log"

local function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

logger.log = function (message)
    local time = os.date("%d.%m.%Y, %X")
    local log = string.format("[%s] %s\n", time, dump(message))
    local file = io.open(debug_filename, "a")
    if file == nil then
        return
    end
    file:write(log)
    file:close()
end

return logger
