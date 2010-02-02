mod_bat_t= awful.tooltip({
	objects = { mod_bat },
	timer_function = function ()
		return awful.util.pread("acpi -V")
	end,
	timeout = 5
})
mod_bat_t.wibar = bar_widget
