local wezterm = require 'wezterm'

-- wezterm.gui is not available to the mux server, so take care to
-- do something reasonable when this config is evaluated by the mux
function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

function query_appearance_gnome()
  local success, stdout = wezterm.run_child_process {
    'gsettings',
    'get',
    'org.gnome.desktop.interface',
    'gtk-theme',
  }
  -- lowercase and remove whitespace
  stdout = stdout:lower():gsub('%s+', '')
  local mapping = {
    highcontrast = 'LightHighContrast',
    highcontrastinverse = 'DarkHighContrast',
    adwaita = 'Light',
    ['adwaita-dark'] = 'Dark',
  }
  local appearance = mapping[stdout]
  if appearance then
    return appearance
  end
  if stdout:find 'dark' then
    return 'Dark'
  end
  return 'Light'
end

function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'Builtin Solarized Dark'
  else
    return 'Builtin Solarized Light'
  end
end

-- TODO upgrade so the event is fired and we don't need this
wezterm.on('update-right-status', function(window, pane)
             local overrides = window:get_config_overrides() or {}
             local appearance = query_appearance_gnome()
             local scheme = scheme_for_appearance(appearance)
             if overrides.color_scheme ~= scheme then
               overrides.color_scheme = scheme
               window:set_config_overrides(overrides)
             end
end)


return {
  color_scheme = scheme_for_appearance(query_appearance_gnome()),
  font = wezterm.font "SourceCode Pro",
  font_size = 10.5,
  -- font_size = 18,
  enable_tab_bar = false,
  -- freetype_load_flags = 'NO_HINTING',
  front_end = 'WebGpu'
}
