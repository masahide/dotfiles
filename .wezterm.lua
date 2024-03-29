local wezterm = require 'wezterm';

function isModuleAvailable(name)
  if package.loaded[name] then
    return true
  else
    for _, searcher in ipairs(package.searchers or package.loaders) do
      local loader = searcher(name)
      if type(loader) == 'function' then
        package.preload[name] = loader
        return true
      end
    end
    return false
  end
end

local unix_domains = {}
if isModuleAvailable('weztermlocal') then
    local weztermlocal = require 'weztermlocal'
    unix_domains = weztermlocal.unix_domains
end

if wezterm.target_triple:find("windows") then
    default_prog = {'wsl.exe', '~', '-d', 'Ubuntu-20.04'}
end

if wezterm.target_triple:find("darwin") then
    -- default_prog = {'wsl.exe', '~', '-d', 'Ubuntu-20.04'}
end

wezterm.on('format-window-title', function(tab, pane, tabs, panes, config)
  local zoomed = ''
  if tab.active_pane.is_zoomed then
    zoomed = '[Z] '
  end

  local index = ''
  if #tabs > 1 then
    index = string.format('(%s) [%d/%d] ',pane.domain_name, tab.tab_index + 1, #tabs)
  else
    index = string.format('(%s) ',pane.domain_name )
  end

  return zoomed .. index .. tab.active_pane.title
end)

return {
    default_prog = default_prog,
    unix_domains = unix_domains,
    visual_bell = {
        fade_in_function = 'EaseIn',
        fade_in_duration_ms = 150,
        fade_out_function = 'EaseOut',
        fade_out_duration_ms = 150,
    },
    colors = {
        visual_bell = '#202020',
    },
}
