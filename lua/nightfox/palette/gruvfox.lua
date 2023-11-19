local C = require("nightfox.lib.color")
local Shade = require("nightfox.lib.shade")

-- Reference:
-- - https://www.reddit.com/r/Art/comments/drlbdi/cozy_autumn_rain_jeff_östberg_x_genevieve_lacroix/?utm_source=share&utm_medium=web2x&context=3
-- - https://torako.wakarimasen.moe/file/torako/wg/image/1622/83/1622838138777.jpg

local meta = {
  name = "gruvfox",
  light = false,
}

local bg = C("#1d2021")
local fg = C("#d4be98")

-- stylua: ignore
local palette = {
  black   = Shade.new("#0d0e0f", 0.15, -0.15),
  red     = Shade.new("#fb4934", "#cc241d", -0.15),
  green   = Shade.new("#b8bb26", "#98971a", -0.15),
  yellow  = Shade.new("#fabd2f", "#d79921", -0.15),
  blue    = Shade.new("#83a598", "#458588", -0.15),
  magenta = Shade.new("#d3869b", "#b16286", -0.15),
  cyan    = Shade.new("#8ec07c", "#689d6a", -0.15),
  white   = Shade.new("#fbf1c7", 0.15, -0.15),
  orange  = Shade.new("#fe8019", "#d65d0e", -0.15),
  pink    = Shade.new("#d4879c", 0.15, -0.15),

  comment = "#928374",

  bg0     = bg:brighten(-4):to_css(), -- Dark bg (status line and float)
  bg1     = "#1d2021",                -- Default bg
  bg2     = "#282828",                -- Lighter bg (colorcolm folds)
  bg3     = "#3c3836",                -- Lighter bg (cursor line)
  bg4     = "#7c6f64",                -- Conceal, border fg

  fg0     = "#fbf1c7",                -- Lighter fg
  fg1     = "#ebdbb2",                -- Default fg
  fg2     = "#d5c4a1",                -- Darker fg (status line)
  -- fg3     = "#bdae93",                -- Darker fg (line numbers, fold colums)
  fg3     = "#7c6f64",                -- Darker fg (line numbers, fold colums)

  sel0    = "#504945",                -- Popup bg, visual selection bg
  sel1    = "#504945",                -- Popup sel bg, search bg
}

local function generate_spec(pal)
  -- stylua: ignore start
  local spec = {
    bg0  = pal.bg0,  -- Dark bg (status line and float)
    bg1  = pal.bg1,  -- Default bg
    bg2  = pal.bg2,  -- Lighter bg (colorcolm folds)
    bg3  = pal.bg3,  -- Lighter bg (cursor line)
    bg4  = pal.bg4,  -- Conceal, border fg

    fg0  = pal.fg0,  -- Lighter fg
    fg1  = pal.fg1,  -- Default fg
    fg2  = pal.fg2,  -- Darker fg (status line)
    fg3  = pal.fg3,  -- Darker fg (line numbers, fold colums)

    sel0 = pal.sel0, -- Popup bg, visual selection bg
    sel1 = pal.sel1, -- Popup sel bg, search bg
  }

  spec.syntax = {
    bracket     = pal.orange.base,  -- Brackets and Punctuation
    builtin0    = pal.red.base,     -- Builtin variable
    builtin1    = pal.cyan.base,    -- Builtin type
    builtin2    = pal.magenta.base, -- Builtin const
    builtin3    = pal.red.base,     -- Not used
    comment     = pal.comment,      -- Comment
    conditional = pal.magenta.base, -- Conditional and loop
    const       = pal.magenta.base, -- Constants, imports and booleans
    dep         = spec.fg3,         -- Deprecated
    field       = pal.blue.base,    -- Field
    func        = pal.green.base,   -- Functions and Titles
    ident       = spec.fg1,         -- Identifiers
    keyword     = pal.red.base,     -- Keywords
    number      = pal.magenta.base, -- Numbers
    operator    = pal.magenta.base, -- Operators
    preproc     = pal.pink.base,    -- PreProc
    regex       = pal.yellow.base,  -- Regex
    statement   = pal.magenta.base, -- Statements
    string      = pal.green.base,   -- Strings
    type        = pal.yellow.base,  -- Types
    variable    = pal.white.base,   -- Variables
  }

  spec.diag = {
    error = pal.red.base,
    warn  = pal.orange.base,
    info  = pal.cyan.base,
    hint  = pal.blue.base,
    ok    = pal.blue.base,
  }

  spec.diag_bg = {
    error = C(spec.bg1):blend(C(spec.diag.error), 0.15):to_css(),
    warn  = C(spec.bg1):blend(C(spec.diag.warn), 0.15):to_css(),
    info  = C(spec.bg1):blend(C(spec.diag.info), 0.15):to_css(),
    hint  = C(spec.bg1):blend(C(spec.diag.hint), 0.15):to_css(),
    ok    = C(spec.bg1):blend(C(spec.diag.ok), 0.15):to_css(),
  }

  spec.diff = {
    add    = C(spec.bg1):blend(C(pal.green.base), 0.2):to_css(),
    delete = C(spec.bg1):blend(C(pal.red.base), 0.25):to_css(),
    change = C(spec.bg1):blend(C(pal.cyan.base), 0.2):to_css(),
    text   = C(spec.bg1):blend(C(pal.cyan.base), 0.35):to_css(),
  }

  spec.git = {
    add      = pal.green.base,
    removed  = pal.red.base,
    changed  = pal.yellow.base,
    conflict = pal.orange.base,
    ignored  = pal.comment,
  }

  -- stylua: ignore end

  return spec
end

return { meta = meta, palette = palette, generate_spec = generate_spec }
