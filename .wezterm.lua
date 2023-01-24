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

return {
    default_prog = default_prog,
    unix_domains = unix_domains,
}
