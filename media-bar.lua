mediabar = awful.wibox({position = 'bottom'})
---[[
btn_prev = awful.widget.launcher({ image = image(iconpath.."prev.png"),  command = "audtool playlist-reverse" })
btn_play = awful.widget.launcher({ image = image(iconpath.."play.png"),  command = "audtool playback-playpause" })
btn_stop = awful.widget.launcher({ image = image(iconpath.."stop.png"),  command = "audtool playback-stop" })
btn_next = awful.widget.launcher({ image = image(iconpath.."next.png"),  command = "audtool playlist-advance" })
med_info=widget({type="textbox"})
med_right_aligned={ layout = awful.widget.layout.horizontal.rightleft}
med_bitrate=widget({type="textbox"})
btn_win = awful.widget.button({ image = image(iconpath.."show.png"),  command = "audtool mainwin-show off;audtool mainwin-show on" })
btn_prefs = awful.widget.button({ image = image(iconpath.."prefs.png"),  command = "audtool preferences-show on" })
--table.insert(med_right_align)
table.insert(med_right_aligned, med_bitrate)
table.insert(med_right_aligned, btn_win)
table.insert(med_right_aligned, btn_prefs)
mediabar.height=15
mediabar.widgets={
--	med_play,
	btn_prev,
	btn_play,
	btn_stop,
	btn_next,
	med_right_aligned,
	med_info,
	layout = awful.widget.layout.horizontal.leftright,
	height = mediabar.height
}
--]]
mediabar.visible = false
