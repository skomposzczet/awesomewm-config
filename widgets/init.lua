local widgets = {
    misc = {
        pipe = require("widgets.misc.pipe"),
        separator = require("widgets.misc.separator"),
        launcher = require("widgets.misc.launcher"),
    },
    info = {
        cpu = require("widgets.info.cpu"),
        mem = require("widgets.info.mem"),
    },
}

return widgets
