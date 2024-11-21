local function is_laptop_screen(s)
    for name, _ in pairs(s.outputs) do
        if name == "eDP" then
            return true
        end
    end
    return false
end

return {
    is_laptop_screen = is_laptop_screen,
}
