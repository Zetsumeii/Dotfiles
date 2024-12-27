vim.g.mapleader = ","

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

require('lazy').setup({
    -- lua functions
    "nvim-lua/plenary.nvim",

    --colorscheme
    {"bluz71/vim-moonfly-colors", branch = 'cterm-compat'},
    "rktjmp/lush.nvim",
    "ray-x/aurora",
    "folke/tokyonight.nvim",
    "Abstract-IDE/Abstract-cs",
    "Mofiqul/vscode.nvim",
    "shaunsingh/nord.nvim",
    {"rose-pine/neovim", as = "rose-pine" },
    "dam9000/colorscheme-midnightblue",
    'nonetallt/vim-neon-dark',
    'backdround/melting',
    'daenuprobst/lcarsoft',
    {
        'mustardfrog/pinkish_day',
        lazy = true,
        dependencies = { 'rktjmp/lush.nvim' },
    },
    {
      'comfysage/evergarden',
      priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
      opts = {
        transparent_background = true,
        contrast_dark = 'medium', -- 'hard'|'medium'|'soft'
        overrides = { }, -- add custom overrides
      }
    },
    'roobert/palette.nvim',
    {
      "timofurrer/edelweiss",
      lazy = false, -- make sure we load this during startup, because it's the main colorscheme
      priority = 1000, -- make sure to load this before all the other start plugins
      config = function(plugin)
        vim.opt.rtp:append(plugin.dir .. "/nvim")
        vim.cmd([[colorscheme edelweiss]])
      end
    },
    "xero/evangelion.nvim",

    -- utility
    "jghauser/mkdir.nvim",
    "gaborvecsei/cryptoprice.nvim",


    -- notification
     'rcarriga/nvim-notify',

    -- indent_blankline
    "lukas-reineke/indent-blankline.nvim",

    --transpartent
    "xiyaowong/transparent.nvim",

    -- essentials
    "tpope/vim-surround",
    "vim-scripts/ReplaceWithRegister",

    -- leetcode
    {
        "kawre/leetcode.nvim",
        build = ":TSUpdate html",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim", -- required by telescope
            "MunifTanjim/nui.nvim",

            -- optional
            "nvim-treesitter/nvim-treesitter",
            "rcarriga/nvim-notify",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            -- configuration goes here
        },
    },

    -- file explorer
    {"nvim-telescope/telescope-fzf-native.nvim", build = "make"},
    {"nvim-telescope/telescope.nvim", branch = "0.1.x"},

	 {
	  "nvim-neo-tree/neo-tree.nvim",
	    branch = "v3.x",
	    dependencies = {
	      "nvim-lua/plenary.nvim",
	      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	      "MunifTanjim/nui.nvim",
	      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	    }
	  },

    -- icons
    "kyazdani42/nvim-web-devicons",

    -- status line
    {
      "nvim-lualine/lualine.nvim",
      event = "VeryLazy",
      opts = {
        options = {
          -- this is all you need
          theme = "evangelion",

          -- below is some extra style
          component_separators = { left = "░", right = "░" },
          section_separators = { left = "▓▒░", right = "░▒▓" },
        },
        sections = {
          lualine_x = {
            { "encoding", padding = { left = 1, right = 1 }, separator = { left = "░▒▓" } },
            { "fileformat" },
            { "filetype" },
          },
          lualine_y = {'searchcount', 'progress'},
        },
      },
    },
    "yamatsum/nvim-cursorline",


    -- autocompletion
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    {
        "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup{} end
    },

    -- Discord Rich presence
    'andweeb/presence.nvim',

    -- LSP
    {
        --"williamboman/mason.nvim",
        --"williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },

    -- header
    "Nero-F/vim-tek-header",

    -- treesitter
    "nvim-treesitter/nvim-treesitter",

    -- copilot
    {
      "jackMort/ChatGPT.nvim",
        config = function()
          require("chatgpt").setup()
        end,
        dependencies = {
          "MunifTanjim/nui.nvim",
          "nvim-lua/plenary.nvim",
          "nvim-telescope/telescope.nvim"
        }
    },

    -- formatter
    {
      'stevearc/conform.nvim',
    },

    --clang
    "rhysd/vim-clang-format",
    })
