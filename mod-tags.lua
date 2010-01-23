mod_tags = {}
mod_tags_widgets={}
mod_tags_widgets.buttons = awful.util.table.join(
	awful.button({ }, 1, awful.tag.viewonly),
	awful.button({ modkey }, 1, awful.client.movetotag),
	awful.button({ }, 3, awful.tag.viewtoggle),         
	awful.button({ modkey }, 3, awful.client.toggletag)
)

mod_tags_timer = timer({ timeout = 2 })

for s = 1, screen.count() do
	local geometry={}
	geometry.x=screen[s].geometry.width/2-100
	geometry.y=screen[s].geometry.height/2-10
	geometry.width=200
	geometry.height=20
	mod_tags[s]=wibox({})
	mod_tags_widgets[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mod_tags_widgets.buttons)
	mod_tags[s]:geometry(geometry)
	mod_tags[s].screen=s
	mod_tags[s].ontop=true
	mod_tags[s].visible=false
	mod_tags[s].opacity=0.85
	mod_tags[s].widgets = { 
		mod_tags_widgets[s],
		layout    = awful.widget.layout.horizontal.center
	}
	screen[s]:add_signal("tag::history::update", function ()
		mod_tags[mouse.screen].visible=true
		if mod_tags_timer.started then mod_tags_timer:stop() end
		mod_tags_timer:add_signal("timeout", function() mod_tags[mouse.screen].visible=false end)
		mod_tags_timer:start()
	end)
end
