local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
    return
end

return packer.startup(function(use)
    use("wbthomason/packer.nvim")

    -- lua functions
    use("nvim-lua/plenary.nvim")

    --colorscheme
    use({"bluz71/vim-moonfly-colors", branch = 'cterm-compat'})
    use({"rktjmp/lush.nvim"});
    use({"ray-x/aurora"})
    use({"folke/tokyonight.nvim"})
    use({"Abstract-IDE/Abstract-cs"})
    use({"Mofiqul/vscode.nvim"})
    use({"shaunsingh/nord.nvim"})
    use({ "rose-pine/neovim", as = "rose-pine" })
    use({"dam9000/colorscheme-midnightblue"})
    use {'oneslash/helix-nvim', tag = "*"}

    --indent_blankline
    use({"lukas-reineke/indent-blankline.nvim"})

    --transpartent
    use({"xiyaowong/transparent.nvim"})

    -- essentials
    use("tpope/vim-surround")
    use("vim-scripts/ReplaceWithRegister")

    --use("numToStr/Comment.nvim")

    -- file explorer
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
    use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

	use {
	  "nvim-neo-tree/neo-tree.nvim",
	    branch = "v3.x",
	    requires = {
	      "nvim-lua/plenary.nvim",
	      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	      "MunifTanjim/nui.nvim",
	      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	    }
	  }

    -- icons
    use("kyazdani42/nvim-web-devicons")

    -- status line
    use("nvim-lualine/lualine.nvim")

    -- autocompletion
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-nvim-lsp")
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use("rafamadriz/friendly-snippets")
    use{
        "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup{} end
    }

    -- Discord Rich presence
    use('andweeb/presence.nvim')

    -- LSP
    use{
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }

    -- header
    use("Nero-F/vim-tek-header")

    --treesitter
    use({"nvim-treesitter/nvim-treesitter"})

    -- copilot
    use({
      "jackMort/ChatGPT.nvim",
        config = function()
          require("chatgpt").setup()
        end,
        requires = {
          "MunifTanjim/nui.nvim",
          "nvim-lua/plenary.nvim",
          "nvim-telescope/telescope.nvim"
        }
    })

    --clang
    use({"rhysd/vim-clang-format"})

    if packer_bootstrap then
        require("packer").sync()
    end
end)
