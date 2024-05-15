local function starts_with(str, prefix)
  return (string.sub(str, 1, #prefix) == prefix)
end
local function hex__3ergb(hex)
  local parse_slice
  local function _1_(start, _end)
    local slice = hex:sub(start, _end)
    return tonumber(slice, 16)
  end
  parse_slice = _1_
  local r = parse_slice(2, 3)
  local g = parse_slice(4, 5)
  local b = parse_slice(6, 7)
  return {r, g, b}
end
local function rgb__3ehex(_2_)
  local _arg_3_ = _2_
  local r = _arg_3_[1]
  local g = _arg_3_[2]
  local b = _arg_3_[3]
  return string.format("#%02x%02x%02x", r, g, b)
end
local function clamp(val)
  return math.min(math.max(val, 0), 255)
end
local function add_rgb(_4_, _6_)
  local _arg_5_ = _4_
  local r1 = _arg_5_[1]
  local g1 = _arg_5_[2]
  local b1 = _arg_5_[3]
  local _arg_7_ = _6_
  local r2 = _arg_7_[1]
  local g2 = _arg_7_[2]
  local b2 = _arg_7_[3]
  local add_channel
  local function _8_(_241, _242)
    return clamp((_241 + _242))
  end
  add_channel = _8_
  return {add_channel(r1, r2), add_channel(g1, g2), add_channel(b1, b2)}
end
local function scale_rgb(_9_, weight)
  local _arg_10_ = _9_
  local r = _arg_10_[1]
  local g = _arg_10_[2]
  local b = _arg_10_[3]
  local scale_channel
  local function _11_(_241)
    return clamp((weight * _241))
  end
  scale_channel = _11_
  return {scale_channel(r), scale_channel(g), scale_channel(b)}
end
local function scale(color, weight)
  local rgb = hex__3ergb(color)
  return rgb__3ehex(scale_rgb(rgb, weight))
end
local function mix(color1, color2, weight)
  local rgb1 = hex__3ergb(color1)
  local rgb2 = hex__3ergb(color2)
  return rgb__3ehex(add_rgb(scale_rgb(rgb1, weight), scale_rgb(rgb2, (1 - weight))))
end
local function lighten(color, weight)
  return scale(color, (1 + weight))
end
local function darken(color, weight)
  return scale(color, (1 - weight))
end
local function hi_21(name, opts)
  return vim.api.nvim_set_hl(0, name, opts)
end
local function set_highlights(c)
  if (nil == c) then
    error("set base16 colors before setting the colorscheme")
  else
  end
  vim.cmd("syntax reset")
  vim.cmd("highlight clear")
  vim.g.colors_name = "base16"
  hi_21("Conceal", {bg = c.base01})
  hi_21("Cursor", {fg = c.base00, bg = c.base05})
  hi_21("CursorColumn", {bg = c.base01})
  hi_21("CursorLine", {bg = darken(c.base01, 0.05), cterm = nil})
  hi_21("Directory", {fg = c.base0C})
  hi_21("DiffAdd", {bg = darken(c.base0D, 0.5)})
  hi_21("DiffChange", {bg = darken(c.base0E, 0.5)})
  hi_21("DiffDelete", {bg = darken(c.base0C, 0.5)})
  hi_21("DiffText", {bg = darken(c.base08, 0.5)})
  hi_21("ErrorMsg", {fg = c.base05, bg = c.base08})
  hi_21("WinSeparator", {fg = c.base05, cterm = nil})
  hi_21("Folded", {bg = c.base01})
  hi_21("FoldColumn", {bg = c.base01})
  hi_21("SignColumn", {bg = c.base02})
  hi_21("LineNr", {fg = c.base03})
  hi_21("CursorLineNr", {fg = c.base0F, cterm = nil})
  hi_21("MatchParen", {fg = c.base00, bg = c.base0C})
  hi_21("ModeMsg", {bold = true})
  hi_21("MoreMsg", {fg = c.base09})
  hi_21("NonText", {fg = c.base01})
  hi_21("Normal", {fg = c.base05})
  hi_21("NormalFloat", {fg = darken(c.base0A, 0.15), bg = c.base00})
  hi_21("FloatBorder", {fg = mix(c.base0A, c.base03, 0.4)})
  hi_21("Pmenu", {fg = darken(c.base0A, 0.15), bg = c.base01})
  hi_21("PmenuSel", {fg = c.base00, bg = darken(c.base0A, 0.15)})
  hi_21("PmenuSbar", {bg = c.base02})
  hi_21("PmenuThumb", {bg = lighten(c.base03, 0.5)})
  hi_21("Question", {fg = c.base0B})
  hi_21("Search", {fg = c.base00, bg = c.base0A})
  hi_21("SpecialKey", {fg = c.base0C})
  hi_21("SpellCap", {bg = c.base03})
  hi_21("StatusLine", {fg = c.base03, bg = c.base0B, bold = true, reverse = true})
  hi_21("StatusLineNC", {fg = c.base03, bg = mix(c.base00, c.base0B, 0.2), bold = true, reverse = true})
  hi_21("TabLine", {bg = c.base01})
  hi_21("Title", {fg = c.base0E})
  hi_21("Visual", {bg = c.base03})
  hi_21("WarningMsg", {fg = c.base08})
  hi_21("WildMenu", {fg = c.base00, bg = c.base0A})
  hi_21("Comment", {fg = lighten(c.base03, 0.2)})
  hi_21("Constant", {fg = c.base0E})
  hi_21("String", {link = "Constant"})
  hi_21("Character", {link = "Constant"})
  hi_21("Number", {link = "Constant"})
  hi_21("Boolean", {link = "Constant"})
  hi_21("Float", {link = "Constant"})
  hi_21("Identifier", {fg = c.base0C, bold = true})
  hi_21("Function", {link = "Identifier"})
  hi_21("Statement", {fg = c.base0A})
  hi_21("Conditional", {link = "Statement"})
  hi_21("Repeat", {link = "Statement"})
  hi_21("Label", {link = "Statement"})
  hi_21("Operator", {link = "Statement"})
  hi_21("Keyword", {link = "Statement"})
  hi_21("Exception", {link = "Statement"})
  hi_21("PreProc", {fg = c.base0D})
  hi_21("Include", {link = "PreProc"})
  hi_21("Define", {link = "PreProc"})
  hi_21("Macro", {link = "PreProc"})
  hi_21("PreCondit", {link = "PreProc"})
  hi_21("Type", {fg = c.base0B})
  hi_21("StorageClass", {link = "Type"})
  hi_21("Structure", {link = "Type"})
  hi_21("Typedev", {link = "Type"})
  hi_21("Special", {fg = c.base0F})
  hi_21("SpecialChar", {link = "Special"})
  hi_21("Tag", {link = "Special"})
  hi_21("Delimiter", {link = "Special"})
  hi_21("SpecialComment", {link = "Special"})
  hi_21("Debug", {link = "Special"})
  hi_21("Underlined", {fg = c.base0D})
  hi_21("Ignore", {fg = c.base0F})
  hi_21("Todo", {fg = c.base00, bg = c.base0A})
  hi_21("Error", {fg = c.base08, bg = c.base00})
  hi_21("DiagnosticError", {fg = c.base08, bg = c.base00})
  hi_21("DiagnosticHint", {fg = c.base0D, bg = c.base00})
  hi_21("DiagnosticInfo", {fg = c.base0B, bg = c.base00})
  hi_21("DiagnosticWarn", {fg = c.base09, bg = c.base00})
  hi_21("DiagnosticSignError", {fg = c.base08, bg = c.base00})
  hi_21("DiagnosticSignHint", {fg = c.base0D, bg = c.base00})
  hi_21("DiagnosticSignInfo", {fg = c.base0B, bg = c.base00})
  hi_21("DiagnosticSignWarn", {fg = c.base09, bg = c.base00})
  hi_21("@annotation", {link = "PreProc"})
  hi_21("@attribute", {link = "PreProc"})
  hi_21("@boolean", {link = "Boolean"})
  hi_21("@character", {link = "Character"})
  hi_21("@character.special", {link = "SpecialChar"})
  hi_21("@comment", {link = "Comment"})
  hi_21("@keyword.conditional", {link = "Conditional"})
  hi_21("@constant", {link = "Constant"})
  hi_21("@constant.builtin", {link = "Special"})
  hi_21("@constant.macro", {link = "Define"})
  hi_21("@keyword.debug", {link = "Debug"})
  hi_21("@keyword.directive.define", {link = "Define"})
  hi_21("@keyword.exception", {link = "Exception"})
  hi_21("@number.float", {link = "Float"})
  hi_21("@function", {link = "Function"})
  hi_21("@function.builtin", {link = "Special"})
  hi_21("@function.call", {link = "@function"})
  hi_21("@function.macro", {link = "Macro"})
  hi_21("@keyword.import", {link = "Include"})
  hi_21("@keyword.coroutine", {link = "@keyword"})
  hi_21("@keyword.operator", {link = "@operator"})
  hi_21("@keyword.return", {link = "@keyword"})
  hi_21("@function.method", {link = "Function"})
  hi_21("@function.method.call", {link = "@function.method"})
  hi_21("@namespace.builtin", {link = "@variable.builtin"})
  hi_21("@none", {})
  hi_21("@number", {link = "Number"})
  hi_21("@keyword.directive", {link = "PreProc"})
  hi_21("@keyword.repeat", {link = "Repeat"})
  hi_21("@keyword.storage", {link = "StorageClass"})
  hi_21("@string", {link = "String"})
  hi_21("@markup.link.label", {link = "SpecialChar"})
  hi_21("@markup.link.label.symbol", {link = "Identifier"})
  hi_21("@tag", {link = "Label"})
  hi_21("@tag.attribute", {link = "@property"})
  hi_21("@tag.delimiter", {link = "Delimiter"})
  hi_21("@markup", {link = "@none"})
  hi_21("@markup.environment", {link = "Macro"})
  hi_21("@markup.environment.name", {link = "Type"})
  hi_21("@markup.raw", {link = "String"})
  hi_21("@markup.math", {link = "Special"})
  hi_21("@markup.strong", {bold = true})
  hi_21("@markup.emphasis", {italic = true})
  hi_21("@markup.strikethrough", {strikethrough = true})
  hi_21("@markup.underline", {underline = true})
  hi_21("@markup.heading", {link = "Title"})
  hi_21("@comment.note", {fg = c.hint})
  hi_21("@comment.error", {fg = c.error})
  hi_21("@comment.hint", {fg = c.hint})
  hi_21("@comment.info", {fg = c.info})
  hi_21("@comment.warning", {fg = c.warning})
  hi_21("@comment.todo", {fg = c.todo})
  hi_21("@markup.link.url", {link = "Underlined"})
  hi_21("@type", {link = "Type"})
  hi_21("@type.definition", {link = "Typedef"})
  hi_21("@type.qualifier", {link = "@keyword"})
  hi_21("LeapLabelPrimary", {fg = c.base00, bg = c.base08, nocombine = true})
  hi_21("LeapLabelSecondary", {fg = c.base00, bg = lighten(c.base0C, 0.1), nocombine = true})
  return hi_21("LeapMatch", {fg = lighten(c.base0B, 0.1), bg = c.base00, underline = true, nocombine = true})
end
return {["set-highlights"] = set_highlights}
