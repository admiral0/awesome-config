-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = true,
                     keys = clientkeys,
                     buttons = clientbuttons } },
    { rule = { class = "MPlayer" },
      properties = { floating = true } },
    { rule = { class = "pinentry" },
      properties = { floating = true } },
    { rule = { class = "gimp" },
      properties = { floating = true } },
    { rule = { class = "Gvolwheel" },
      properties = { floating = true } },
    { rule = { instance = "Popup" , class = "Aurora" },
      callback = function(c)
	      ---[[
	      awful.client.dockable.set(c,false);
	      outtext=""
	      if(awful.client.dockable.get(c)) then
		      outtext="true"
	      else
		      outtext="false"
	      end
	      naughty.notify({text=outtext,title="OMG2!"});
	      awful.client.floating.set(c, true);
	      c.ontop=true
	      awful.placement.no_offsreen(c);
	      --]]
      end },


    -- Set Firefox to always map on tags number 2 of screen 1.
    { rule = { class = "Aurora" },
      properties = { size_hints_honor = false } },
    { rule = { class = "Sakura" },
      properties = { size_hints_honor = false } },

}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.add_signal("manage", function (c, startup)
    -- Enable sloppy focus
    c:add_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end
end)

client.add_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.add_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}
