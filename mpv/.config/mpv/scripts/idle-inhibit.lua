mp.observe_property("pause", "bool", function(_, paused)
    mp.command("set", "stop-screensaver", paused and "no" or "always")
end)
