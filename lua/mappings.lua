require "nvchad.mappings"

-- add yours here

local disabled = {
  n = {
    "<leader>h",
    "<leader>v",
  },
}

local map = vim.keymap.set
local nomap = vim.keymap.del

local M = {}

M.CMD = {
  n = {
    [";"] = {
      ":",
      "CMD enter command mode",
    },
  },
  i = {
    ["jj"] = {
      "<ESC>",
      "CMD exit input mode",
    },
  },
}

M.ssr = {
  n = {
    ["<leader>sr"] = {
      function()
        require("ssr").open()
      end,
      "SSR Structural search and replace",
    },
  },
}

local BC = { direction = require("hop.hint").HintDirection.BEFORE_CURSOR }
local AC = { direction = require("hop.hint").HintDirection.AFTER_CURSOR }

M.hop = {
  n = {
    ["<leader><leader>w"] = {
      function()
        require("hop").hint_words(AC)
      end,
      "Hop words AC",
    },
    ["<leader><leader>b"] = {
      function()
        require("hop").hint_words(BC)
      end,
      "Hop words BC",
    },
    ["<leader><leader>j"] = {
      function()
        require("hop").hint_lines_skip_whitespace(AC)
      end,
      "Hop lines AC",
    },
    ["<leader><leader>k"] = {
      function()
        require("hop").hint_lines_skip_whitespace(BC)
      end,
      "Hop lines BC",
    },
  },
}

M.lsp = {
  n = {
    ["<leader>fd"] = {
      function ()
        vim.diagnostic.open_float()
      end,
      "LSP open float diagnostic"
    }
  }
}

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

for mode, configs in pairs(disabled) do
  for _, key in pairs(configs) do
    nomap(mode, key)
  end
end

for _, configs in pairs(M) do
  for mode, mappings in pairs(configs) do
    for key, val in pairs(mappings) do
      map(mode, key, val[1], { desc = val[2] })
    end
  end
end
