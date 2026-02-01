-- =========================
-- Basic Settings
-- =========================
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.mouse = "a"
vim.opt.termguicolors = true
vim.opt.wrap = true 
vim.opt.clipboard = "unnamedplus"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.cursorline = true
vim.opt.breakindent = true
vim.opt.breakindentopt = "shift:3" 
vim.opt.linebreak = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = false

-- UI
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

-- Leader Key
vim.g.mapleader = " "

-- =========================
-- Packer Bootstrap (auto-install if missing)
-- =========================
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ "git", "clone", "--depth", "1",
    "https://github.com/wbthomason/packer.nvim", install_path })
  vim.cmd([[packadd packer.nvim]])
end

vim.cmd([[packadd packer.nvim]])

-- Auto recompile when saving this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerCompile
  augroup END
]])

-- =========================
-- Plugins
-- =========================
require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  
  -- Icons
  use "nvim-tree/nvim-web-devicons"
  
  -- Statusline
  use {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup()
    end
  }
  
  -- File Explorer
  use {
    "nvim-tree/nvim-tree.lua",
    requires = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup()
    end
  }
  
  -- Telescope (fuzzy finder)
  use "nvim-lua/plenary.nvim"
  use {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = { "node_modules", ".git/" },
          mappings = {
            i = {
              ["<C-j>"] = require('telescope.actions').move_selection_next,
              ["<C-k>"] = require('telescope.actions').move_selection_previous,
            }
          }
        }
      })
    end
  }
  
  -- Treesitter (syntax & indent)
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = { "python", "javascript", "typescript", "lua", "markdown", "html", "css" },
        highlight = { enable = true },
        indent = { enable = true },
      }
    end
  }
  
 -- LSP Configuration (Native Neovim 0.11+ method)
use {
  "neovim/nvim-lspconfig",
  config = function()
    -- Setup keybindings when LSP attaches
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
      end,
    })

    -- Python LSP
    vim.lsp.config('pyright', {
      cmd = { 'pyright-langserver', '--stdio' },
      filetypes = { 'python' },
      root_markers = { 'pyproject.toml', 'setup.py', 'requirements.txt', '.git' },
      settings = {
        python = {
          analysis = {
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
          }
        }
      }
    })
    vim.lsp.enable('pyright')

    -- TypeScript/JavaScript LSP
    vim.lsp.config('ts_ls', {
      cmd = { 'typescript-language-server', '--stdio' },
      filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
      root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' },
    })
    vim.lsp.enable('ts_ls')

    -- Lua LSP
    vim.lsp.config('lua_ls', {
      cmd = { 'lua-language-server' },
      filetypes = { 'lua' },
      root_markers = { '.luarc.json', '.luarc.jsonc', '.git' },
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
        }
      }
    })
    vim.lsp.enable('lua_ls')
  end
}
  -- Autocompletion
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"
  
  -- Colorscheme
  use {
    "folke/tokyonight.nvim",
    config = function()
      vim.cmd("colorscheme tokyonight")
    end
  }
  
  -- Markdown Preview (browser)
  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = { "markdown" },
    cmd = { "MarkdownPreview", "MarkdownPreviewToggle", "MarkdownPreviewStop" },
    setup = function()
      vim.g.mkdp_browser = "firefox"
      vim.g.mkdp_filetypes = { "markdown" }
    end,
  })
  
  -- Mind map inside Neovim
  use({
    "phaazon/mind.nvim",
    branch = "v2.2",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("mind").setup()
    end,
  })
  
  -- Integrated Terminal (ToggleTerm)
  use({
    "akinsho/toggleterm.nvim",
    tag = "*",
    config = function()
      require("toggleterm").setup({
        size = 12,
        open_mapping = [[<C-\>]],
        direction = "horizontal",
        shade_terminals = true,
        persist_mode = false,
        close_on_exit = true,
        on_open = function(term)
          local current_dir = vim.fn.expand("%:p:h")
          if vim.fn.isdirectory(current_dir) == 1 then
            vim.cmd("tcd " .. current_dir)
          end
        end,
      })
    end,
  })
  
  -- Zen writing mode (left + right margins)
  use({
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup({
        window = {
          width = 0.6,
          options = {
            number = false,
            relativenumber = false,
            signcolumn = "no",
          },
        },
      })
    end,
  })
  
  -- Auto-pairs (auto close brackets, quotes, etc.)
  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup{}
    end
  }
  
  -- Comment plugin (gcc to comment line)
  use {
    "numToStr/Comment.nvim",
    config = function()
      require('Comment').setup()
    end
  }
end)

-- =========================
-- Autocompletion Setup
-- =========================
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  },
})

-- =========================
-- Keymaps
-- =========================
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Mouse: whenever you select text with the mouse and release, yank to system clipboard
map("v", "<LeftRelease>", '"+y', { silent = true })

-- Window navigation
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- Resize splits with Alt + Arrow keys
map('n', '<A-Up>',    ':resize +2<CR>', opts)
map('n', '<A-Down>',  ':resize -2<CR>', opts)
map('n', '<A-Left>',  ':vertical resize -2<CR>', opts)
map('n', '<A-Right>', ':vertical resize +2<CR>', opts)

-- NvimTree
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
map("n", "<leader>r", ":NvimTreeFindFile<CR>", opts)

-- Telescope - FAST FILE NAVIGATION
map("n", "<leader><leader>", ":Telescope find_files<CR>", opts)  -- Quick file finder
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
map("n", "<leader>fb", ":Telescope buffers<CR>", opts)
map("n", "<leader>fh", ":Telescope help_tags<CR>", opts)
map("n", "<leader>fr", ":Telescope oldfiles<CR>", opts)  -- Recent files
map("n", "<leader>/", ":Telescope current_buffer_fuzzy_find<CR>", opts)  -- Search in current file

-- Buffer navigation (super fast for 2-3 open files)
map("n", "<Tab>", ":bnext<CR>", opts)
map("n", "<S-Tab>", ":bprevious<CR>", opts)
map("n", "<leader>bd", ":bdelete<CR>", opts)  -- Close buffer

-- Markdown Preview
map("n", "<leader>mp", ":MarkdownPreviewToggle<CR>", opts)

-- Mind.nvim
map("n", "<leader>mo", ":MindOpenMain<CR>", opts)

-- Markmap (external CLI mindmap in browser)
map("n", "<leader>mm", ":!markmap %<CR>", { noremap = true, silent = true })

-- ToggleTerm (custom directory-aware versions)
map("n", "<leader>t", function()
  local dir = vim.fn.expand("%:p:h")
  local Terminal = require("toggleterm.terminal").Terminal
  local term = Terminal:new({
    direction = "horizontal",
    dir = dir,
    close_on_exit = true,
    shade_terminals = true,
  })
  term:toggle()
end, opts)

map("n", "<leader>T", function()
  local dir = vim.fn.expand("%:p:h")
  local Terminal = require("toggleterm.terminal").Terminal
  local float_term = Terminal:new({
    direction = "float",
    dir = dir,
    close_on_exit = true,
    shade_terminals = true,
  })
  float_term:toggle()
end, opts)

-- Print to PDF using nvim2pdf.sh
vim.keymap.set("n", "<leader>p", function()
  local file = vim.fn.expand("%:p")
  if file == "" then
    print("No file name – save the file first.")
    return
  end
  local script = vim.fn.expand("~/.local/bin/nvim2pdf.sh")
  local cmd = string.format("%s %s",
    vim.fn.shellescape(script),
    vim.fn.shellescape(file)
  )
  local output = vim.fn.system(cmd)
  print(output)
end, opts)

-- In terminal mode: press Esc to go back to Normal mode
map("t", "<Esc>", [[<C-\><C-n>]], opts)

-- Equalize all window sizes quickly
map("n", "<leader>=", "<C-w>=", opts)

-- Reload config quickly
map("n", "<leader>sv", ":source $MYVIMRC<CR>", { noremap = true, silent = true, desc = "Reload config" })

-- ZEN MODE TOGGLE 
map("n", "<leader>z", ":ZenMode<CR>", opts)

-- Quick save
map("n", "<leader>w", ":w<CR>", opts)

-- Quick quit
map("n", "<leader>q", ":q<CR>", opts)
