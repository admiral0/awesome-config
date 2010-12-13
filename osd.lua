-- OSD for volume

osd = naughty.notify({height =50 , width = 200, timeout = 0,position="bottom_left"})
-- Initialize various widgets
osd.layout=wibox.layout.fixed.horizontal()
osd.label=wibox.widget.textbox()
osd.label_m=wibox.layout.margin()
osd.progress_m=wibox.layout.margin()
osd.progress=awful.widget.progressbar()
osd.progress:set_max_value(100)
osd.progress:set_width(150)
osd.progress:set_color("#FFFFFF")
osd.tmr = timer({ timeout = 2 })
osd.busy=false
osd.text="nop"
-- Construct legos
osd.tmr:connect_signal("timeout", function() osd.tmr:stop(); osd.box.visible=false; osd.busy=false end)
osd.label_m:set_margins(5)
osd.label_m:set_widget(osd.label)
osd.progress_m:set_margins(5)
osd.progress_m:set_widget(osd.progress)
osd.layout:add(osd.label_m)
osd.layout:add(osd.progress_m)
osd.box:set_widget(osd.layout)
-- Sets label of osd
osd.setLabel = function (text)
    osd.label:set_markup(text)
end
-- Function to set value of osd and call timer (stub)
osd.setVal=function (vol)
    if vol <= 100 and vol >= 0 then
        osd.progress:set_value(vol)
        return vol
    else
        return nil
    end
end
-- This is the advanced function to use
osd.notify=function(text,value)
    if osd.busy then
        osd.tmr:stop()
        osd.setLabel(text)
        osd.setVal(value)
        osd.tmr:start()
    else
        osd.setLabel(text)
        osd.setVal(value)
        osd.box.visible=true
        osd.busy=true
        osd.tmr:start()
    end
end
