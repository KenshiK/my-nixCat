-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
return {
  {
    "nvim-treesitter",
    for_cat = 'general.treesitter',
    -- cmd = { "" },
    event = "DeferredUIEnter",
    -- ft = "",
    -- keys = "",
    -- colorscheme = "",
    load = function (name)
        vim.cmd.packadd(name)
        vim.cmd.packadd("nvim-treesitter-textobjects")
    end,
    after = function (plugin)
      -- [[ Configure Treesitter ]]
      -- See `:help nvim-treesitter`
      require('nvim-treesitter.configs').setup {
        highlight = { enable = true, },
        indent = { enable = false, },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            scope_incremental = '<c-s>',
            node_decremental = '<M-space>',
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ['aa'] = '@parameter.outer',
              ['ia'] = '@parameter.inner',
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
              ["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
              ["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              ["]f"] = "@function.outer",
              ["]c"] = "@conditional.outer",
              ["]a"] = "@parameter.inner",
              ["]l"] = "@loop.outer",
              [']]'] = '@class.outer',
            },
            goto_next_end = {
              ["]F"] = "@function.outer",
              ["]C"] = "@conditional.outer",
              ["]A"] = "@parameter.inner",
              ["]L"] = "@loop.outer",
              [']['] = '@class.outer',
            },
            goto_previous_start = {
              ["[f"] = "@function.outer",
              ["[c"] = "@conditional.outer",
              ["[a"] = "@parameter.inner",
              ["[l"] = "@loop.outer",
              ['[['] = '@class.outer',
            },
            goto_previous_end = {
              ["[F"] = "@function.outer",
              ["[C"] = "@conditional.outer",
              ["[A"] = "@parameter.outer",
              ["[L"] = "@loop.outer",
              ['[]'] = '@class.outer',
            },
          },
          swap = {
            enable = true,
            lookahead = true,
            swap_next = {
              ["<leader>xa"] = { query = "@parameter.inner", desc = "E[x]change [a]rgument place with the next one" }
            },
            swap_previous = {
              ["<leader>xA"] = { query = "@parameter.inner", desc = "E[x]change [A]rgument place with the previous one" },
            },
          },
        },
      }
    end,
  },
}
