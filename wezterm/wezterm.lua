local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- GPU設定
config.front_end = "WebGpu"

-- カラースキームの設定
config.color_scheme = 'Tokyo Night'

-- 背景透過設定
config.window_background_opacity = 0.85

-- config.window_frame = {
--   inactive_titlebar_bg = '#353535',
--   active_titlebar_bg = '#2b2042',
--   inactive_titlebar_fg = '#cccccc',
--   active_titlebar_fg = '#ffffff',
--   inactive_titlebar_border_bottom = '#2b2042',
--   active_titlebar_border_bottom = '#2b2042',
--   button_fg = '#cccccc',
--   button_bg = '#2b2042',
--   button_hover_fg = '#ffffff',
--   button_hover_bg = '#3b3052',
-- }

-- fontの設定
-- config.font = wezterm.font("JetBrains Mono", {weight="Bold", stretch="Normal", style="Normal"}) -- <built-in>, BuiltIn
config.font = wezterm.font("UDEV Gothic 35NFLG", {weight="Regular", stretch="Normal", style="Normal"})
-- config.font = wezterm.font("UDEV Gothic 35NFLG", {weight="Bold", stretch="Normal", style="Normal"})
config.font_size = 13

-- window設定
config.initial_rows = 50
config.initial_cols = 200

-- フォントサイズ変更時にウィンドウサイズも変更されないようにする。
config.adjust_window_size_when_changing_font_size = false

-- ショートカットキー設定
local act = wezterm.action

config.macos_forward_to_ime_modifier_mask = "SHIFT|CTRL"

config.keys = {
  -- Shift+Alt+pで新しいペインを作成(画面を分割)
  {
    key = 'p',
    mods = 'SHIFT|ALT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  -- Ctrl+左矢印でカーソルを前の単語に移動
  {
    key = "LeftArrow",
    mods = "CTRL",
    action = act.SendKey {
      key = "b",
      mods = "META",
    },
  },
  -- Ctrl+右矢印でカーソルを次の単語に移動
  {
    key = "RightArrow",
    mods = "CTRL",
    action = act.SendKey {
      key = "f",
      mods = "META",
    },
  },
  -- Ctrl+Backspaceで前の単語を削除
  {
    key = "Backspace",
    mods = "CTRL",
    action = act.SendKey {
      key = "w",
      mods = "CTRL",
    },
  },
}

-- タブの設定

return config

