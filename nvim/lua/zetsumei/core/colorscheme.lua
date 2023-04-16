--local status, _ = pcall(vim.cmd, "colorscheme lush")
--local status, _ = pcall(vim.cmd, "colorscheme moonfly")
--local status, _ = pcall(vim.cmd, "colorscheme aurora")
--local status, _ = pcall(vim.cmd, "colorscheme abscs")
local status, _ = pcall(vim.cmd, "colorscheme tokyonight")
--local status, _ = pcall(vim.cmd, "colorsheme vscode.nvim")
--local status, _ = pcall(vim.cmd, "colorscheme nord")
if not status then
    print("Colorscheme not found !")
    return
end
