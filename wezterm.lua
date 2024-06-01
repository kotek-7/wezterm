local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action
local config = {}
local keybinds = require("keybinds")

if wezterm.config_builder then
  config = wezterm.config_builder()
end

wezterm.on('gui-startup', function(_)
  local _, _, window = mux.spawn_window {}
  local tab, _, _ = window:spawn_tab {
    domain = {
      DomainName = 'WSL:Ubuntu'
    },
  }
end)

config.launch_menu = {
  {
    label = 'PowerShell',
    args = { 'pwsh' },
    cwd = "d:/users/kotek/kotekdirs",
    domain = {
      DomainName = 'local'
    }
  },
  {
    label = 'WSL',
    domain = {
      DomainName = 'WSL:Ubuntu'
    }
  },
}

config.default_prog = { 'pwsh' }

config.keys = keybinds.keys
config.key_tables = keybinds.key_tables
config.disable_default_key_bindings = true

config.window_decorations = "RESIZE"
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0
}
config.color_scheme = 'OneDark (base16)'
config.font = wezterm.font_with_fallback {
  'CaskaydiaCove Nerd Font',
  'Source Han Code JP',
}

return config
