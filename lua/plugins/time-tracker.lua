return {
	"gaborvecsei/usage-tracker.nvim",
	config = function()
		require("usage-tracker").setup({
			inactivity_threshold_in_min = 15,
		})
	end,
}
