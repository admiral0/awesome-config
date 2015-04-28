local awful = require("awful")

local function exec(command)
    awful.util.spawn(command,false)
end

local exec_iface = {}

function exec_iface.early()

    exec("xrandr --output DP1 --left-of HDMI3")
    exec("xrandr --output HDMI3 --primary")
end

function exec_iface.late()
    exec("setxkbmap it")
    exec("redshift-gtk -l 45.6242491:9.0359607 &")
    exec("start-pulseaudio-x11")
    exec("nm-applet &")
end

return exec_iface
