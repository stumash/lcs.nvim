local M = {}

M.LCS_SETTINGS = {}
local DEFAULT_LCS_SETTINGS = {
  enabled = true,
  chars = {
    s = { enabled = false, value = [[space:•]] },
    tb = { enabled = true, value = [[tab:→\ ]] },
    e = { enabled = false, value = [[eol:↴]] },
    tr = { enabled = true, value = [[trail:⁃]] },
  },
}

-- use M.LCS_SETTINGS to configure `vim.o.lcs` and `vim.o.list`
local function setLcs()
  local lcs = ''

  local function addToLcs(s)
    if lcs == '' then
      lcs = s
    else
      lcs = lcs .. ',' .. s
    end
  end

  for _, setting in pairs(M.LCS_SETTINGS.chars) do
    if setting.enabled then
      addToLcs(setting.value)
    end
  end
  vim.o.lcs = lcs

  if M.LCS_SETTINGS.enabled then
    vim.o.list = true
  else
    vim.o.list = false
  end
end

local function mergeSettings(mergeInto, mergeFrom)
  if type(mergeInto) ~= "table" then return end
  if mergeFrom == nil then return end

  for k,v in pairs(mergeInto) do
    if type(v) == "table" then
      mergeSettings(v, mergeFrom[k])
    else
      if mergeFrom[k] ~= nil then
        mergeInto[k] = mergeFrom[k]
      end
    end
  end 
end

function M.setup(user_lcs_settings)
  M.LCS_SETTINGS = vim.deepcopy(DEFAULT_LCS_SETTINGS)
  mergeSettings(M.LCS_SETTINGS, user_lcs_settings)
  setLcs()
end

function bool_to_str(b)
  if b then
    return 'true'
  else
    return 'false'
  end
end

function M.toggleShow(listcharName)
  if listcharName == nil then
    M.LCS_SETTINGS.enabled = not M.LCS_SETTINGS.enabled
    local setting_str = bool_to_str(M.LCS_SETTINGS.enabled)
    print('show all listchars: ' .. setting_str)
  else
    M.LCS_SETTINGS.chars[listcharName].enabled = not M.LCS_SETTINGS.chars[listcharName].enabled
    local setting_str = bool_to_str(M.LCS_SETTINGS.chars[listcharName].enabled)
    print('show listchar \'' .. listcharName .. '\': ' .. setting_str)
  end
  setLcs()
end

return M
