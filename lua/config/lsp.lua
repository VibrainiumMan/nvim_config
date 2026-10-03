local servers = {
    clangd = {
	cmd = { "clangd" },
	filetypes = { "c", "cpp", "objc", "objcpp" },
	root_markers = { "compile_commands.json", "compile_flags.txt", ".git" }
    },

    lua_ls = {
	cmd = { "lua-language-server" },
	filetypes = { "lua" }
    },

    pylsp = {
	cmd = { "pylsp", },
	filetypes = { "python" },
	root_markers = { 
	    ".git",
	    "pyproject.toml",
	    "setup.py",
	    "requirements.txt",
	}
    },

    make_ls = {
	cmd = { "/home/adrian/.venv/bin/make-ls"},
	filetypes = { "make" },
	root_markers = { ".git", "Makefile" }
    }

}

for name, config in pairs(servers) do
    vim.lsp.config[name] = config
end

vim.lsp.enable(vim.tbl_keys(servers))

vim.lsp.config("*", {
    capabilities = vim.lsp.protocol.make_client_capabilities(),
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
	local client = vim.lsp.get_client_by_id(args.data.client_id)

	if client then
	    vim.bo[args.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
	end
    end,
})

vim.api.nvim_create_autocmd("TextChangedI", {
    callback = function()
	local col = vim.api.nvim_win_get_cursor(0)[2]
	local line = vim.api.nvim_get_current_line()

	if col > 0 and not line:sub(col, col):match("%s") then
	    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-x><C-o>", true, false, true), "n", true)
	end
    end
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
	vim.lsp.buf.format({
	    async = false,
	})
    end,
})
