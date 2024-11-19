local widgets = {
    misc = {
        pipe = require("widgets.misc.pipe"),
        separator = require("widgets.misc.separator"),
    },
    info = {
        cpu = require("widgets.info.cpu"),
        mem = require("widgets.info.mem"),
    },
}

return widgets
