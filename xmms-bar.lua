mediabar = awful.wibox({position = 'bottom'})
med_play = awful.widget.launcher({
				icon = image(beautiful.awesome_icon),
				command = "xmms2 play"
				})
---[[
med_info=widget({type="textbox"})
med_right_aligned={layout = awful.widget.layout.horizontal.rightleft}
mediabar.height=20
mediabar.widgets={
	mod_play,
	med_info,
	layout = awful.widget.layout.horizontal.leftright,
	height = mediabar.height
}
--]]
mediabar.visible = false
awful.util.spawn("awesome-helperd",false,1)
