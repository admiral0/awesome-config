---------------------------------------------------
-- Licensed under the GNU General Public License v2
--  * (c) 2010, Radu A. <admiral0@tuxfamily.org>
---------------------------------------------------

-- {{{ Grab environment
local io = { popen = io.popen }
local setmetatable = setmetatable
-- }}}


-- Netcfg: Active profiles
module("vicious.widgets.netcfg")


-- {{{ Packages widget type
local function worker(format, warg)

    -- Initialize counters
    local profiles = ""
    local command="netcfgCli active "

    local f = io.popen(pkg.cmd)

    for line in f:lines() do
        profiles = profiles .. " "..line
    end
    f:close()

    return {profiles}
end
-- }}}

setmetatable(_M, { __call = function(_, ...) return worker(...) end })
