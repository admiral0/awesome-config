local freedesktop={}
local function gfind(arg1)
  return string.find(arg1)
end
freedesktop.utils = require('freedesktop.utils')
freedesktop.utils.terminal = "sakura" 
freedesktop.utils.icon_theme = 'oxygen' -- /usr/share/icons/
freedesktop.menu  = require('freedesktop.menu')
---[[
  menu_items = freedesktop.menu.new()
  myawesomemenu = {
     { "manual", "sakura" .. " -e man awesome", freedesktop.utils.lookup_icon({ icon = 'help' }) },
     { "edit config", "sakura -e vim " .. " " .. awesome.conffile , freedesktop.utils.lookup_icon({ 
     icon = 'package_settings' }) },
     { "restart", awesome.restart, freedesktop.utils.lookup_icon({ icon = 'gtk-refresh' }) },
     { "quit", awesome.quit, freedesktop.utils.lookup_icon({ icon = 'gtk-quit' }) }
  }
  table.insert(menu_items, { "awesome", myawesomemenu, beautiful.awesome_icon })
  table.insert(menu_items, { "open terminal", terminal, freedesktop.utils.lookup_icon({icon = 'terminal'}) })

  mymainmenu = awful.menu({ items = menu_items, width = 150, opacity=0.60 })

  mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

--]]
