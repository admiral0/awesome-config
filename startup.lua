local lfs = require("lfs") 
local awful = require("awful")
-- {{{ Run programm once
local function processwalker()
   local function yieldprocess()
      for dir in lfs.dir("/proc") do
        -- All directories in /proc containing a number, represent a process
        if tonumber(dir) ~= nil then
          local f, err = io.open("/proc/"..dir.."/cmdline")
          if f then
            local cmdline = f:read("*all")
            f:close()
            if cmdline ~= "" then
              coroutine.yield(cmdline)
            end
          end
        end
      end
    end
    return coroutine.wrap(yieldprocess)
end

local function run_once(process, cmd)
   assert(type(process) == "string")
   local regex_killer = {
      ["+"]  = "%+", ["-"] = "%-",
      ["*"]  = "%*", ["?"]  = "%?" }

   for p in processwalker() do
      if p:find(process:gsub("[-+?*]", regex_killer)) then
     return
      end
   end
   return awful.util.spawn(cmd or process)
end
-- }}}

run_once("setxkbmap it")
--run_once("xrandr", "xrandr --output DP1 --left-of HDMI3 --output HDMI3 --primary")
run_once("start-pulseaudio-x11")
run_once("nm-applet", "nm-applet &")
run_once("redshift-gtk", "redshift-gtk -l 45.6242491:9.0359607 &")
