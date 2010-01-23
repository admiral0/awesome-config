-- Insert custom widgets here
-- Example
-- table.insert(mod_widgets, widget )


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

mod_bat = awful.widget.progressbar()
--mod_bat_t = awful.tooltip({
--	objects = { mod_bat },
--	timer_function = function ()
--		return awful.util.pread("acpi -V")
--	end,
--	timeout = 5

mod_bat:set_width(8)
mod_bat:set_height(18)
mod_bat:set_vertical(true)
mod_bat:set_background_color(beautiful.bg_normal)
mod_bat:set_border_color(beautiful.border_marked)
mod_bat:set_color(beautiful.fg_normal)
mod_bat:set_gradient_colors({ beautiful.fg_normal, beautiful.fg_focus, beautiful.fg_urgent })
vicious.register(mod_bat, vicious.widgets.bat,
                function (widget, args)
                        if   tonumber(args[2]) == nil then return 100 end
                        return args[2]
                end
        , 60, "BAT0")
table.insert(mod_widgets, mod_bat)
