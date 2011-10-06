mod_bat_t= awful.tooltip({
	objects = { batwidget },
	timer_function = function ()
		return awful.util.pread("acpi -V")
	end,
	timeout = 5
})
--mod_bat_t.wibar = bar_widget
--[[mod_cpu_t=awful.tooltip({
	objects = { mod_cpu1 },
	timer_function = function ()
		return awful.util.pread("cpufreq-info")
	end,
	timeout = 7
})
mod_cpu_t.wibar= bar_widget
--]]
