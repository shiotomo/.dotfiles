hs.window.animationDuration = 0

local units = {
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

local mainHotKey = { 'option' }
hs.hotkey.bind(mainHotKey, 'h',     function() hs.window.focusedWindow():move(units.left,        nil, true) end)
hs.hotkey.bind(mainHotKey, 'l',     function() hs.window.focusedWindow():move(units.right,       nil, true) end)
hs.hotkey.bind(mainHotKey, 'k',     function() hs.window.focusedWindow():move(units.top,         nil, true) end)
hs.hotkey.bind(mainHotKey, 'j',     function() hs.window.focusedWindow():move(units.botm,        nil, true) end)
hs.hotkey.bind(mainHotKey, '1',     function() hs.window.focusedWindow():move(units.leftTop,     nil, true) end)
hs.hotkey.bind(mainHotKey, '2',     function() hs.window.focusedWindow():move(units.leftBotm,    nil, true) end)
hs.hotkey.bind(mainHotKey, '3',     function() hs.window.focusedWindow():move(units.rightTop,    nil, true) end)
hs.hotkey.bind(mainHotKey, '4',     function() hs.window.focusedWindow():move(units.rightBotm,   nil, true) end)
hs.hotkey.bind(mainHotKey, 'm',     function() hs.window.focusedWindow():move(units.maximum,     nil, true) end)
hs.hotkey.bind(mainHotKey, 'c',     function() hs.window.focusedWindow():move(units.popupCenter, nil, true) end)

local subHotKey = { 'option', 'ctrl' }
hs.hotkey.bind(subHotKey, 'up',    function() hs.window.focusedWindow():move(units.centerTop,   nil, true) end)
hs.hotkey.bind(subHotKey, 'down',  function() hs.window.focusedWindow():move(units.centerBotm,  nil, true) end)
hs.hotkey.bind(subHotKey, 'left',  function() hs.window.focusedWindow():move(units.centerLeft,  nil, true) end)
hs.hotkey.bind(subHotKey, 'right', function() hs.window.focusedWindow():move(units.centerRight, nil, true) end)
hs.hotkey.bind(subHotKey, 'h',     function() hs.window.focusedWindow():move(units.wideLeft,    nil, true) end)
hs.hotkey.bind(subHotKey, 'l',     function() hs.window.focusedWindow():move(units.wideRight,   nil, true) end)
hs.hotkey.bind(subHotKey, 'k',     function() hs.window.focusedWindow():move(units.wideTop,     nil, true) end)
hs.hotkey.bind(subHotKey, 'j',     function() hs.window.focusedWindow():move(units.wideBotm,    nil, true) end)
hs.hotkey.bind(subHotKey, 'c',     function() hs.window.focusedWindow():move(units.center,      nil, true) end)
hs.hotkey.bind(subHotKey, 'm',     function() hs.window.focusedWindow():move(units.wideCenter,  nil, true) end)

local moveHotKey = { 'option', 'command' }
hs.hotkey.bind(moveHotKey, 'up',    function() hs.window.focusedWindow():move(units.centerTop,   nil, true) end)
hs.hotkey.bind(moveHotKey, 'down',  function() hs.window.focusedWindow():move(units.centerBotm,  nil, true) end)
hs.hotkey.bind(moveHotKey, 'left',  function() hs.window.focusedWindow():move(units.centerLeft,  nil, true) end)
hs.hotkey.bind(moveHotKey, 'right', function() hs.window.focusedWindow():move(units.centerRight, nil, true) end)
hs.hotkey.bind(moveHotKey, 'h',     function() hs.window.focusedWindow():move(units.left,        nil, true) end)
hs.hotkey.bind(moveHotKey, 'l',     function() hs.window.focusedWindow():move(units.right,       nil, true) end)
hs.hotkey.bind(moveHotKey, 'k',     function() hs.window.focusedWindow():move(units.top,         nil, true) end)
hs.hotkey.bind(moveHotKey, 'j',     function() hs.window.focusedWindow():move(units.botm,        nil, true) end)
hs.hotkey.bind(moveHotKey, 'm',     function() hs.window.focusedWindow():move(units.maximum,     nil, true) end)
hs.hotkey.bind(moveHotKey, 'c',     function() hs.window.focusedWindow():move(units.popupCenter, nil, true) end)

-- hs.hotkey.bind({ "option", "shift" }, "t", function()
hs.hotkey.bind({ "command", "shift" }, "t", function()
  local appName = "WezTerm"
  local app = hs.application.get(appName)

  if app == nil or app:isHidden() then
    hs.application.launchOrFocus(appName)
  else
    app:hide()
  end
end)

local function toggleApp(appName, key)
  hs.hotkey.bind({"ctrl"}, key, function()
    local app = hs.application.get(appName)
    if app == nil then
      hs.application.launchOrFocus("/Applications/" .. appName .. ".app")
    elseif app:isFrontmost() then
      app:hide()
    else
      hs.application.launchOrFocus("/Applications/" .. appName .. ".app")
    end
  end)
end

toggleApp("WezTerm", "t")

-------------------------------------------------------------
-- JetBrains アプリのトグル関数
-------------------------------------------------------------
local function toggleAppByBundle(bundleIDs)
  -- bundleIDs = 優先順の bundle ID の配列
  local targetBundle = nil

  -- 1. インストールされていて起動済みのアプリを優先して選ぶ
  for _, id in ipairs(bundleIDs) do
    local app = hs.application.get(id)
    if app then
      targetBundle = id
      break
    end
  end

  -- 2. 起動していないならインストールされているbundleを探す
  if not targetBundle then
    for _, id in ipairs(bundleIDs) do
      -- 起動していなくてもインストールはされている可能性がある
      if hs.application.infoForBundleID(id) ~= nil then
        targetBundle = id
        break
      end
    end
  end

  -- 3. 最終的にターゲットが決まったら動作を実行
  if not targetBundle then
    hs.alert.show("Target IDE not found.")
    return
  end

  local runningApp = hs.application.get(targetBundle)

  if runningApp then
    if runningApp:isFrontmost() then
      runningApp:hide()
    else
      runningApp:activate(true)
    end
  else
    hs.application.launchOrFocusByBundleID(targetBundle)
  end
end

-------------------------------------------------------------
-- IntelliJ IDEA (Ultimate → CE の順で優先)
-------------------------------------------------------------
local intellijBundles = {
  "com.jetbrains.intellij",     -- Ultimate
  "com.jetbrains.intellij.ce",  -- Community
}

hs.hotkey.bind({ "ctrl" }, "i", function()
  toggleAppByBundle(intellijBundles)
end)

-------------------------------------------------------------
-- WebStorm
-------------------------------------------------------------
-- hs.hotkey.bind({ "ctrl" }, "w", function()
--   toggleAppByBundle({ "com.jetbrains.webstorm" })
-- end)
