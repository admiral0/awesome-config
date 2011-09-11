batwidget = widget({type="textbox"})
vicious.register(batwidget,vicious.widgets.bat,
    function (widget,args)
	dbus_pwr=tonumber(awful.util.pread("qdbus --system org.freedesktop.UPower /org/freedesktop/UPower/devices/battery_BAT1 org.freedesktop.UPower.Device.EnergyRate"))
        if args[1] == "+" then
            return "<span color='green'>(".. dbus_pwr .."W) ".."("..args[2].."%|"..args[3]..")</span>"
        end
        local pwr = "(".. dbus_pwr .." W)"
        if dbus_pwr > 20 then pwr = "<b>(<span color='red'>".. dbus_pwr .."W</span>)</b>" end
        local cap = "("..args[2].."%|"..args[3]..")"
        if args[2] < 5 then cap = "<b><span color='red'>("..args[2].."%|"..args[3]..")</span></b>" end
        return pwr.." "..cap
    end,41,"BAT1")
--[[
volwidget = widget({type="textbox"}) 
vicious.register(volwidget, vicious.contrib.pulse,
    function (widget, args) 
        return "<b>("..math.floor(args[1]).."%)</b> "
    end, 2, "alsa_output.pci-0000_00_1b.0.analog-stereo")
volwidget:buttons(awful.util.table.join( awful.button({ }, 1, function () awful.util.spawn("pavucontrol") end),
      awful.button({ }, 4, function () vicious.contrib.pulse.add(5,"alsa_output.pci-0000_00_1b.0.analog-stereo") end),
      awful.button({ }, 5, function () vicious.contrib.pulse.add(-5,"alsa_output.pci-0000_00_1b.0.analog-stereo") end)
      ))
--]]
