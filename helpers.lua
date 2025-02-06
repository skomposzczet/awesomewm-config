local helpers = {}

helpers.formatted = function(text, color, font)
    if color == nil and font == nil then
        return text
    end
    local result = "<span "
    if color ~= nil then
        result = result .. "foreground='" .. color .. "' "
    end
    if font ~= nil then
        result = result .. "font='" .. font .. "' "
    end
    result = result .. ">" .. text .. "</span>"
    return result
end

helpers.bold = function(text)
    return "<b>" .. text .. "</b>"
end

return helpers
