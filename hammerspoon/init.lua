hs.window.animationDuration = 0

units = {
  left        = { x = 0.00, y = 0.00, w = 0.50, h = 1.00 },
  right       = { x = 0.50, y = 0.00, w = 0.50, h = 1.00 },
  top         = { x = 0.00, y = 0.00, w = 1.00, h = 0.50 },
  botm        = { x = 0.00, y = 0.50, w = 1.00, h = 0.50 },

  leftTop     = { x = 0.00, y = 0.00, w = 0.50, h = 0.50 },
  rightTop    = { x = 0.50, y = 0.00, w = 0.50, h = 0.50 },
  leftBotm    = { x = 0.00, y = 0.50, w = 0.50, h = 0.50 },
  rightBotm   = { x = 0.50, y = 0.50, w = 0.50, h = 0.50 },

  centerTop   = { x = 0.25, y = 0.00, w = 0.50, h = 0.50 },
  centerBotm  = { x = 0.25, y = 0.50, w = 0.50, h = 0.50 },
  centerLeft  = { x = 0.00, y = 0.25, w = 0.50, h = 0.50 },
  centerRight = { x = 0.50, y = 0.25, w = 0.50, h = 0.50 },

  maximum     = { x = 0.00, y = 0.00, w = 1.00, h = 1.00 },
  center      = { x = 0.25, y = 0.25, w = 0.50, h = 0.50 },

  wideLeft    = { x = 0.00, y = 0.00, w = 0.66, h = 1.00 },
  wideRight   = { x = 0.34, y = 0.00, w = 0.66, h = 1.00 },
  wideTop     = { x = 0.00, y = 0.00, w = 1.00, h = 0.66 },
  wideBotm    = { x = 0.00, y = 0.34, w = 1.00, h = 0.66 },

  minLeft     = { x = 0.00, y = 0.00, w = 0.34, h = 1.00 },
  minRight    = { x = 0.83, y = 0.00, w = 0.34, h = 1.00 },
  minTop      = { x = 0.00, y = 0.00, w = 1.00, h = 0.50 },
  minBotm     = { x = 0.00, y = 0.50, w = 1.00, h = 0.50 },

  popupCenter = { x = 0.10, y = 0.10, w = 0.80, h = 0.80 },
  wideCenter  = { x = 0.00, y = 0.10, w = 1.00, h = 0.80 },
}

mainHotKey = { 'option' }
hs.hotkey.bind(mainHotKey, 'h',     function() hs.window.focusedWindow():move(units.left,        nil, true) end)
hs.hotkey.bind(mainHotKey, 'l',     function() hs.window.focusedWindow():move(units.right,       nil, true) end)
hs.hotkey.bind(mainHotKey, 'k',     function() hs.window.focusedWindow():move(units.top,         nil, true) end)
hs.hotkey.bind(mainHotKey, 'j',     function() hs.window.focusedWindow():move(units.botm,        nil, true) end)
hs.hotkey.bind(mainHotKey, '1',     function() hs.window.focusedWindow():move(units.leftTop,     nil, true) end)
hs.hotkey.bind(mainHotKey, '2',     function() hs.window.focusedWindow():move(units.leftBotm,    nil, true) end)
hs.hotkey.bind(mainHotKey, '3',     function() hs.window.focusedWindow():move(units.rightTop,    nil, true) end)
hs.hotkey.bind(mainHotKey, '4',     function() hs.window.focusedWindow():move(units.rightBotm,   nil, true) end)
hs.hotkey.bind(mainHotKey, 'up',    function() hs.window.focusedWindow():move(units.centerTop,   nil, true) end)
hs.hotkey.bind(mainHotKey, 'down',  function() hs.window.focusedWindow():move(units.centerBotm,  nil, true) end)
hs.hotkey.bind(mainHotKey, 'left',  function() hs.window.focusedWindow():move(units.centerLeft,  nil, true) end)
hs.hotkey.bind(mainHotKey, 'right', function() hs.window.focusedWindow():move(units.centerRight, nil, true) end)
hs.hotkey.bind(mainHotKey, 'm',     function() hs.window.focusedWindow():move(units.maximum,     nil, true) end)
hs.hotkey.bind(mainHotKey, 'c',     function() hs.window.focusedWindow():move(units.center,      nil, true) end)

subHotKey = { 'option', 'command' }
hs.hotkey.bind(subHotKey, 'h',     function() hs.window.focusedWindow():move(units.wideLeft,     nil, true) end)
hs.hotkey.bind(subHotKey, 'l',     function() hs.window.focusedWindow():move(units.wideRight,    nil, true) end)
hs.hotkey.bind(subHotKey, 'k',     function() hs.window.focusedWindow():move(units.wideTop,     nil, true) end)
hs.hotkey.bind(subHotKey, 'j',     function() hs.window.focusedWindow():move(units.wideBotm,    nil, true) end)
hs.hotkey.bind(subHotKey, 'left',  function() hs.window.focusedWindow():move(units.minLeft,    nil, true) end)
hs.hotkey.bind(subHotKey, 'right', function() hs.window.focusedWindow():move(units.minRight,   nil, true) end)
hs.hotkey.bind(subHotKey, 'c',     function() hs.window.focusedWindow():move(units.popupCenter, nil, true) end)
hs.hotkey.bind(subHotKey, 'm',     function() hs.window.focusedWindow():move(units.wideCenter,  nil, true) end)

