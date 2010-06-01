-- tag settings
shifty.config.tags = {
    ["term"] = { position = 1, exclusive = true, spawn = terminal_app, },
    ["web"]  = { position = 2, exclusive = true, spawn = browser_app, layout = awful.layout.suit.max, },
    ["mail"]  = { position = 3, exclusive = true, spawn = mail_app, layout = awful.layout.suit.max, },
}

-- client settings
-- order here matters, early rules will be applied first
---[[
shifty.config.apps = {
         { match = { "Navigator","Vimperator","Gran Paradiso","Firefox","Iceweasel"} , tag = "web" } ,
         { match = { "Shredder.*","Thunderbird" } , tag = "mail" } ,
         { match = { "xterm", "urxvt","sakura","lilyterm"} , honorsizehints = false, slave = true, tag = "term" } ,
         { match = { "pcmanfm" }, slave = true } ,
}
--]]
-- tag defaults
shifty.config.defaults = {
  layout = awful.layout.suit.tile.bottom,
  ncol = 1,
  mwfact = 0.60,
  floatBars=true,
}

shifty.taglist = mytaglist
shifty.init()
