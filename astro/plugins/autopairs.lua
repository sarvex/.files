return {
	"windwp/nvim-autopairs",
	config = function(plugin, opts)
		require("plugins.configs.nvim-autopairs")(plugin, opts) -- include the default astronvim config that calls the setup call
		-- add more custom autopairs configuration such as custom rules
		local npairs = require("nvim-autopairs")
		local Rule = require("nvim-autopairs.rule")
		local cond = require("nvim-autopairs.conds")
		npairs.add_rules(
			{
				Rule("$", "$", { "tex", "latex" })
					-- don't add a pair if the next character is %
					:with_pair(cond.not_after_regex("%%"))
					-- don't add a pair if  the previous character is xxx
					:with_pair(
						cond.not_before_regex("xxx", 3)
					)
					-- don't move right when repeat character
					:with_move(cond.none())
					-- don't delete if the next character is xx
					:with_del(cond.not_after_regex("xx"))
					-- disable adding a newline when you press <cr>
					:with_cr(cond.none()),
			},
			Rule(" ", " "):with_pair(function(options)
				local pair = options.line:sub(options.col - 1, options.col)
				return vim.tbl_contains({ "()", "[]", "{}" }, pair)
			end),
			Rule("( ", " )")
				:with_pair(function()
					return false
				end)
				:with_move(function(options)
					return options.prev_char:match(".%)") ~= nil
				end)
				:use_key(")"),
			Rule("{ ", " }")
				:with_pair(function()
					return false
				end)
				:with_move(function(options)
					return options.prev_char:match(".%}") ~= nil
				end)
				:use_key("}"),
			Rule("[ ", " ]")
				:with_pair(function()
					return false
				end)
				:with_move(function(options)
					return options.prev_char:match(".%]") ~= nil
				end)
				:use_key("]"),
			-- disable for .vim files, but it work for another filetypes
			Rule("a", "a", "-vim")
		)
	end,
}
