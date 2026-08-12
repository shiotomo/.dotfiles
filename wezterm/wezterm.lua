local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- GPU設定
config.front_end = "WebGpu"

-- カラースキームの設定
config.color_scheme = "Ayu Mirage"

-- fontの設定
config.font = wezterm.font("UDEV Gothic 35NFLG", { weight = "Regular", stretch = "Normal", style = "Normal" })
config.font_size = 13

-- window設定
config.initial_rows = 50
config.initial_cols = 200

-- フォントサイズ変更時にウィンドウサイズも変更されないようにする。
config.adjust_window_size_when_changing_font_size = false

-- サイドバーのPane IDを保持する変数
local sidebar_pane_id = nil

-- カスタムイベント: 左側サイドバーのスマートトグル
wezterm.on("toggle-sidebar", function(window, pane)
	local tab = pane:tab()
	local panes = tab:panes()

	-- サイドバーが存在するかどうかをPane IDでチェック
	local sidebar_exists = false
	if sidebar_pane_id then
		for _, p in ipairs(panes) do
			if p:pane_id() == sidebar_pane_id then
				sidebar_exists = true
				break
			end
		end
	end

	-- サイドバーが存在しない（まだ作成していない、または手動で閉じられた）場合
	if not sidebar_exists then
		local sidebar = pane:split({
			direction = "Left",
			size = 0.25,
		})
		sidebar_pane_id = sidebar:pane_id()
		-- 作成後、右側のメインPaneにフォーカスを戻す
		pane:activate()
	else
		-- すでにサイドバーが存在する場合
		local main_pane = nil
		for _, p in ipairs(panes) do
			if p:pane_id() ~= sidebar_pane_id then
				main_pane = p
				break
			end
		end

		if main_pane then
			-- フォーカスがサイドバーにある場合は、まずメインPaneにアクティブを移動する
			if pane:pane_id() == sidebar_pane_id then
				main_pane:activate()
			end
			-- メインPaneを基準にZoomを切り替えてサイドバーをトグル表示
			window:perform_action(wezterm.action.TogglePaneZoomState, main_pane)
		else
			window:perform_action(wezterm.action.TogglePaneZoomState, pane)
		end
	end
end)

-- ショートカットキー設定
local act = wezterm.action

config.macos_forward_to_ime_modifier_mask = "SHIFT|CTRL"

config.keys = {
	-- Option+b で左側サイドバーの表示・非表示トグル
	{
		key = "s",
		mods = "OPT",
		action = act.EmitEvent("toggle-sidebar"),
	},
	-- Shift+Alt+pで新しいペインを作成(画面を分割)
	{
		key = "p",
		mods = "SHIFT|ALT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	-- Ctrl+左矢印でカーソルを前の単語に移動
	{
		key = "LeftArrow",
		mods = "CTRL",
		action = act.SendKey({
			key = "b",
			mods = "META",
		}),
	},
	-- Ctrl+右矢印でカーソルを次の単語に移動
	{
		key = "RightArrow",
		mods = "CTRL",
		action = act.SendKey({
			key = "f",
			mods = "META",
		}),
	},
	-- Ctrl+Backspaceで前の単語を削除
	{
		key = "Backspace",
		mods = "CTRL",
		action = act.SendKey({
			key = "w",
			mods = "CTRL",
		}),
	},
  ---------------------------------------------------------------
  -- キーボードによるPane（画面）移動ショートカット(Option + 矢印キー)
  ---------------------------------------------------------------
	{
		key = "LeftArrow",
		mods = "OPT",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "RightArrow",
		mods = "OPT",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		key = "UpArrow",
		mods = "OPT",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "DownArrow",
		mods = "OPT",
		action = act.ActivatePaneDirection("Down"),
	},
}

return config
