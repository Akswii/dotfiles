-- local nvim_lsp = require('lspconfig')

local lspconfig = require"lspconfig"

local eslint = {
  lintcommand = "eslint_d -f unix --stdin --stdin-filename ${input}",
  lintstdin = true,
  lintformats = {"%f:%l:%c: %m"},
  lintignoreexitcode = true,
  formatcommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${input}",
  formatstdin = true
}

local function eslint_config_exists()
  local eslintrc = vim.fn.glob(".eslintrc*", 0, 1)

  if not vim.tbl_isempty(eslintrc) then
    return true
  end

  if vim.fn.filereadable("package.json") then
    if vim.fn.json_decode(vim.fn.readfile("package.json"))["eslintConfig"] then
      return true
    end
  end

  return false
end


lspconfig.tsserver.setup {
  on_attach = function(client)
    if client.config.flags then
      client.config.flags.allow_incremental_sync = true
    end
    client.resolved_capabilities.document_formatting = false
    set_lsp_config(client)
  end
}

lspconfig.efm.setup {
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = true
    client.resolved_capabilities.goto_definition = false
    set_lsp_config(client)
  end,
  root_dir = function()
    -- if not eslint_config_exists() then
    --   return nil
    -- end
    return vim.fn.getcwd()
  end,
  settings = {
    languages = {
      javascript = {eslint},
      javascriptreact = {eslint},
      ["javascript.jsx"] = {eslint},
      typescript = {eslint},
      ["typescript.tsx"] = {eslint},
      typescriptreact = {eslint}
    }
  },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescript.tsx",
    "typescriptreact"
  },
}


-- local on_attach = function(client, bufnr)
-- 	-- formatting
--   if client.name == 'tsserver' then
--     client.resolved_capabilities.document_formatting = false
--   end

--   if client.resolved_capabilities.document_formatting then
--     vim.api.nvim_command [[augroup format]]
--     vim.api.nvim_command [[autocmd! * <buffer>]]
--     vim.api.nvim_command [[autocmd bufwritepre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
--     vim.api.nvim_command [[augroup end]]
--   end
-- end

-- nvim_lsp.tsserver.setup {
--   on_attach = on_attach,
--   filetypes = { "typescript", "typescript.tsx" },
--   capabilities = capabilities
-- }

-- nvim_lsp.diagnosticls.setup {
--   on_attach = on_attach,
--   filetypes = { 'javascript', 'javascriptreact', 'json', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'markdown', 'pandoc' },
--   init_options = {
--     linters = {
--       eslint = {
--         command = 'eslint_d',
--         rootpatterns = { '.git' },
--         debounce = 100,
--         args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
--         sourcename = 'eslint_d',
--         parsejson = {
--           errorsroot = '[0].messages',
--           line = 'line',
--           column = 'column',
--           endline = 'endline',
--           endcolumn = 'endcolumn',
--           message = '[eslint] ${message} [${ruleid}]',
--           security = 'severity'
--         },
--         securities = {
--           [2] = 'error',
--           [1] = 'warning'
--         }
--       },
--     },
--     filetypes = {
--       javascript = 'eslint',
--       javascriptreact = 'eslint',
--       typescript = 'eslint',
--       typescriptreact = 'eslint',
--     },
--     formatters = {
--       eslint_d = {
--         command = 'eslint_d',
--         rootpatterns = { '.git' },
--         args = { '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
--         rootpatterns = { '.git' },
--       },
--       prettier = {
--         command = 'prettier_d_slim',
--         rootpatterns = { '.git' },
--         -- requiredfiles: { 'prettier.config.js' },
--         args = { '--stdin', '--stdin-filepath', '%filename' }
--       }
--     },
--     formatfiletypes = {
--       css = 'prettier',
--       javascript = 'prettier',
--       javascriptreact = 'prettier',
--       json = 'prettier',
--       scss = 'prettier',
--       less = 'prettier',
--       typescript = 'prettier',
--       typescriptreact = 'prettier',
--       json = 'prettier',
--       markdown = 'prettier',
--     }
--   }
-- }

