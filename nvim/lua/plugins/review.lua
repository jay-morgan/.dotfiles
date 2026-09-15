-- Open PRs waiting on my review, direct requests first then team-wide ones.
-- `review-requested:@me` covers both; subtracting `user-review-requested:@me`
-- isolates the team-only remainder, so the two queries partition the set with
-- no duplicates. Octo concatenates the results in prompt order.
local REVIEW_QUEUE = {
  "is:open is:pr user-review-requested:@me sort:updated-desc",
  "is:open is:pr review-requested:@me -user-review-requested:@me sort:updated-desc",
}

local function open_review_queue()
  require("lazy").load { plugins = { "octo.nvim" } }
  require("octo.picker").search { prompt = REVIEW_QUEUE }
end

return {
  {
    "pwntester/octo.nvim",
    cmd = "Octo",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      enable_builtin = true,
      picker = "telescope",
    },
    init = function()
      if vim.env.NVIM_PR_QUEUE ~= "1" then
        return
      end

      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        once = true,
        callback = function()
          vim.schedule(open_review_queue)
        end,
      })

      -- Launched via the PR-review keybind, so opening a PR means reviewing it:
      -- resume the pending review automatically, but only if one already exists.
      -- `Octo review start_or_resume` is avoided deliberately — it would create an
      -- empty pending review on any PR merely opened to look at.
      local resumed = false

      local function resume_if_pending(buffer, attempt)
        vim.system(
          { "gh", "api", ("repos/%s/pulls/%d/reviews"):format(buffer.repo, buffer.number),
            "--jq", '[.[] | select(.state=="PENDING")] | length' },
          { text = true },
          vim.schedule_wrap(function(res)
            if res.code ~= 0 then
              if attempt < 3 then
                vim.defer_fn(function() resume_if_pending(buffer, attempt + 1) end, 500)
              end
              return
            end
            local pending = tonumber(vim.trim(res.stdout or "")) or 0
            if pending > 0 then
              resumed = true
              vim.cmd("Octo review resume")
            end
          end)
        )
      end

      local function wait_for_pr_buffer(bufnr, attempt)
        local buffer = _G.octo_buffers and _G.octo_buffers[bufnr]
        if buffer and buffer.kind == "pull" and buffer.number and buffer.repo then
          resume_if_pending(buffer, 1)
        elseif attempt < 20 then
          vim.defer_fn(function() wait_for_pr_buffer(bufnr, attempt + 1) end, 100)
        end
      end

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "octo",
        callback = function(args)
          if resumed then
            return
          end
          wait_for_pr_buffer(args.buf, 1)
        end,
      })
    end,
    keys = {
      { "<leader>gP", open_review_queue, desc = "PRs awaiting my review" },
      { "<leader>gR", "<cmd>Octo review resume<cr>", desc = "Resume PR review" },
    },
  },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  },
}
