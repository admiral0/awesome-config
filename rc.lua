-- Standard awesome library
gears = require("gears")
awful = require("awful")
awful.rules = require("awful.rules")
require("awful.autofocus")
-- Widget and layout library
wibox = require("wibox")
-- Theme handling library
beautiful = require("beautiful")
-- Notification library
naughty = require("naughty")
menubar = require("menubar")
require("awful.remote")
vicious = require("vicious")
vicious.contrib = require("vicious.contrib")



-- Paths
configpath="/home/"..os.getenv("USER").."/.config/awesome/"
iconpath= configpath.."icons/"

-- Theme TODO
beautiful.init(configpath.."/theme/theme.lua")

if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    end
end

-- Global Variables
require("global")

layouts =
{
	awful.layout.suit.tile.top,
--	awful.layout.suit.fair,
        awful.layout.suit.max,
	awful.layout.suit.floating,
	awful.layout.suit.tile,
	awful.layout.suit.tile.left,
	awful.layout.suit.tile.bottom,
--	awful.layout.suit.fair.horizontal
--	awful.layout.suit.spiral,
--	awful.layout.suit.spiral.dwindle,
--	awful.layout.suit.max.fullscreen,
--	awful.layout.suit.magnifier
}

tags ={}
---[[
for s=1,screen.count() do
	tags[s] = awful.tag({1,2,3,4,5,6,7,8,9},s,layouts[1])
end
--]]
-- Defines top bar and widgets inside it.
require("top-bar")

-- Defines Keybindings
require("keybindings")

-- Defines Rules and Signals
require("rules-signals")

-- Pretty osd
--require("osd")

-- Tooltips
 require("tooltips")

-- Startup programs
require("startup")

--Media
--require("media-bar")
