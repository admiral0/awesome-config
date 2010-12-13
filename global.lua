-- Applications
app_terminal="sakura"
app_editor="minerva"

-- Commands
cmd_shutdown="qdbus --system org.freedesktop.ConsoleKit /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager.Stop"
cmd_restart="qdbus --system org.freedesktop.ConsoleKit /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager.Restart"
-- Modifier key to be captured by WM
modkey= "Mod4" -- Corresponds to windows key on moseyet pc's

pulsevolume=function(sink)
    if sink == nil then return 0 end
    -- Get sink data
    local f = io.popen("pacmd dump | grep '\\(set-sink-volume " .. sink.."\\)\\|\\(set-sink-mute "..sink.."\\)'")
    local data = f:read("*all")
    f:close()
    -- If mute return 0 (not "Mute") so we don't break progressbars
    if string.match(data," (yes)\n$") then
        return 0
    end
                
    local vol = tonumber(string.match(data, "(0x[%x]+)"))
    if vol == nil then vol = 0 end            
    return  vol/0x10000*100 
end
