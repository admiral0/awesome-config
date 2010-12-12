-- Libs
require("awful")
require("awful.autofocus")
require("awful.rules")
require("beautiful")
require("naughty")
require("awful.remote")
require("vicious")
require("vicious.contrib")
-- Paths
configpath="/home/"..os.getenv("USER").."/.config/awesome/"
iconpath= configpath.."icons/"

-- Theme TODO
beautiful.init(configpath.."/theme/theme.lua")
-- Global Variables
require("global")

layouts =
{
	awful.layout.suit.tile.top,
	awful.layout.suit.fair,
        awful.layout.suit.max,
	awful.layout.suit.floating,
--	awful.layout.suit.tile,
--	awful.layout.suit.tile.left,
--	awful.layout.suit.tile.bottom,
	awful.layout.suit.fair.horizontal
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

-- Tooltips
-- require("tooltips")

--Media
--require("media-bar")

-- awful.util.spawn("nm-applet --sm-disable")
awful.util.spawn("xcompmgr")
-- avoid Java Fun
awful.util.spawn("wmname LG3D")
--awful.util.spawn("conky")
