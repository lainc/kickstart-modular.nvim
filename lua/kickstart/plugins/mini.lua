return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      require('mini.ai').setup { n_lines = 500, custom_textobjects = { f = false } }
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end
      require('mini.basics').setup {}
      require('mini.bracketed').setup {
        treesitter = { suffix = 'k' },
      }
      require('mini.bufremove').setup {}
      vim.keymap.set('n', '<leader>bd', _G.MiniBufremove.delete, { desc = '[B]uffer [R]emove without changing window layout' })
      -- require('mini.comment').setup {}
      require('mini.files').setup {
        keys = { { '<leader>se', '_G.MiniFiles.open', desc = '[S]earch [E]xplorer' } },
        dependencies = { 'nvim-tree/nvim-web-devicons' },
      }
      -- vim.keymap.set('n', '<leader>se', _G.MiniFiles.open, { desc = '[S]earch [E]xplorer' })
      require('mini.jump').setup {}
      require('mini.jump2d').setup {}
      require('mini.move').setup {}
      require('mini.operators').setup {}
      -- g= -> Evaluate text and replace with output
      -- gx -> Exchange text regions
      -- gm -> Multiply (duplicate) text
      -- gr -> Replace text with register
      -- gs -> Sort text
      require('mini.sessions').setup {
        directory = vim.fn.stdpath 'config' .. '/sessions',
      }
      require('mini.starter').setup()
      require('mini.surround').setup {}
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      -- require('mini.visits').setup {}

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
