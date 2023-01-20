local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

local icons = require "ezy.plugins.icons"

local function diagnostics_indicator(num, _, diagnostics, _)
  local result = {}
  local symbols = {
    error = icons.diagnostics.Error,
    warning = icons.diagnostics.Warning,
    info = icons.diagnostics.Information,
  }
  for name, count in pairs(diagnostics) do
    if symbols[name] and count > 0 then
      table.insert(result, symbols[name] .. " " .. count)
    end
  end
  result = table.concat(result, " ")
  return #result > 0 and result or ""
end


local bar_bg = "#3e3634"
local activeBuffer_bg = "#252222"
local inactiveBuffer_bg = "#3e3634"
local activeBuffer_fg = "#fdf6e3"
local visibleBuffer_fg = "#eee8d5"
local inactiveBuffer_fg = "#93a1a1"
local duplicate_fg = "#586e75"
local modified_fg = "#b58900"
local info_fg = "#268bd2"
local warning_fg = "#cb4b16"
local error_fg = "#dc322f"

bufferline.setup {
  options = {
    numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
    close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
    right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
    -- NOTE: this plugin is designed with this icon in mind,
    -- and so changing this is NOT recommended, this is intended
    -- as an escape hatch for people who cannot bear it for whatever reason
    indicator = {
      style = "icon",
      icon = "▎",
    },
    buffer_close_icon = "",
    -- buffer_close_icon = '',
    modified_icon = "●",
    close_icon = "",
    -- close_icon = '',
    left_trunc_marker = "",
    right_trunc_marker = "",
    --- name_formatter can be used to change the buffer's label in the bufferline.
    --- Please note some names can/will break the
    --- bufferline so use this at your discretion knowing that it has
    --- some limitations that will *NOT* be fixed.
    -- name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
    --   -- remove extension from markdown files for example
    --   if buf.name:match('%.md') then
    --     return vim.fn.fnamemodify(buf.name, ':t:r')
    --   end
    -- end,
    max_name_length = 30,
    max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
    tab_size = 21,
    diagnostics = "nvim_lsp", -- | "nvim_lsp" | "coc",
    diagnostics_update_in_insert = false,
    diagnostics_indicator = diagnostics_indicator,
    -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
    --   return "("..count..")"
    -- end,
    -- NOTE: this will be called a lot so don't do any heavy processing here
    -- custom_filter = function(buf_number)
    --   -- filter out filetypes you don't want to see
    --   if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
    --     return true
    --   end
    --   -- filter out by buffer name
    --   if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
    --     return true
    --   end
    --   -- filter out based on arbitrary rules
    --   -- e.g. filter out vim wiki buffer from tabline in your work repo
    --   if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
    --     return true
    --   end
    -- end,
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = false,
    show_tab_indicators = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
    enforce_regular_tabs = true,
    always_show_bufferline = true,
    -- sort_by = 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
    --   -- add custom logic
    --   return buffer_a.modified > buffer_b.modified
    -- end
  },
  -- highlights = {
  --   fill = {
  --     fg = { attribute = "fg", highlight = "Tabline" },
  --     bg = { attribute = "bg", highlight = "TabLine" },
  --   },
  --   background = {
  --     fg = { attribute = "fg", highlight = "TabLine" },
  --     bg = { attribute = "bg", highlight = "TabLine" },
  --   },
  --
  --   -- buffer_selected = {
  --   --   fg = {attribute='fg',highlight='#ff0000'},
  --   --   bg = {attribute='bg',highlight='#0000ff'},
  --   --   gui = 'none'
  --   --   },
  --   buffer_visible = {
  --     fg = { attribute = "fg", highlight = "TabLine" },
  --     bg = { attribute = "bg", highlight = "TabLine" },
  --   },
  --
  --   close_button = {
  --     fg = { attribute = "fg", highlight = "TabLine" },
  --     bg = { attribute = "bg", highlight = "TabLine" },
  --   },
  --   close_button_visible = {
  --     fg = { attribute = "fg", highlight = "TabLine" },
  --     bg = { attribute = "bg", highlight = "TabLine" },
  --   },
  --   -- close_button_selected = {
  --   --   fg = {attribute='fg',highlight='TabLineSel'},
  --   --   bg ={attribute='bg',highlight='TabLineSel'}
  --   --   },
  --
  --   tab_selected = {
  --     fg = { attribute = "fg", highlight = "Normal" },
  --     bg = { attribute = "bg", highlight = "Normal" },
  --   },
  --   tab = {
  --     fg = { attribute = "fg", highlight = "TabLine" },
  --     bg = { attribute = "bg", highlight = "TabLine" },
  --   },
  --   tab_close = {
  --     -- fg = {attribute='fg',highlight='LspDiagnosticsDefaultError'},
  --     fg = { attribute = "fg", highlight = "TabLineSel" },
  --     bg = { attribute = "bg", highlight = "Normal" },
  --   },
  --
  --   duplicate_selected = {
  --     fg = { attribute = "fg", highlight = "TabLineSel" },
  --     bg = { attribute = "bg", highlight = "TabLineSel" },
  --     italic = true,
  --   },
  --   duplicate_visible = {
  --     fg = { attribute = "fg", highlight = "TabLine" },
  --     bg = { attribute = "bg", highlight = "TabLine" },
  --     italic = true,
  --   },
  --   duplicate = {
  --     fg = { attribute = "fg", highlight = "TabLine" },
  --     bg = { attribute = "bg", highlight = "TabLine" },
  --     italic = true,
  --   },
  --
  --   modified = {
  --     fg = { attribute = "fg", highlight = "TabLine" },
  --     bg = { attribute = "bg", highlight = "TabLine" },
  --   },
  --   modified_selected = {
  --     fg = { attribute = "fg", highlight = "Normal" },
  --     bg = { attribute = "bg", highlight = "Normal" },
  --   },
  --   modified_visible = {
  --     fg = { attribute = "fg", highlight = "TabLine" },
  --     bg = { attribute = "bg", highlight = "TabLine" },
  --   },
  --
  --   -- separator = {
  --   --   fg = { attribute = "bg", highlight = "TabLine" },
  --   --   bg = { attribute = "bg", highlight = "TabLine" },
  --   -- },
  --   -- separator_selected = {
  --   --   fg = { attribute = "bg", highlight = "Normal" },
  --   --   bg = { attribute = "bg", highlight = "Normal" },
  --   -- },
  --   -- separator_visible = {
  --   --   fg = {attribute='bg',highlight='TabLine'},
  --   --   bg = {attribute='bg',highlight='TabLine'}
  --   --   },
  --   indicator_selected = {
  --     fg = { attribute = "fg", highlight = "LspDiagnosticsDefaultHint" },
  --     bg = { attribute = "bg", highlight = "Normal" },
  --   },
  -- },

  highlights = {
    background = {
      fg = inactiveBuffer_fg,
      bg = inactiveBuffer_bg
    },
    fill = {
      bg = bar_bg,
      fg = inactiveBuffer_fg
    },
    tab = {
      bg = inactiveBuffer_bg,
      fg = inactiveBuffer_fg
    },
    -- focused window
    buffer_selected = {
      fg = activeBuffer_fg,
      bg = activeBuffer_bg,
      bold = true
    },
    tab_selected = {
      fg = activeBuffer_fg,
      bg = activeBuffer_bg,
      bold = true
    },
    duplicate_selected = {
      fg = inactiveBuffer_fg,
      bg = activeBuffer_bg,
    },
    separator_selected = {
      fg = bar_bg,
      bg = activeBuffer_bg
    },
    -- unfocused opened window
    buffer_visible = {
      bg = inactiveBuffer_bg,
      fg = visibleBuffer_fg
    },
    close_button = {
      bg = inactiveBuffer_bg,
      fg = inactiveBuffer_fg
    },
    close_button_visible = {
      bg = inactiveBuffer_bg,
      fg = visibleBuffer_fg
    },
    close_button_selected = {
      fg = activeBuffer_fg,
      bg = activeBuffer_bg,
      bold = true
    },
    duplicate_visible = {
      fg = duplicate_fg,
      bg = inactiveBuffer_bg,
    },
    separator_visible = {
      bg = inactiveBuffer_bg,
      fg = bar_bg
    },
    duplicate = {
      fg = duplicate_fg,
      bg = inactiveBuffer_bg,
    },
    separator = {
      bg = inactiveBuffer_bg,
      fg = bar_bg
    },
    indicator_selected = {
      fg = activeBuffer_fg,
      bg = activeBuffer_bg
    },
    modified_selected = {
      fg = modified_fg,
      bg = activeBuffer_bg
    },
    modified_visible = {
      fg = modified_fg,
      bg = inactiveBuffer_bg
    },
    modified = {
      fg = modified_fg,
      bg = inactiveBuffer_bg
    },
    info_selected = {
      fg = activeBuffer_fg,
      bg = activeBuffer_bg,
      undercurl = true,
      sp = info_fg
    },
    info_visible = {
      fg = visibleBuffer_fg,
      bg = inactiveBuffer_bg,
      undercurl = true,
      sp = info_fg
    },
    info = {
      fg = inactiveBuffer_fg,
      bg = inactiveBuffer_bg,
      undercurl = true,
      sp = info_fg
    },
    info_diagnostic_selected = {
      fg = info_fg,
      bg = activeBuffer_bg,
      bold = true
    },
    info_diagnostic_visible = {
      fg = info_fg,
      bg = inactiveBuffer_bg,
      bold = true
    },
    info_diagnostic = {
      fg = info_fg,
      bg = inactiveBuffer_bg,
    },
    warning_selected = {
      fg = activeBuffer_fg,
      bg = activeBuffer_bg,
      undercurl = true,
      sp = warning_fg
    },
    warning_visible = {
      fg = visibleBuffer_fg,
      bg = inactiveBuffer_bg,
      undercurl = true,
      sp = warning_fg
    },
    warning = {
      fg = inactiveBuffer_fg,
      bg = inactiveBuffer_bg,
      undercurl = true,
      sp = warning_fg
    },
    warning_diagnostic_selected = {
      fg = warning_fg,
      bg = activeBuffer_bg,
      bold = true
    },
    warning_diagnostic_visible = {
      fg = warning_fg,
      bg = inactiveBuffer_bg,
      bold = true
    },
    warning_diagnostic = {
      fg = warning_fg,
      bg = inactiveBuffer_bg,
    },
    error_selected = {
      fg = activeBuffer_fg,
      bg = activeBuffer_bg,
      undercurl = true,
      sp = error_fg
    },
    error_visible = {
      fg = visibleBuffer_fg,
      bg = inactiveBuffer_bg,
      undercurl = true,
      sp = error_fg
    },
    error = {
      fg = inactiveBuffer_fg,
      bg = inactiveBuffer_bg,
      undercurl = true,
      sp = error_fg
    },
    error_diagnostic_selected = {
      fg = error_fg,
      bg = activeBuffer_bg,
      bold = true
    },
    error_diagnostic_visible = {
      fg = error_fg,
      bg = inactiveBuffer_bg,
      bold = true
    },
    error_diagnostic = {
      fg = error_fg,
      bg = inactiveBuffer_bg,
    }
  }
}

