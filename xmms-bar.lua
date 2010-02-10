mediabar = awful.wibox({position = 'bottom'})
---[[
med_info=widget({type="textbox"})
med_right_aligned={layout = awful.widget.layout.horizontal.rightleft}
mediabar.height=20
mediabar.widgets={
	med_info,
	layout = awful.widget.layout.horizontal.leftright,
	height = mediabar.height
}
--]]
mediabar.visible = false
