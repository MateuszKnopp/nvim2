return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- import comment plugin safely
    local comment = require("Comment")

    -- enable comment for Golang
    comment.setup({
      -- Golang uses // for single-line comments and /* */ for block comments
      pre_hook = function(ctx)
        local U = require("Comment.utils")

        -- Determine whether to use single-line or block comments
        local location = nil
        if ctx.ctype == U.ctype.block then
          location = require("ts_context_commentstring.utils").get_cursor_location()
        elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
          location = require("ts_context_commentstring.utils").get_visual_start_location()
        end

        -- return default comments for Go
        if vim.bo.filetype == 'go' then
          return '// %s'
        end
      end,
    })
  end,
}
