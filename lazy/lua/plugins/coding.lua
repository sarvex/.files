return {
	{ "wakatime/vim-wakatime" },
	{
		'folke/trouble.nvim',
		-- opts will be merged with the parent spec
		opts = { use_diagnostic_signs = true },
	},
	-- add nvim-ufo
	{
		'kevinhwang91/nvim-ufo',
		dependencies = 'kevinhwang91/promise-async',
		event = 'BufReadPost',
		enabled = false,
		opts = {},

		init = function()
			-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
			vim.keymap.set('n', 'zR', function()
				require('ufo').openAllFolds()
			end)
			vim.keymap.set('n', 'zM', function()
				require('ufo').closeAllFolds()
			end)
		end,
	},
	-- diff
	{
		{
			"sindrets/diffview.nvim",
			event = "VeryLazy",
		},
		{
			"akinsho/git-conflict.nvim",
			opts = {
				disable_diagnostics = true,
				default_mappings = {
					prev = "[x",
					next = "]x",
				},
			},
		},
	},

	-- folding support
	{
		"kevinhwang91/nvim-ufo",
		dependencies = {
			"kevinhwang91/promise-async",
			{
				"luukvbaal/statuscol.nvim",
				config = function()
					local builtin = require("statuscol.builtin")
					require("statuscol").setup({
						-- foldfunc = "builtin",
						-- setopt = true,
						relculright = true,
						segments = {
							{ text = { builtin.foldfunc },      click = "v:lua.ScFa" },
							{ text = { "%s" },                  click = "v:lua.ScSa" },
							{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
						},
					})
				end,
			},
			"nvim-treesitter/nvim-treesitter",
		},
		event = "BufReadPost",
		opts = {
			provider_selector = function(bufnr, filetype, buftype)
				local ft_map = {
					yuck = "treesitter",
				}
				local ft_ignore = { "neo-tree", "git", "alpha" }

				for _, ft in ipairs(ft_ignore) do
					ft_map[ft] = ""
				end

				local function fallback(err, provider)
					if type(err) == "string" and err:match("UfoFallbackException") then
						return require("ufo").getFolds(bufnr, provider)
					else
						return require("promise").reject(err)
					end
				end

				return ft_map[filetype]
						or function()
							return require("ufo")
									.getFolds(bufnr, "lsp")
									:catch(function(err)
										return fallback(err, "treesitter")
									end)
									:catch(function(err)
										if buftype == "nofile" then
											return ""
										end
										return fallback(err, "indent")
									end)
						end
			end,
			open_fold_hl_timeout = 400,
			close_fold_kinds = { "imports", "comment" },
			preview = {
				win_config = {
					border = { "", "─", "", "", "", "─", "", "" },
					-- winhighlight = "Normal:Folded",
					winblend = 0,
				},
				mappings = {
					scrollU = "<C-u>",
					scrollD = "<C-d>",
					jumpTop = "[",
					jumpBot = "]",
				},
			},

			fold_virt_text_handler = function(virtual_text, foldstart, foldend, width, truncate)
				local max_width = 120 -- FIXME: hardcode this for now
				local result = {}

				local total_lines = vim.api.nvim_buf_line_count(0)
				local folded_lines = foldend - foldstart

				local fold_hint = ("  %d %d%%"):format(folded_lines, folded_lines / total_lines * 100)
				local hint_width = vim.fn.strdisplaywidth(fold_hint)
				local target_width = width - hint_width
				local cur_width = 0

				for _, chunk in ipairs(virtual_text) do
					local chunk_text = chunk[1]
					local chunk_width = vim.fn.strdisplaywidth(chunk_text)

					if target_width > cur_width + chunk_width then
						table.insert(result, chunk)
					else
						chunk_text = truncate(chunk_text, target_width - cur_width)

						local hl = chunk[2]
						table.insert(result, { chunk_text, hl })

						chunk_width = vim.fn.strdisplaywidth(chunk_text)
						-- str width returned from truncate() may less than 2nd argument, need padding
						if cur_width + chunk_width < target_width then
							fold_hint = fold_hint .. (" "):rep(target_width - cur_width - chunk_width)
						end
						break
					end
					cur_width = cur_width + chunk_width
				end

				local padding = math.max(math.min(max_width, width - 1) - cur_width - hint_width, 0)
				fold_hint = (" "):rep(padding) .. fold_hint
				table.insert(result, { fold_hint, "MoreMsg" })
				return result
			end,
		},
		init = function()
			local opt = vim.opt
			opt.fillchars = {
				eob = " ",
				fold = " ",
				foldopen = "",
				foldsep = " ",
				foldclose = "",
			}
			opt.foldcolumn = "1"
			opt.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
			opt.foldlevelstart = 99 -- do not autofold
			opt.foldenable = true
		end,
		keys = {
			{
				"Z",
				function()
					require("ufo").peekFoldedLinesUnderCursor()
				end,
				mode = "n",
				desc = "Hover",
			},
			{
				"zR",
				function()
					require("ufo").openAllFolds()
				end,
				mode = "n",
				desc = "Open all folds",
			},
			{
				"zM",
				function()
					require("ufo").closeAllFolds()
				end,
				mode = "n",
				desc = "Close all folds",
			},
			{
				"zr",
				function()
					require("ufo").openFoldsExceptKinds()
				end,
				mode = "n",
				desc = "Fold less",
			},
			{
				"zm",
				function(level)
					require("ufo").closeFoldsWith(level)
				end,
				mode = "n",
				desc = "Fold more",
			},
		},
	},
	{ -- buffer enhancements
		{ import = "lazyvim.plugins.extras.util.mini-hipatterns" },
		{
			"lewis6991/satellite.nvim",
			dependencies = {
				"lewis6991/gitsigns.nvim",
			},
			event = "VeryLazy",
			opts = {
				excluded_filetypes = { "alpha", "dashboard", "neo-tree", "noice", "prompt", "TelescopePrompt" },
			},
		},
	},
	{
		'huggingface/hfcc.nvim',
		opts = {
			api_token = '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',
			model = 'bigcode/starcoder',
			query_params = {
				max_new_tokens = 200,
			},
		},
		init = function()
			vim.api.nvim_create_user_command('StarCoder', function()
				require('hfcc.completion').complete()
			end, {})
		end,
	},

	{
		'danymat/neogen',
		keys = {
			{
				'<leader>cc',
				function()
					require('neogen').generate({})
				end,
				desc = 'Neogen Comment',
			},
		},
		opts = { snippet_engine = 'luasnip' },
	},

	{
		'smjonas/inc-rename.nvim',
		cmd = 'IncRename',
		config = true,
	},

	{
		'ThePrimeagen/refactoring.nvim',
		keys = {
			{
				'<leader>r',
				function()
					require('refactoring').select_refactor()
				end,
				mode = 'v',
				noremap = true,
				silent = true,
				expr = false,
			},
		},
		opts = {},
	},

	{
		'echasnovski/mini.bracketed',
		event = 'BufReadPost',
		config = function()
			local bracketed = require('mini.bracketed')

			-- local function put(cmd, regtype)
			--   local body = vim.fn.getreg(vim.v.register)
			--   local type = vim.fn.getregtype(vim.v.register)
			--   ---@diagnostic disable-next-line: param-type-mismatch
			--   vim.fn.setreg(vim.v.register, body, regtype or 'l')
			--   bracketed.register_put_region()
			--   vim.cmd(('normal! '%s%s'):format(vim.v.register, cmd:lower()))
			--   ---@diagnostic disable-next-line: param-type-mismatch
			--   vim.fn.setreg(vim.v.register, body, type)
			-- end
			--
			-- for _, cmd in ipairs({ ']p', '[p' }) do
			--   vim.keymap.set('n', cmd, function()
			--     put(cmd)
			--   end)
			-- end
			-- for _, cmd in ipairs({ ']P', '[P' }) do
			--   vim.keymap.set('n', cmd, function()
			--     put(cmd, 'c')
			--   end)
			-- end
			--
			-- local put_keys = { 'p', 'P' }
			-- for _, lhs in ipairs(put_keys) do
			--   vim.keymap.set({ 'n', 'x' }, lhs, function()
			--     return bracketed.register_put_region(lhs)
			--   end, { expr = true })
			-- end

			bracketed.setup({
				file = { suffix = '' },
				window = { suffix = '' },
				quickfix = { suffix = '' },
				yank = { suffix = '' },
				treesitter = { suffix = 'n' },
			})
		end,
	},

	-- better increase/descrease
	{
		'monaqa/dial.nvim',
		-- stylua: ignore
		keys = {
			{ '<C-a>', function() return require('dial.map').inc_normal() end, expr = true, desc = 'Increment' },
			{ '<C-x>', function() return require('dial.map').dec_normal() end, expr = true, desc = 'Decrement' },
		},
		config = function()
			local augend = require('dial.augend')
			require('dial.config').augends:register_group({
				default = {
					augend.integer.alias.decimal,
					augend.integer.alias.hex,
					augend.date.alias['%Y/%m/%d'],
					augend.constant.alias.bool,
					augend.semver.alias.semver,
					augend.constant.new({ elements = { 'let', 'const' } }),
				},
			})
		end,
	},

	{
		"L3MON4D3/LuaSnip",
		keys = function()
			return {}
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-emoji",
		},
		---@param opts cmp.ConfigSchema
		opts = function(_, opts)
			local cmp = require("cmp")
			opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }))

			local has_words_before = function()
				unpack = unpack or table.unpack
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end

			local luasnip = require("luasnip")
			local cmp = require("cmp")

			opts.mapping = vim.tbl_extend("force", opts.mapping, {
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						-- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
						cmp.select_next_item()
						-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
						-- this way you will only jump inside the snippet region
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			})
		end,
	}
}
