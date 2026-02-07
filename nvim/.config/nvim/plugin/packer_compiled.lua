-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/gigabear/.cache/nvim/packer_hererocks/2.1.1761727121/share/lua/5.1/?.lua;/home/gigabear/.cache/nvim/packer_hererocks/2.1.1761727121/share/lua/5.1/?/init.lua;/home/gigabear/.cache/nvim/packer_hererocks/2.1.1761727121/lib/luarocks/rocks-5.1/?.lua;/home/gigabear/.cache/nvim/packer_hererocks/2.1.1761727121/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/gigabear/.cache/nvim/packer_hererocks/2.1.1761727121/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/home/gigabear/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/gigabear/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/gigabear/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/gigabear/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/gigabear/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/gigabear/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/gigabear/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    commands = { "MarkdownPreview", "MarkdownPreviewToggle", "MarkdownPreviewStop" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/gigabear/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["mind.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tmind\frequire\0" },
    loaded = true,
    path = "/home/gigabear/.local/share/nvim/site/pack/packer/start/mind.nvim",
    url = "https://github.com/phaazon/mind.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/gigabear/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/gigabear/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nÙ\4\0\1\b\0\27\0e5\1\1\0009\2\0\0=\2\2\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\a\0006\6\3\0009\6\b\0069\6\0\0069\6\t\6\18\a\1\0B\2\5\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\n\0006\6\3\0009\6\b\0069\6\0\0069\6\v\6\18\a\1\0B\2\5\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\f\0006\6\3\0009\6\b\0069\6\0\0069\6\r\6\18\a\1\0B\2\5\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\14\0006\6\3\0009\6\b\0069\6\0\0069\6\15\6\18\a\1\0B\2\5\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\16\0006\6\3\0009\6\b\0069\6\0\0069\6\17\6\18\a\1\0B\2\5\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\18\0006\6\3\0009\6\b\0069\6\0\0069\6\19\6\18\a\1\0B\2\5\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\20\0006\6\3\0009\6\b\0069\6\0\0069\6\21\6\18\a\1\0B\2\5\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\22\0006\6\3\0009\6\23\0069\6\24\6\18\a\1\0B\2\5\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\25\0006\6\3\0009\6\23\0069\6\26\6\18\a\1\0B\2\5\1K\0\1\0\14goto_next\a]d\14goto_prev\15diagnostic\a[d\16code_action\15<leader>ca\vrename\15<leader>rn\nhover\6K\19implementation\agi\15references\agr\16declaration\agD\15definition\blsp\agd\6n\bset\vkeymap\bvim\vbuffer\1\0\1\vbuffer\0\bbuf·\t\1\0\v\0001\0Z6\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\6\0006\4\0\0009\4\1\0049\4\4\4'\6\5\0004\a\0\0B\4\3\2=\4\a\0033\4\b\0=\4\t\3B\0\3\0016\0\0\0009\0\n\0009\0\v\0'\2\f\0005\3\14\0005\4\r\0=\4\15\0035\4\16\0=\4\17\0035\4\18\0=\4\19\0035\4\23\0005\5\21\0005\6\20\0=\6\22\5=\5\24\4=\4\25\3B\0\3\0016\0\0\0009\0\n\0009\0\26\0'\2\f\0B\0\2\0016\0\0\0009\0\n\0009\0\v\0'\2\27\0005\3\29\0005\4\28\0=\4\15\0035\4\30\0=\4\17\0035\4\31\0=\4\19\3B\0\3\0016\0\0\0009\0\n\0009\0\26\0'\2\27\0B\0\2\0016\0\0\0009\0\n\0009\0\v\0'\2 \0005\3\"\0005\4!\0=\4\15\0035\4#\0=\4\17\0035\4$\0=\4\19\0035\4/\0005\5(\0005\6&\0005\a%\0=\a'\6=\6)\0055\6,\0006\a\0\0009\a\1\a9\a*\a'\t+\0+\n\2\0B\a\3\2=\a-\6=\6.\5=\0050\4=\4\25\3B\0\3\0016\0\0\0009\0\n\0009\0\26\0'\2 \0B\0\2\1K\0\1\0\bLua\1\0\1\bLua\0\14workspace\flibrary\1\0\2\flibrary\0\20checkThirdParty\1\5\26nvim_get_runtime_file\16diagnostics\1\0\2\14workspace\0\16diagnostics\0\fglobals\1\0\1\fglobals\0\1\2\0\0\bvim\1\4\0\0\16.luarc.json\17.luarc.jsonc\t.git\1\2\0\0\blua\1\0\4\17root_markers\0\14filetypes\0\rsettings\0\bcmd\0\1\2\0\0\24lua-language-server\vlua_ls\1\5\0\0\17package.json\18tsconfig.json\18jsconfig.json\t.git\1\5\0\0\15javascript\20javascriptreact\15typescript\20typescriptreact\1\0\3\17root_markers\0\14filetypes\0\bcmd\0\1\3\0\0\31typescript-language-server\f--stdio\nts_ls\venable\rsettings\vpython\1\0\1\vpython\0\ranalysis\1\0\1\ranalysis\0\1\0\2\27useLibraryCodeForTypes\2\20autoSearchPaths\2\17root_markers\1\5\0\0\19pyproject.toml\rsetup.py\21requirements.txt\t.git\14filetypes\1\2\0\0\vpython\bcmd\1\0\4\17root_markers\0\14filetypes\0\rsettings\0\bcmd\0\1\3\0\0\23pyright-langserver\f--stdio\fpyright\vconfig\blsp\rcallback\0\ngroup\1\0\2\rcallback\0\ngroup\0\18UserLspConfig\24nvim_create_augroup\14LspAttach\24nvim_create_autocmd\bapi\bvim\0" },
    loaded = true,
    path = "/home/gigabear/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/gigabear/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nø\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\3\21ensure_installed\0\14highlight\0\vindent\0\1\b\0\0\vpython\15javascript\15typescript\blua\rmarkdown\thtml\bcss\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/gigabear/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/gigabear/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["obsidian.nvim"] = {
    config = { "\27LJ\2\n@\0\1\4\0\4\0\a6\1\0\0009\1\1\0019\1\2\0015\3\3\0>\0\2\3B\1\2\1K\0\1\0\1\2\0\0\rxdg-open\rjobstart\afn\bvimý\1\1\0\5\0\f\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0004\3\3\0005\4\3\0>\4\1\3=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0023\3\n\0=\3\v\2B\0\2\1K\0\1\0\20follow_url_func\0\aui\1\0\1\venable\1\15completion\1\0\2\14min_chars\3\2\rnvim_cmp\2\15workspaces\1\0\4\20follow_url_func\0\15workspaces\0\15completion\0\aui\0\1\0\2\tname\tmain\tpath\15~/obsidian\nsetup\robsidian\frequire\0" },
    loaded = true,
    path = "/home/gigabear/.local/share/nvim/site/pack/packer/start/obsidian.nvim",
    url = "https://github.com/epwalsh/obsidian.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/gigabear/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/gigabear/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nÔ\2\0\0\t\0\17\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\15\0005\3\4\0005\4\3\0=\4\5\0035\4\f\0005\5\b\0006\6\0\0'\b\6\0B\6\2\0029\6\a\6=\6\t\0056\6\0\0'\b\6\0B\6\2\0029\6\n\6=\6\v\5=\5\r\4=\4\14\3=\3\16\2B\0\2\1K\0\1\0\rdefaults\1\0\1\rdefaults\0\rmappings\6i\1\0\1\6i\0\n<C-k>\28move_selection_previous\n<C-j>\1\0\2\n<C-j>\0\n<C-k>\0\24move_selection_next\22telescope.actions\25file_ignore_patterns\1\0\2\rmappings\0\25file_ignore_patterns\0\1\3\0\0\17node_modules\n.git/\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/home/gigabear/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\n}\0\1\6\0\a\1\0196\1\0\0009\1\1\0019\1\2\1'\3\3\0B\1\2\0026\2\0\0009\2\1\0029\2\4\2\18\4\1\0B\2\2\2\t\2\0\0X\2\6€6\2\0\0009\2\5\2'\4\6\0\18\5\1\0&\4\5\4B\2\2\1K\0\1\0\ttcd \bcmd\16isdirectory\n%:p:h\vexpand\afn\bvim\2¶\1\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0003\3\4\0=\3\5\2B\0\2\1K\0\1\0\fon_open\0\1\0\a\17persist_mode\1\20shade_terminals\2\14direction\15horizontal\17open_mapping\n<C-\\>\tsize\3\f\fon_open\0\18close_on_exit\2\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/home/gigabear/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["tokyonight.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\27colorscheme tokyonight\bcmd\bvim\0" },
    loaded = true,
    path = "/home/gigabear/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["zen-mode.nvim"] = {
    config = { "\27LJ\2\nª\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\vwindow\1\0\1\vwindow\0\foptions\1\0\3\19relativenumber\1\15signcolumn\ano\vnumber\1\1\0\2\nwidth\4³æÌ™\3³æŒÿ\3\foptions\0\nsetup\rzen-mode\frequire\0" },
    loaded = true,
    path = "/home/gigabear/.local/share/nvim/site/pack/packer/start/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: markdown-preview.nvim
time([[Setup for markdown-preview.nvim]], true)
try_loadstring("\27LJ\2\nb\0\0\2\0\6\0\t6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0K\0\1\0\1\2\0\0\rmarkdown\19mkdp_filetypes\ffirefox\17mkdp_browser\6g\bvim\0", "setup", "markdown-preview.nvim")
time([[Setup for markdown-preview.nvim]], false)
-- Config for: zen-mode.nvim
time([[Config for zen-mode.nvim]], true)
try_loadstring("\27LJ\2\nª\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\vwindow\1\0\1\vwindow\0\foptions\1\0\3\19relativenumber\1\15signcolumn\ano\vnumber\1\1\0\2\nwidth\4³æÌ™\3³æŒÿ\3\foptions\0\nsetup\rzen-mode\frequire\0", "config", "zen-mode.nvim")
time([[Config for zen-mode.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nÔ\2\0\0\t\0\17\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\15\0005\3\4\0005\4\3\0=\4\5\0035\4\f\0005\5\b\0006\6\0\0'\b\6\0B\6\2\0029\6\a\6=\6\t\0056\6\0\0'\b\6\0B\6\2\0029\6\n\6=\6\v\5=\5\r\4=\4\14\3=\3\16\2B\0\2\1K\0\1\0\rdefaults\1\0\1\rdefaults\0\rmappings\6i\1\0\1\6i\0\n<C-k>\28move_selection_previous\n<C-j>\1\0\2\n<C-j>\0\n<C-k>\0\24move_selection_next\22telescope.actions\25file_ignore_patterns\1\0\2\rmappings\0\25file_ignore_patterns\0\1\3\0\0\17node_modules\n.git/\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nø\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\3\21ensure_installed\0\14highlight\0\vindent\0\1\b\0\0\vpython\15javascript\15typescript\blua\rmarkdown\thtml\bcss\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: mind.nvim
time([[Config for mind.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tmind\frequire\0", "config", "mind.nvim")
time([[Config for mind.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\n}\0\1\6\0\a\1\0196\1\0\0009\1\1\0019\1\2\1'\3\3\0B\1\2\0026\2\0\0009\2\1\0029\2\4\2\18\4\1\0B\2\2\2\t\2\0\0X\2\6€6\2\0\0009\2\5\2'\4\6\0\18\5\1\0&\4\5\4B\2\2\1K\0\1\0\ttcd \bcmd\16isdirectory\n%:p:h\vexpand\afn\bvim\2¶\1\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0003\3\4\0=\3\5\2B\0\2\1K\0\1\0\fon_open\0\1\0\a\17persist_mode\1\20shade_terminals\2\14direction\15horizontal\17open_mapping\n<C-\\>\tsize\3\f\fon_open\0\18close_on_exit\2\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: obsidian.nvim
time([[Config for obsidian.nvim]], true)
try_loadstring("\27LJ\2\n@\0\1\4\0\4\0\a6\1\0\0009\1\1\0019\1\2\0015\3\3\0>\0\2\3B\1\2\1K\0\1\0\1\2\0\0\rxdg-open\rjobstart\afn\bvimý\1\1\0\5\0\f\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0004\3\3\0005\4\3\0>\4\1\3=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0023\3\n\0=\3\v\2B\0\2\1K\0\1\0\20follow_url_func\0\aui\1\0\1\venable\1\15completion\1\0\2\14min_chars\3\2\rnvim_cmp\2\15workspaces\1\0\4\20follow_url_func\0\15workspaces\0\15completion\0\aui\0\1\0\2\tname\tmain\tpath\15~/obsidian\nsetup\robsidian\frequire\0", "config", "obsidian.nvim")
time([[Config for obsidian.nvim]], false)
-- Config for: tokyonight.nvim
time([[Config for tokyonight.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\27colorscheme tokyonight\bcmd\bvim\0", "config", "tokyonight.nvim")
time([[Config for tokyonight.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nÙ\4\0\1\b\0\27\0e5\1\1\0009\2\0\0=\2\2\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\a\0006\6\3\0009\6\b\0069\6\0\0069\6\t\6\18\a\1\0B\2\5\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\n\0006\6\3\0009\6\b\0069\6\0\0069\6\v\6\18\a\1\0B\2\5\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\f\0006\6\3\0009\6\b\0069\6\0\0069\6\r\6\18\a\1\0B\2\5\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\14\0006\6\3\0009\6\b\0069\6\0\0069\6\15\6\18\a\1\0B\2\5\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\16\0006\6\3\0009\6\b\0069\6\0\0069\6\17\6\18\a\1\0B\2\5\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\18\0006\6\3\0009\6\b\0069\6\0\0069\6\19\6\18\a\1\0B\2\5\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\20\0006\6\3\0009\6\b\0069\6\0\0069\6\21\6\18\a\1\0B\2\5\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\22\0006\6\3\0009\6\23\0069\6\24\6\18\a\1\0B\2\5\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\25\0006\6\3\0009\6\23\0069\6\26\6\18\a\1\0B\2\5\1K\0\1\0\14goto_next\a]d\14goto_prev\15diagnostic\a[d\16code_action\15<leader>ca\vrename\15<leader>rn\nhover\6K\19implementation\agi\15references\agr\16declaration\agD\15definition\blsp\agd\6n\bset\vkeymap\bvim\vbuffer\1\0\1\vbuffer\0\bbuf·\t\1\0\v\0001\0Z6\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\6\0006\4\0\0009\4\1\0049\4\4\4'\6\5\0004\a\0\0B\4\3\2=\4\a\0033\4\b\0=\4\t\3B\0\3\0016\0\0\0009\0\n\0009\0\v\0'\2\f\0005\3\14\0005\4\r\0=\4\15\0035\4\16\0=\4\17\0035\4\18\0=\4\19\0035\4\23\0005\5\21\0005\6\20\0=\6\22\5=\5\24\4=\4\25\3B\0\3\0016\0\0\0009\0\n\0009\0\26\0'\2\f\0B\0\2\0016\0\0\0009\0\n\0009\0\v\0'\2\27\0005\3\29\0005\4\28\0=\4\15\0035\4\30\0=\4\17\0035\4\31\0=\4\19\3B\0\3\0016\0\0\0009\0\n\0009\0\26\0'\2\27\0B\0\2\0016\0\0\0009\0\n\0009\0\v\0'\2 \0005\3\"\0005\4!\0=\4\15\0035\4#\0=\4\17\0035\4$\0=\4\19\0035\4/\0005\5(\0005\6&\0005\a%\0=\a'\6=\6)\0055\6,\0006\a\0\0009\a\1\a9\a*\a'\t+\0+\n\2\0B\a\3\2=\a-\6=\6.\5=\0050\4=\4\25\3B\0\3\0016\0\0\0009\0\n\0009\0\26\0'\2 \0B\0\2\1K\0\1\0\bLua\1\0\1\bLua\0\14workspace\flibrary\1\0\2\flibrary\0\20checkThirdParty\1\5\26nvim_get_runtime_file\16diagnostics\1\0\2\14workspace\0\16diagnostics\0\fglobals\1\0\1\fglobals\0\1\2\0\0\bvim\1\4\0\0\16.luarc.json\17.luarc.jsonc\t.git\1\2\0\0\blua\1\0\4\17root_markers\0\14filetypes\0\rsettings\0\bcmd\0\1\2\0\0\24lua-language-server\vlua_ls\1\5\0\0\17package.json\18tsconfig.json\18jsconfig.json\t.git\1\5\0\0\15javascript\20javascriptreact\15typescript\20typescriptreact\1\0\3\17root_markers\0\14filetypes\0\bcmd\0\1\3\0\0\31typescript-language-server\f--stdio\nts_ls\venable\rsettings\vpython\1\0\1\vpython\0\ranalysis\1\0\1\ranalysis\0\1\0\2\27useLibraryCodeForTypes\2\20autoSearchPaths\2\17root_markers\1\5\0\0\19pyproject.toml\rsetup.py\21requirements.txt\t.git\14filetypes\1\2\0\0\vpython\bcmd\1\0\4\17root_markers\0\14filetypes\0\rsettings\0\bcmd\0\1\3\0\0\23pyright-langserver\f--stdio\fpyright\vconfig\blsp\rcallback\0\ngroup\1\0\2\rcallback\0\ngroup\0\18UserLspConfig\24nvim_create_augroup\14LspAttach\24nvim_create_autocmd\bapi\bvim\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'MarkdownPreview', function(cmdargs)
          require('packer.load')({'markdown-preview.nvim'}, { cmd = 'MarkdownPreview', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'markdown-preview.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('MarkdownPreview ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'MarkdownPreviewToggle', function(cmdargs)
          require('packer.load')({'markdown-preview.nvim'}, { cmd = 'MarkdownPreviewToggle', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'markdown-preview.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('MarkdownPreviewToggle ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'MarkdownPreviewStop', function(cmdargs)
          require('packer.load')({'markdown-preview.nvim'}, { cmd = 'MarkdownPreviewStop', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'markdown-preview.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('MarkdownPreviewStop ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
