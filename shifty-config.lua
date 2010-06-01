-- tag settings
shifty.config.tags = {
    ["term"] = { position = 1, exclusive = true, spawn = terminal_app, },
    ["web"]  = { position = 2, exclusive = true, spawn = browser_app, layout = awful.layout.suit.max, },
}

-- client settings
-- order here matters, early rules will be applied first
---[[
shifty.config.apps = {
         { match = { "Navigator","Vimperator","Gran Paradiso","Firefox","Iceweasel"} , tag = "web" } ,
         { match = { "xterm", "urxvt","sakura","lilyterm"} , honorsizehints = false, slave = true, tag = "term" } ,
         { match = { "pcmanfm" }, slave = true } ,
        -- { match = { "" }, buttons = {
         --                    button({ }, 1, function (c) client.focus = c; c:raise() end),
           --                  button({ modkey }, 1, function (c) awful.mouse.client.move() end),
             --                button({ modkey }, 3, awful.mouse.client.resize ), }, },
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
