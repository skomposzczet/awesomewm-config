require("signals.tag")
require("signals.screen")
require("signals.client")

function save_current_tag()
    local t = client.focus and client.focus.first_tag or nil
    if t == nil then
        return
    end
    local f = assert(io.open(os.getenv("HOME") .. "/.awm-tag", "w"))
    f:write(t.name, "\n")
    f:close()
end

function remove_last_tag()
    os.remove(os.getenv("HOME") .. "/.awm-tag")
end

awesome.connect_signal("exit", function (reason_restart)
    if reason_restart then
        save_current_tag()
    else
        remove_last_tag()
    end
end)
