local notify = vim.notify
notify = function(msg, ...)
  if msg:match("offset_encodings") then
    return
  end

  notify(msg, ...)
end

--
--
-- require("lspconfig").clangd.setup({
--   capabilities = cmp_nvim_lsp.default_capabilities(),
--   cmd = {
--     "clangd",
--     "--offset-encoding=utf-16",
--   },
-- })

function dump(o)
  if type(o) == "table" then
    local s = "{ "
    for k, v in pairs(o) do
      if type(k) ~= "number" then
        k = '"' .. k .. '"'
      end
      s = s .. "[" .. k .. "] = " .. dump(v) .. ","
    end
    return s .. "} "
  else
    return tostring(o)
  end
end

local cmp_nvim_lsp = require("cmp_nvim_lsp")
dump(cmp_nvim_lsp.default_capabilities())
