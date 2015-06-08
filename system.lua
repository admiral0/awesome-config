
local awful = require("awful")
local blingbling = require("blingbling")
local vicious = require("vicious")
local wibox = require("wibox")

local widgetbar = awful.wibox({ position = "bottom", screen = 1 })

local l_left = wibox.layout.fixed.horizontal()
local l_right = wibox.layout.fixed.horizontal()


cpu_graph = blingbling.line_graph({ height = 20,
                                        width = 200,
                                        show_text = true,
                                        label = "Cpu: $percent %",
                                        rounded_size = 0.3,
                                        graph_background_color = "#00000033"
                                      })
--cpu_graph:set_height(18)
--cpu_graph:set_width(200)
--cpu_graph:set_show_text(true)
--cpu_graph:set_label("Load: $percent %")
--cpu_graph:set_rounded_size(0.3)
--cpu_graph:set_graph_background_color("#00000033")
vicious.register(cpu_graph, vicious.widgets.cpu,'$1',2)
l_left:add(cpu_graph)

ram_graph = blingbling.line_graph({ height = 20,
                                        width = 200,
                                        show_text = true,
                                        label = "RAM: $percent %",
                                        rounded_size = 0.3,
                                        graph_background_color = "#00000033"
                                      })
--ram_graph:set_height(18)
--ram_graph:set_width(200)
--ram_graph:set_show_text(true)
--ram_graph:set_label("Load: $percent %")
--ram_graph:set_rounded_size(0.3)
--ram_graph:set_graph_background_color("#00000033")
vicious.register(ram_graph, vicious.widgets.mem,'$1',13)
l_left:add(ram_graph)

io_graph = blingbling.line_graph({ height = 20,
                                        width = 200,
                                        show_text = true,
                                        label = "IO: $percent %",
                                        rounded_size = 0.3,
                                        graph_background_color = "#00000033"
                                      })
--io_graph:set_height(18)
--io_graph:set_width(200)
--io_graph:set_show_text(true)
--io_graph:set_label("Load: $percent %")
--io_graph:set_rounded_size(0.3)
--io_graph:set_graph_background_color("#00000033")
vicious.register(io_graph, vicious.widgets.dio, function (widget, args)
return args["{sdb2 total_kb}"] / 400
end,3)
l_left:add(io_graph)

-- Create a textclock widget
--local cur_day_month =" <span color=\"#FBB1F9\">%d</span> "
--local cur_month = " <span color=\"#ffff00\">%b</span> "
--local cur_day_week =" <span color=\"#CDEE69\">%a</span>, "
--local cur_hour = "<span font_weight=\"bold\">%H<span color=\"#b9214f\" font_weight=\"normal\">h</span>%M"..
--                 "<span color=\"#b9214f\" font_weight=\"normal\">m</span></span>" 
--mytextclock = awful.widget.textclock(  cur_day_week ..  cur_day_month .. cur_month .. cur_hour)
mytextclock = awful.widget.textclock( "%a, %d %b <b>%H:%M</b>" )
l_right:add(mytextclock)



local layout = wibox.layout.align.horizontal()
layout:set_right(l_right)
layout:set_left(l_left)
widgetbar:set_widget(layout)

return widgetbar
