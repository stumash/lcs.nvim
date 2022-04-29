local M = {}

local lcs_settings = {}
local default_lcs_settings = {
  enabled = true,
  chars = {
    eol = { enabled = true, value = [[eol:↴]] },
    tab = { enabled = true, value = [[tab:→\ ]] },
    spc = { enabled = false, value = [[space:·]] },
    trail = { enabled = true, value = [[space:-]] },
  },
}

local function setLcs()
  local lcs = ''

  local function addToLcs(s)
    if lcs == '' then
      lcs = s
    else
      lcs = lcs .. ',' .. s
    end
  end

  for _, setting in pairs(lcs_settings.chars) do
    if setting.enabled then
      addToLcs(setting.value)
    end
  end
  vim.o.lcs = lcs

  if lcs_settings.enabled then
    vim.o.list = true
  else
    vim.o.list = false
  end
end

function M.toggleShowSpace()
  lcs_settings.chars.spc.enabled = not lcs_settings.chars.spc.enabled
  setLcs()
end
function M.toggleShowTab()
  lcs_settings.chars.tab.enabled = not lcs_settings.chars.tab.enabled
  setLcs()
end
function M.toggleShowEol()
  lcs_settings.chars.eol.enabled = not lcs_settings.chars.eol.enabled
  setLcs()
end
function M.toggleShowTrail()
  lcs_settings.chars.trail.enabled = not lcs_settings.chars.trail.enabled
  setLcs()
end
function M.toggleListchars()
  lcs_settings.enabled = not lcs_settings.enabled
  setLcs()
end


function M.setup(user_lcs_settings)
  -- copy defaults
  lcs_settings.enabled = default_lcs_settings.enabled
  lcs_settings.chars = vim.deepcopy(default_lcs_settings.chars)

  if user_lcs_settings ~= nil then
    -- apply user settings
    if user_lcs_settings.enabled ~= nil then
      lcs_settings.enabled = user_lcs_settings.enabled
    end
    if user_lcs_settings.chars ~= nil then
      lcs_settings.chars = vim.deepcopy(user_lcs_settings.chars)
    end
  end

  setLcs()
end

-- returns a deep copy of the current config for user inspection
function M.getConfig()
  return vim.deepcopy(lcs_settings)
end

return M
