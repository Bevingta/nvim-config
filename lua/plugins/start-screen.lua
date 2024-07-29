return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		require("alpha").setup(require("alpha.themes.startify").config)
		dashboard.section.header.val = {
			"                           .,,uod8B8bou,,.",
			"              ..,uod8BBBBBBBBBBBBBBBBRPFT?l!i:.",
			"         ,=m8BBBBBBBBBBBBBBBRPFT?!||||||||||||||",
			"         !...:!TVBBBRPFT||||||||||!!^^``    ||||",
			"         !.......:!?|||||!!^^``             ||||",
			"         !.........||||                     ||||",
			"         !.........||||  #>                 ||||",
			"         !.........||||                     ||||",
			"         !.........||||                     ||||",
			"         !.........||||                     ||||",
			"         !.........||||                     ||||",
			"         `.........||||                    ,||||",
			"          .;.......||||               _.-!!|||||",
			"   .,uodWBBBBb.....||||       _.-!!|||||||||!:``",
			"!YBBBBBBBBBBBBBBb..!|||:..-!!|||||||!iof68BBBBBb....",
			"!..YBBBBBBBBBBBBBBb!!||||||||!iof68BBBBBBRPFT?!::   `.",
			"!....YBBBBBBBBBBBBBBbaaitf68BBBBBBRPFT?!:::::::::     `.",
			"!......YBBBBBBBBBBBBBBBBBBBRPFT?!::::::;:!^``;:::       `.",
			"!........YBBBBBBBBBBRPFT?!::::::::::^``  ..:::::;         iBBbo.",
			"`..........YBRPFT?!:::::::::::::::::..:::::;iof68bo.      WBBBBbo.",
			"  `..........:::::::::::::::::::::::;iof688888888888b.     `YBBBP^`",
			"    `........::::::::::::::::;iof688888888888888888888b.     `",
			"     `......:::::::::;iof688888888888888888888888888888b.",
			"        `....:::;iof688888888888888888888888888888888899fT!",
			"          `..::!8888888888888888888888888888888899fT|!^``",
			"            `^` !!988888888888888888888888899fT|!^``",
			"                `!!8888888888888888899fT|!^``",
			"                  `!988888888899fT|!^``",
			"                    `!9899fT|!^``",
			"                      `!^``",
		}
		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("Space fg", "  > Find file", ":cd $HOME/Workspace | Telescope find_files<CR>"),
            dashboard.button("Space gn", "  > Global Note", ":GlobalNote<CR>"),
		}

		alpha.setup(dashboard.opts)
	end,
}
