

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
vim.opt.conceallevel = 0

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
-- Auto-open PDF in system viewer
-- =========================
vim.api.nvim_create_autocmd("BufReadCmd", {
  pattern = "*.pdf",
  callback = function()
    local file = vim.fn.expand("<amatch>")
    vim.fn.jobstart({ "xdg-open", file }, { detach = true })
    vim.cmd("bd!")
  end,
})

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
      require("nvim-tree").setup({
        update_focused_file = {
          enable = true,
          update_root = true,
        },
        view = {
          width = 35,
        },
        renderer = {
          group_empty = true,
        },
        actions = {
          open_file = {
            quit_on_open = true,
          },
        },
      })
    end
  }
  
  -- Oil.nvim - Edit filesystem like a buffer
  use {
    "stevearc/oil.nvim",
    requires = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        default_file_explorer = false,
        columns = {
          "icon",
          "permissions",
          "size",
        },
        buf_options = {
          buflisted = false,
          bufhidden = "hide",
        },
        win_options = {
          wrap = false,
          signcolumn = "no",
          cursorcolumn = false,
          foldcolumn = "0",
          spell = false,
          list = false,
          conceallevel = 3,
          concealcursor = "nvic",
        },
        delete_to_trash = true,
        skip_confirm_for_simple_edits = false,
        prompt_save_on_select_new_entry = true,
        view_options = {
          show_hidden = true,
          is_hidden_file = function(name, bufnr)
            return vim.startswith(name, ".")
          end,
        },
        keymaps = {
          ["g?"] = "actions.show_help",
          ["<CR>"] = "actions.select",
          ["<C-v>"] = "actions.select_vsplit",
          ["<C-s>"] = "actions.select_split",
          ["<C-t>"] = "actions.select_tab",
          ["<C-p>"] = "actions.preview",
          ["<C-c>"] = "actions.close",
          ["<C-l>"] = "actions.refresh",
          ["-"] = "actions.parent",
          ["_"] = "actions.open_cwd",
          ["`"] = "actions.cd",
          ["~"] = "actions.tcd",
          ["gs"] = "actions.change_sort",
          ["gx"] = "actions.open_external",
          ["g."] = "actions.toggle_hidden",
        },
      })
    end,
  }
  
  -- Telescope (fuzzy finder)
  use "nvim-lua/plenary.nvim"
  use {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = { "node_modules", ".git/", ".obsidian/" },
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
        size = function(term)
          if term.direction == "horizontal" then
            return 15
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
          end
        end,
        open_mapping = [[<C-\>]],
        hide_numbers = true,
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        terminal_mappings = true,
        persist_size = true,
        persist_mode = true,
        direction = "horizontal",
        close_on_exit = true,
        shell = vim.o.shell,
        auto_scroll = true,
        float_opts = {
          border = "curved",
          width = math.floor(vim.o.columns * 0.8),
          height = math.floor(vim.o.lines * 0.8),
        },
      })
    end,
  })
  
  -- Obsidian.nvim
  use {
    "epwalsh/obsidian.nvim",
    tag = "*",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("obsidian").setup({
        workspaces = {
          {
            name = "main",
            path = "~/obsidian",
          },
        },
        completion = {
          nvim_cmp = true,
          min_chars = 2,
        },
        ui = {
          enable = false,
        },
        follow_url_func = function(url)
          vim.fn.jobstart({"xdg-open", url})
        end,
      })
    end,
  }
  
  -- Zen writing mode
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
  
  -- Auto-pairs
  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup{}
    end
  }
  
  -- Comment plugin
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
    { name = 'obsidian'},
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

-- Mouse: select and yank to clipboard
map("v", "<LeftRelease>", '"+y', { silent = true })

-- Window navigation
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- Resize splits
map('n', '<A-Up>',    ':resize +2<CR>', opts)
map('n', '<A-Down>',  ':resize -2<CR>', opts)
map('n', '<A-Left>',  ':vertical resize -2<CR>', opts)
map('n', '<A-Right>', ':vertical resize +2<CR>', opts)

-- NvimTree
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
map("n", "<leader>r", ":NvimTreeFindFile<CR>", opts)

-- Oil.nvim - Edit filesystem like text
map("n", "-", ":Oil<CR>", opts)
map("n", "<leader>-", ":Oil<CR>", opts)

-- Telescope
map("n", "<leader><leader>", ":Telescope find_files<CR>", opts)
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
map("n", "<leader>fb", ":Telescope buffers<CR>", opts)
map("n", "<leader>fh", ":Telescope help_tags<CR>", opts)
map("n", "<leader>fr", ":Telescope oldfiles<CR>", opts)
map("n", "<leader>/", ":Telescope current_buffer_fuzzy_find<CR>", opts)

-- Buffer navigation
map("n", "<Tab>", ":bnext<CR>", opts)
map("n", "<S-Tab>", ":bprevious<CR>", opts)
map("n", "<leader>bd", ":bdelete<CR>", opts)

-- Markdown Preview
map("n", "<leader>mp", ":MarkdownPreviewToggle<CR>", opts)

-- Mind.nvim
map("n", "<leader>mo", ":MindOpenMain<CR>", opts)

-- Markmap
map("n", "<leader>mm", ":!markmap %<CR>", { noremap = true, silent = true })

-- Terminal keymaps
map("n", "<leader>th", function()
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

map("n", "<leader>tv", function()
  local dir = vim.fn.expand("%:p:h")
  local Terminal = require("toggleterm.terminal").Terminal
  local vert_term = Terminal:new({
    direction = "vertical",
    dir = dir,
    close_on_exit = true,
    shade_terminals = true,
    size = vim.o.columns * 0.4,
  })
  vert_term:toggle()
end, opts)

map("n", "<leader>tf", function()
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

-- Keep old terminal keybinds for compatibility
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

-- Terminal mode navigation
map("t", "<Esc>", [[<C-\><C-n>]], opts)
map("t", "<C-h>", [[<C-\><C-n><C-w>h]], opts)
map("t", "<C-j>", [[<C-\><C-n><C-w>j]], opts)
map("t", "<C-k>", [[<C-\><C-n><C-w>k]], opts)
map("t", "<C-l>", [[<C-\><C-n><C-w>l]], opts)

-- Print to PDF
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

-- Window management
map("n", "<leader>=", "<C-w>=", opts)

-- Config reload
map("n", "<leader>sv", ":source $MYVIMRC<CR>", { noremap = true, silent = true })

-- Zen mode
map("n", "<leader>z", ":ZenMode<CR>", opts)

-- Quick save/quit
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)

-- Obsidian keymaps
map("n", "<leader>on", ":ObsidianNew<CR>", opts)
map("n", "<leader>os", ":ObsidianSearch<CR>", opts)
map("n", "<leader>oq", ":ObsidianQuickSwitch<CR>", opts)
map("n", "<leader>ot", ":ObsidianToday<CR>", opts)
map("n", "<leader>oy", ":ObsidianYesterday<CR>", opts)
map("n", "<leader>ob", ":ObsidianBacklinks<CR>", opts)
map("n", "<leader>ol", ":ObsidianLinks<CR>", opts)
map("n", "<leader>oo", ":ObsidianOpen<CR>", opts)

-- Toggle conceallevel for markdown
map("n", "<leader>oc", function()
  if vim.o.conceallevel > 0 then
    vim.o.conceallevel = 0
    print("Raw markdown")
  else
    vim.o.conceallevel = 2
    print("Pretty markdown")
  end
end, opts)

-- Enhanced clipboard operations
map("n", "<leader>yf", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.fn.setreg("*", path)
  print("📋 Copied path: " .. path)
end, opts)

map("n", "<leader>yn", function()
  local name = vim.fn.expand("%:t")
  vim.fn.setreg("+", name)
  vim.fn.setreg("*", name)
  print("📋 Copied name: " .. name)
end, opts)

map("n", "<leader>yk", function()
  local filename = vim.fn.expand("%:t:r")
  local link = "[[" .. filename .. "]]"
  vim.fn.setreg("+", link)
  vim.fn.setreg("*", link)
  print("📋 Copied link: " .. link)
end, opts)

map("n", "<leader>ya", function()
  vim.cmd("%y+")
  print("📋 Copied entire file")
end, opts)

-- File operations
map("n", "<leader>fx", function()
  local file = vim.fn.expand("%:p")
  if file == "" then
    print("No file to open")
    return
  end
  vim.fn.jobstart({"xdg-open", file}, {detach = true})
  print("Opening: " .. vim.fn.expand("%:t"))
end, opts)
