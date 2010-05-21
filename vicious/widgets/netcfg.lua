---------------------------------------------------
-- Licensed under the GNU General Public License v2
--  * (c) 2010, Radu A. <admiral0@tuxfamily.org>
---------------------------------------------------

-- {{{ Grab environment
local io = { popen = io.popen }
local setmetatable = setmetatable
local table = { insert = table.insert }
local chop = string.sub
-- }}}


-- Netcfg: Active profiles
module("vicious.widgets.netcfg")


-- {{{ Packages widget type
local function worker(format, warg)

    -- Initialize counters
    local profiles = ""
    local tprofiles = {}
    local f = io.popen("ls /var/run/network/profiles")

    for line in f:lines() do
        if(#line>1) then
          table.insert(tprofiles,line)
          profiles = profiles .. warg ..line
        end
    end
    f:close()
    profiles=chop(profiles,#warg+1)
    return {profiles,tprofiles}
end
-- }}}

setmetatable(_M, { __call = function(_, ...) return worker(...) end })
