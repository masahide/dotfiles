local wezterm = require 'wezterm';

if wezterm.target_triple:find("windows") then
    default_prog = {'wsl.exe', '~', '-d', 'Ubuntu-20.04'}
end

if wezterm.target_triple:find("darwin") then
    -- default_prog = {'wsl.exe', '~', '-d', 'Ubuntu-20.04'}
end

return {
      default_prog = default_prog,
}
