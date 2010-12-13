batwidget = wibox.widget.textbox()
vicious.register(batwidget,vicious.widgets.bat,
    function (widget,args)
        if args[1] == "+" then
            return "<span color='green'>("..args[4].."W) ".."("..args[2].."%|"..args[3]..")</span>"
        end
        local pwr = "("..args[4].."W)"
        if args[4] > 20 then pwr = "<b>(<span color='red'>"..args[4].."W</span>)</b>" end
        local cap = "("..args[2].."%|"..args[3]..")"
        if args[2] < 5 then cap = "<b><span color='red'>("..args[2].."%|"..args[3]..")</span></b>" end
        return pwr.." "..cap
    end,41,"BAT1")
volwidget = wibox.widget.textbox()
vicious.register(volwidget, vicious.contrib.pulse,
    function (widget, args) 
        return "<b>("..math.floor(args[1]).."%)</b> "
    end, 2, "alsa_output.pci-0000_00_1b.0.analog-stereo")
volwidget:buttons(awful.util.table.join( awful.button({ }, 1, function () awful.util.spawn("pavucontrol") end),
      awful.button({ }, 4, function () vicious.contrib.pulse.add(5,"alsa_output.pci-0000_00_1b.0.analog-stereo") end),
      awful.button({ }, 5, function () vicious.contrib.pulse.add(-5,"alsa_output.pci-0000_00_1b.0.analog-stereo") end)
      ))
