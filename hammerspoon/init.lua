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

  maximum     = { x = 0.00, y = 0.00, w = 1.00, h = 1.00 },
  center      = { x = 0.25, y = 0.25, w = 0.50, h = 0.50 }
}

mash = { 'option' }
hs.hotkey.bind(mash, 'H',    function() hs.window.focusedWindow():move(units.left,       nil, true) end)
hs.hotkey.bind(mash, 'L',    function() hs.window.focusedWindow():move(units.right,      nil, true) end)
hs.hotkey.bind(mash, 'K',    function() hs.window.focusedWindow():move(units.top,        nil, true) end)
hs.hotkey.bind(mash, 'J',    function() hs.window.focusedWindow():move(units.botm,       nil, true) end)
hs.hotkey.bind(mash, '1',    function() hs.window.focusedWindow():move(units.leftTop,    nil, true) end)
hs.hotkey.bind(mash, '2',    function() hs.window.focusedWindow():move(units.rightTop,   nil, true) end)
hs.hotkey.bind(mash, '3',    function() hs.window.focusedWindow():move(units.leftBotm,   nil, true) end)
hs.hotkey.bind(mash, '4',    function() hs.window.focusedWindow():move(units.rightBotm,  nil, true) end)
hs.hotkey.bind(mash, 'up',   function() hs.window.focusedWindow():move(units.centerTop,  nil, true) end)
hs.hotkey.bind(mash, 'down', function() hs.window.focusedWindow():move(units.centerBotm, nil, true) end)
hs.hotkey.bind(mash, 'm',    function() hs.window.focusedWindow():move(units.maximum,    nil, true) end)
hs.hotkey.bind(mash, 'c',    function() hs.window.focusedWindow():move(units.center,     nil, true) end)

