hs.loadSpoon("ShiftIt")
spoon.ShiftIt:bindHotkeys({
  nextScreen = {{"ctrl", "cmd", "alt"}, "f"},
  previousScreen = {{"ctrl", "cmd", "alt"}, "d"},
  upleft = {{"ctrl", "alt", "shift"}, "left"},
  upright = {{"ctrl", "alt", "shift"}, "up"},
  botleft = {{"ctrl", "alt", "shift"}, "down"},
  botright = {{"ctrl", "alt", "shift"}, "right"},
})
spoon.ShiftIt:setWindowCyclingSizes({ 50, 33, 67 }, { 50 })
spoon.ShiftIt:setLocationSize('left', { 60 }, { 100 })
spoon.ShiftIt:setLocationSize('right', { 40 }, { 100 })
spoon.ShiftIt:setLocationSize('up', { 100 }, { 70 })
spoon.ShiftIt:setLocationSize('down', { 100 }, { 30 })
spoon.ShiftIt:setLocationSize('upleft', { 60 }, { 60 })
spoon.ShiftIt:setLocationSize('upright', { 40 }, { 50 })
spoon.ShiftIt:setLocationSize('botleft', { 60 }, { 40 })
spoon.ShiftIt:setLocationSize('botright', { 40 }, { 50 })

-- Center: 60% width, 100% height
spoon.ShiftIt:setCenterSize(60, 100)

hs.loadSpoon("FocusFollowsMouse")
spoon.FocusFollowsMouse:configure({
  delay = 0.05,                  -- 50 ms debounce instead of default 100 ms
  excludedApps = {
    -- "Notification Center",       -- by app name
    -- "org.keepassxc.keepassxc",   -- or by bundle ID
  },
})
spoon.FocusFollowsMouse:start()
spoon.FocusFollowsMouse:bindHotkeys({
  toggle = {{"shift","ctrl","cmd"}, "F"},  -- toggle on/off
})

