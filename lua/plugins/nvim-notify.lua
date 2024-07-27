return {
  'rcarriga/nvim-notify',
  config = function()
    local notify = require("notify")

    notify.setup({
      -- Display style
      render = "wrapped-compact",
      max_width = 80,
      -- Animation style
      stages = "slide",
      -- Default timeout for notifications
      timeout = 3000,
      -- For stages that change opacity, this is treated as the highlight behind the window
      background_colour = "#000000",
      -- Icons for the different levels
      icons = {
        ERROR = "",
        WARN = "",
        INFO = "",
        DEBUG = "",
        TRACE = "✎",
      },
    })

    -- Override vim.notify with nvim-notify
    vim.notify = notify

    -- Function to create a notification for errors
    local function notify_error(msg, opts)
      opts = opts or {}
      opts.title = opts.title or "Error"
      opts.level = vim.log.levels.ERROR
      vim.notify(msg, opts.level, opts)
    end

    -- Function to create a notification for general messages
    local function notify_message(msg, opts)
      opts = opts or {}
      opts.title = opts.title or "Message"
      opts.level = vim.log.levels.INFO
      vim.notify(msg, opts.level, opts)
    end

    -- Set up error handling to use notifications
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        client.handlers["window/showMessage"] = function(_, result, ctx)
          local client = vim.lsp.get_client_by_id(ctx.client_id)
          local lvl = ({
            "ERROR",
            "WARN",
            "INFO",
            "DEBUG",
          })[result.type]
          notify_message(result.message, {
            title = "LSP | " .. client.name,
            level = lvl,
            icon = notify.config().icons[lvl],
          })
        end
      end,
    })

    -- Expose the notification functions globally
    _G.notify_error = notify_error
    _G.notify_message = notify_message

    -- Welcome message on startup
    notify("Welcome Back!")
  end,
}
