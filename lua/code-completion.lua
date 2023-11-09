-- menuone: show also for just one code suggestion
-- noinsert: only insert text when selection confirmed
-- noselect: force to select from suggestion
-- preview: show more details
vim.opt.completeopt = { "menu", "menuone" }

-- shortmess is used to reduce verbocity
-- vim.opt.shortmess = vim.opt.shortmess + { c = true }
local cmp = require("cmp")
cmp.setup({
	-- configuration
	snippet = {
		expand = function(args)
			vim.fn["UltiSnips#Anon"](args.body)
		end,
	},

	-- Add borders to the windows
	-- window = {
	-- 	completion = cmp.config.window.bordered(),
	-- 	documentation = cmp.config.window.bordered(),
	-- },

	-- mapping
	mapping = cmp.mapping.preset.insert({
		-- Shift+TAB to go to the Previous Suggested item
		["<C-k>"] = cmp.mapping.select_prev_item(),
		-- Tab to go to the next suggestion
		["<C-j>"] = cmp.mapping.select_next_item(),
		-- CTRL+SHIFT+f to scroll backwards in description
		["<C-S-f>"] = cmp.mapping.scroll_docs(-4),
		-- CTRL+F to scroll forwards in the description
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		-- CTRL+SPACE to bring up completion at current Cursor location
		["<C-Space>"] = cmp.mapping.complete(),
		-- CTRL+e to exit suggestion and close it
		["<C-d>"] = cmp.mapping.close(), -- TODO: Search better option
		-- CR (enter or return) to CONFIRM the currently selection suggestion
		-- We set the ConfirmBehavior to insert the Selected suggestion
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}),
	}),

	-- installed sources for code suggestion
	sources = cmp.config.sources({
		{ name = "ultisnips", keyword_length = 1 },
		{ name = "path" },
		{ name = "nvim_lsp", keyword_length = 2 },
		{ name = "nvim_lsp_signature_help" },
		{ name = "nvim_lua", keyword_length = 4 },
		{ name = "buffer", keyword_length = 1 },
		{ name = "calc" },
		{ name = "lua-latex-symbols", option = { cache = true } },
		-- { name = "spell", option = { keep_all_entries = false }, keyword_length = 2 },
		{ name = "fuzzy_buffer", keyword_length = 4 },
	}),

	-- add formatting of the different sources
	formatting = {
		fields = { "menu", "abbr", "kind" },
		format = function(entry, item)
			local menu_icon = {
				nvim_lsp = "λ",
				ultisnips = "⋗",
				path = "🌐",
				calc = "Σ",
				buffer = "📚",
				lualatexsymbols = "𝕋",
				-- spell = "📚",
				fuzzy_buffer = "📄",
			}
			item.menu = menu_icon[entry.source.name]
			return item
		end,
	},
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = "buffer" },
	}),
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
		{ name = "cmdline_history", keyword_length = 15 },
	}, {
		{ name = "cmdline" },
	}),
})
