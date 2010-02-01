-- Clock
clock_widget   = awful.widget.textclock({ align = "right" }, "<b>%H:%M</b>")

-- Systray
systray_widget = widget({ type = "systray" })

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
mod_widgets = {}

mod_cpu1 = awful.widget.progressbar()
mod_cpu1:set_width(7)
mod_cpu1:set_height(18)
mod_cpu1:set_vertical(true)
mod_cpu1:set_background_color(beautiful.bg_normal)
mod_cpu1:set_border_color(beautiful.border_marked)
mod_cpu1:set_color(beautiful.fg_normal)
mod_cpu1:set_gradient_colors({ beautiful.fg_normal, beautiful.fg_focus, beautiful.fg_urgent })
vicious.register(mod_cpu1, vicious.widgets.cpu,
                function (widget, args)
                        if   tonumber(args[2]) == nil then return 100 end
                        return args[2]
                end
        , 1.3)
table.insert(mod_widgets, mod_cpu1)
mod_cpu2 = awful.widget.progressbar()
mod_cpu2:set_width(7)
mod_cpu2:set_height(18)
mod_cpu2:set_vertical(true)
mod_cpu2:set_background_color(beautiful.bg_normal)
mod_cpu2:set_border_color(beautiful.border_marked)
mod_cpu2:set_color(beautiful.fg_normal)
mod_cpu2:set_gradient_colors({ beautiful.fg_normal, beautiful.fg_focus, beautiful.fg_urgent })
vicious.register(mod_cpu2, vicious.widgets.cpu,
                function (widget, args)
                        if   tonumber(args[3]) == nil then return 100 end
                        return args[3]
                end
        , 1.1)
awful.widget.layout.margins[mod_cpu2] = { right = 3 }
table.insert(mod_widgets, mod_cpu2)

mod_mem = awful.widget.progressbar()
mod_mem:set_width(8)
mod_mem:set_height(18)
mod_mem:set_vertical(true)
mod_mem:set_background_color(beautiful.bg_normal)
mod_mem:set_border_color(beautiful.border_marked)
mod_mem:set_color(beautiful.fg_normal)
mod_mem:set_gradient_colors({ beautiful.fg_normal, beautiful.fg_focus, beautiful.fg_urgent })
vicious.register(mod_mem, vicious.widgets.mem,
                function (widget, args)
                        if   tonumber(args[1]) == nil then return 100 end
                        return args[1]
                end
        , 60, "BAT0")
table.insert(mod_widgets, mod_mem)
awful.widget.layout.margins[mod_mem] = { right = 1 }

mod_bat = widget({type = "textbox"})
--mod_bat_t = awful.tooltip({
--	objects = { mod_bat },
--	timer_function = function ()
--		return awful.util.pread("acpi -V")
--	end,
--	timeout = 5

--[[mod_bat:set_width(8)
mod_bat:set_height(18)
mod_bat:set_vertical(true)
mod_bat:set_background_color(beautiful.bg_normal)
mod_bat:set_border_color(beautiful.border_marked)
mod_bat:set_color(beautiful.fg_normal)
mod_bat:set_gradient_colors({ beautiful.fg_normal, beautiful.fg_focus, beautiful.fg_urgent })
--]]
vicious.register(mod_bat, vicious.widgets.bat,
                function (widget, args)
			local res = "<b>BAT:</b> "
                        if   tonumber(args[2]) == nil then res = res .. " 100%  /" end
                        res =  res .. " " .. args[2] .. "% " .. args[3]
			return res
                end
        , 60, "BAT0")
table.insert(mod_widgets, mod_bat)

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
