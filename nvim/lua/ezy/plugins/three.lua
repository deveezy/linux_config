require("three").setup({
  bufferline = {
    enabled = true,
    icon = {
      -- Tab left/right dividers
      -- Set to this value for fancier, more "tab-looking" tabs
      -- dividers = { " ", " " },
      dividers = { "▍", "" },
      -- Scroll indicator icons when buffers exceed screen width
      scroll = { "«", "»" },
      -- Pinned buffer icon
      pin = "車",
    },
    -- When true, only show buffers that are inside the current directory
    -- This can be toggled on a per-tab basis with toggle_scope_by_dir()
    scope_by_directory = true,
  },
  windows = {
    enabled = true,
    -- Constant or function to calculate the minimum window width of the focused window
    winwidth = function(winid)
      local bufnr = vim.api.nvim_win_get_buf(winid)
      return math.max(vim.api.nvim_buf_get_option(bufnr, "textwidth"), 80)
    end,
    -- Constant or function to calculate the minimum window height of the focused window
    winheight = 10,
  },
  projects = {
    enabled = true,
    -- Name of file to store the project directory cache
    filename = "projects.json",
    -- When true, automatically add directories entered as projects
    -- If false, you will need to manually call add_project()
    autoadd = true,
    -- List of lua patterns. If any match the directory, it will be allowed as a project
    allowlist = {},
    -- List of lua patterns. If any match the directory, it will be ignored as a project
    blocklist = {},
    -- Return true to allow a directory as a project
    filter_dir = function(dir)
      return true
    end,
  },
})
