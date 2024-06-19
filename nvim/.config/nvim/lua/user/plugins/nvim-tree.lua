return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  --cmd = {"NvimTreeToggle","NvimTreeFocus"},
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin =1

    require("nvim-tree").setup({
      hijack_cursor = true,
      select_prompts = true,
      view = {
        signcolumn = "auto",
        width = 25,
      },
      renderer = {
        root_folder_label = false,
        add_trailing = true,
        group_empty = true,
        indent_width = 1,
        indent_markers = {
          enable = false
        },
        icons = {
          git_placement = "after"
        },
      },
      git = {
        enable = true,
        show_on_open_dirs = false,
      },
      diagnostics = {
        enable = false,
      },
      modified = {
        enable = true
      }
    })
  end,
}
