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
      require("telescope").setup({})
    end
  }

  -- Treesitter (syntax & indent)
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        highlight = { enable = true },
        indent = { enable = true },
      }
    end
  }

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
          width = 0.6,  -- 60% of the screen; rest are side margins
          options = {
            number = false,
            relativenumber = false,
            signcolumn = "no",
          },
        },
      })
    end,
  })
end)



-- =========================
-- Keymaps
-- =========================
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

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

-- Telescope
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)  -- requires ripgrep
map("n", "<leader>fb", ":Telescope buffers<CR>", opts)
map("n", "<leader>fh", ":Telescope help_tags<CR>", opts)

-- Markdown Preview
map("n", "<leader>mp", ":MarkdownPreviewToggle<CR>", opts)

-- Mind.nvim
map("n", "<leader>mo", ":MindOpenMain<CR>", opts)

-- Markmap (external CLI mindmap in browser)
-- Install once: npm install -g markmap-cli
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
  print(output)  -- shows [nvim2pdf] messages in the command area
end, opts)



-- In terminal mode: press Esc to go back to Normal mode
map("t", "<Esc>", [[<C-\><C-n>]], opts)

-- Equalize all window sizes quickly
map("n", "<leader>=", "<C-w>=", opts)

-- Reload config quickly
map("n", "<leader>sv", ":source $MYVIMRC<CR>", { noremap = true, silent = true, desc = "Reload config" })

-- ZEN MODE TOGGLE 
map("n", "<leader>z", ":ZenMode<CR>", opts)

