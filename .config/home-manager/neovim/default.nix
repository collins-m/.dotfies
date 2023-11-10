{ config, pkgs, lib, ... }: let
  toLua = str: "lua << EOF\n${str}\nEOF\n";
in {
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      gruvbox-nvim
      vim-nix
      (nvim-treesitter.withPlugins (p: [
        p.tree-sitter-nix
        p.tree-sitter-vim
        p.tree-sitter-bash
        p.tree-sitter-rust
        p.tree-sitter-javascript
        p.tree-sitter-typescript
        p.tree-sitter-lua
        p.tree-sitter-python
        p.tree-sitter-json
      ]))
      telescope-nvim
      playground
      harpoon
      undotree
      vim-fugitive
      lsp-zero-nvim
      nvim-cmp
    ];
    extraLuaConfig = ''
      -- PLUGINS IMPORTS
      local builtin = require('telescope.builtin')
      local mark = require('harpoon.mark')
      local ui = require('harpoon.ui')
      local lsp = require('lsp-zero')

      -- REMAPS
      -- map leader
      vim.g.mapleader = " "

      -- search
      vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
      vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
      vim.keymap.set('n', '<C-p>', builtin.git_files, {})
      vim.keymap.set('n', '<leader>ps', function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") });
      end)

      -- harpoon
      vim.keymap.set('n', '<leader>a', mark.add_file)
      vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)

      vim.keymap.set('n', '<C-1>', function() ui.nav_file(1) end)
      vim.keymap.set('n', '<C-2>', function() ui.nav_file(2) end)
      vim.keymap.set('n', '<C-3>', function() ui.nav_file(3) end)
      vim.keymap.set('n', '<C-4>', function() ui.nav_file(4) end)

      -- undotree
      vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

      -- vim fugitive
      vim.keymap.set('n', '<leader>gs', vim.cmd.Git)

      -- LSP
      lsp.preset('recommended')
      lsp.setup()
    '';
  };
}
