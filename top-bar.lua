-- Clock
clock_widget   = awful.widget.textclock({ align = "right" }, "<b>%H:%M</b>")

-- Systray
systray_widgets = widget({ type = "systray" })

-- PromptBox
prompt_widgets  = {}

-- TeskList and events
tasklist_widgets = {}
tasklist_widgets.buttons = awful.util.table.join(
                     	awful.button({ }, 1, function (c) 
				if not c:isvisible() then
			     		awful.tag.viewonly(c:tags()[1])
				end
				client.focus = c
				c:raise()
			end),
			awful.button({ }, 3, function ()
				if instance then
					instance:hide()
					instance = nil
				else
					instance = awful.menu.clients({ width=250 })
				end
			end))

-- Bar
bar_widgets = {}

-- Additional widgets in mod-widgets.lua
mod_widgets = { layout = awful.widget.layout.horizontal.leftright }
require("mod-widgets")

-- Create a bar for every screen
for s = 1, screen.count() do
	-- Create Promptbox
	prompt_widgets[s]     = awful.widget.prompt()
	-- Create Tasklist
	tasklist_widgets[s]   = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, tasklist_widgets.buttons)
	-- Create Wibar
	bar_widgets[s]        = awful.wibox({ position = "top", screen = s, opacity = 0.7 })
	-- Container to align to right
	right_aligned = { layout = awful.widget.layout.horizontal.rightleft }
	-- Add widgets
	-- Right
	if ( s == 1 ) then table.insert( right_aligned, systray_widget ) end -- Systray only on screen 1
	table.insert( right_aligned, clock_widget )
	bar_widgets[s].widgets = {
		mod_widgets,
		prompt_widgets[s],
		right_aligned,
		tasklist_widgets[s],
		layout = awful.widget.layout.horizontal.leftright,
		height = bar_widgets[s].height
	}
end
