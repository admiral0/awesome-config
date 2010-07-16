require('freedesktop.utils')
  freedesktop.utils.terminal = "sakura" 
  freedesktop.utils.icon_theme = 'elementary' -- /usr/share/icons/
  require('freedesktop.menu')

  menu_items = freedesktop.menu.new()
  myawesomemenu = {
     { "manual", "sakura" .. " -e man awesome", freedesktop.utils.lookup_icon({ icon = 'help' }) },
     { "edit config", "sakura -e vim " .. " " .. awful.util.getdir("config") .. "/rc.lua", freedesktop.utils.lookup_icon({ 
     icon = 'package_settings' }) },
     { "restart", awesome.restart, freedesktop.utils.lookup_icon({ icon = 'gtk-refresh' }) },
     { "quit", awesome.quit, freedesktop.utils.lookup_icon({ icon = 'gtk-quit' }) }
  }
  table.insert(menu_items, { "awesome", myawesomemenu, beautiful.awesome_icon })
  table.insert(menu_items, { "open terminal", terminal, freedesktop.utils.lookup_icon({icon = 'terminal'}) })

  mymainmenu = awful.menu.new({ items = menu_items, width = 150 })

  mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })


