local lush = require "lush"
local hsl = lush.hsl

-- Palette
local p = {
	fg0 = hsl("#d4be98"),
	fg1= hsl("#ddc7a1"),

	bg0 = hsl("#282828"),
	bg1 = hsl("#32302f"),
	bg2 = hsl("#32302f"),
	bg3 = hsl("#45403d"),
	bg4 = hsl("#45403d"),
	bg5 = hsl("#5a524c"),

	none = nil,
	red = hsl("#ea6962"),
	orange = hsl("#e78a4e"),
	yellow = hsl("#d8a657"),
	green = hsl("#a9b665"),
	aqua = hsl("#89b482"),
	blue = hsl("#7daea3"),
	purple = hsl("#d3869b"),

	gray0 = hsl("#7c6f64"),
	gray1 = hsl("#928374"),
	gray2 = hsl("#a89984"),

	bg_diff_green = hsl("#32361a"),
	bg_visual_green = hsl("#3b4439"),
	bg_diff_red = hsl("#402120"),
	bg_visual_red = hsl("#4c3432"),
	bg_diff_blue = hsl("#0e363e"),
	bg_visual_blue = hsl("#374141"),
	bg_visual_yellow = hsl("#4f422e"),
	bg_current_word = hsl("#3c3836"),
	bg_statusline1 = hsl("#282828"),
	bg_statusline2 = hsl("#32302f"),
	bg_statusline3 = hsl("#504945"),
}

local theme = lush(function()
  return {
    Normal { fg = p.fg0, bg = p.bg0 }, -- normal text
    NormalFloat  { fg = p.fg1, bg = p.bg3 }, -- Normal text in floating windows.
    ColorColumn  { fg = p.none, bg = p.bg2 }, -- used for the columns set with 'colorcolumn'
    Conceal      { fg = p.bg5, bg = p.none }, -- placeholder characters substituted for concealed text (see 'conceallevel')
		-- Cursors
    Cursor       { fg = Normal.bg, bg = Normal.bg }, -- character under the cursor
    lCursor      { Cursor }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM     { Cursor }, -- like Cursor, but used when in IME mode |CursorIM|
    TermCursor   { Cursor }, -- cursor in a focused terminal
    TermCursorNC { Cursor }, -- cursor in an unfocused terminal

    Directory    { fg = p.green, bg = p.none }, -- directory names (and other special names in listings)

		-- Diff
    DiffAdd      { fg = p.none, bg = p.bg_diff_green }, -- diff mode: Added line |diff.txt|
    DiffChange   { fg = p.none, bg = p.bg_diff_blue }, -- diff mode: Changed line |diff.txt|
    DiffDelete   { fg = p.none, bg = p.bg_diff_red }, -- diff mode: Deleted line |diff.txt|
    DiffText     { fg = Normal.bg, bg = p.blue }, -- diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer  { fg = p.bg5, bg = p.none }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.

    ErrorMsg     { fg = p.red, bg = p.none, gui = "bold" }, -- error messages on the command line
    VertSplit    { fg = p.bg5, bg = p.none }, -- the column separating vertically split windows
    Folded       { fg = p.gray1, bg = p.none }, -- line used for closed folds
    FoldColumn   { fg = p.bg5, bg = p.none }, -- 'foldcolumn'
    SignColumn   { fg = Normal.fg, bg = p.none }, -- column where |signs| are displayed
    Substitute   { fg = Normal.bg, bg = p.yellow }, -- |:substitute| replacement text highlighting
    MatchParen   { fg = p.none, bg = p.bg4 }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg      { fg = Normal.fg, bg = p.none, gui = "bold" }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgSeparator { Statusline }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg      { fg = p.yellow, bg = p.none, gui = "bold"}, -- |more-prompt|
    NonText      { fg = p.bg5, bg = p.none }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.

    Pmenu        { fg = Normal.fg, bg = p.bg3 }, -- Popup menu: normal item.
    PmenuSel     { fg = Pmenu.bg, bg = p.gray2 }, -- Popup menu: selected item.
    PmenuSbar    { fg = p.none, bg = Pmenu.bg }, -- Popup menu: scrollbar.
    PmenuThumb   { fg = p.none, bg = p.gray0 }, -- Popup menu: Thumb of the scrollbar.

    Question     { fg = p.yellow, bg = p.none }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine { fg = p.purple, bg = p.none, gui = "bold" }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    SpecialKey   { fg = p.bg5, bg = p.none }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace| 

    SpellBad     { fg = p.none, bg = p.none, gui = "undercurl"}, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise. 
    SpellCap     { SpellBad }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise. 
    SpellLocal   { SpellBad }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare    { SpellBad }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.

    StatusLine   { fg = p.gray2, bg = p.bg_statusline }, -- status line of current window
    -- StatusLineNC { }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    -- TabLine      { }, -- tab pages line, not active tab page label
    -- TabLineFill  { }, -- tab pages line, where there are no labels
    -- TabLineSel   { }, -- tab pages line, active tab page label
    -- Title        { }, -- titles for output from ":set all", ":autocmd" etc.
    -- Visual       { }, -- Visual mode selection
    -- VisualNOS    { }, -- Visual mode selection when vim is "Not Owning the Selection".
    -- WarningMsg   { }, -- warning messages
    -- Whitespace   { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    -- WildMenu     { }, -- current match in 'wildmenu' completion

    -- These groups are not listed as default vim groups,
    -- but they are defacto standard group names for syntax highlighting.
    -- commented out groups should chain up to their "preferred" group by
    -- default,
    -- Uncomment and edit if you want more specific syntax highlighting.

    -- Constant       { }, -- (preferred) any constant
    -- String         { }, --   a string constant: "this is a string"
    -- Character      { }, --  a character constant: 'c', '\n'
    -- Number         { }, --   a number constant: 234, 0xff
    -- Boolean        { }, --  a boolean constant: TRUE, false
    -- Float          { }, --    a floating point constant: 2.3e10

    -- Identifier     { }, -- (preferred) any variable name
    -- Function       { }, -- function name (also: methods for classes)

    -- Statement      { }, -- (preferred) any statement
    -- Conditional    { }, --  if, then, else, endif, switch, etc.
    -- Repeat         { }, --   for, do, while, etc.
    -- Label          { }, --    case, default, etc.
    -- Operator       { }, -- "sizeof", "+", "*", etc.
    -- Keyword        { }, --  any other keyword
    -- Exception      { }, --  try, catch, throw

    -- PreProc        { }, -- (preferred) generic Preprocessor
    -- Include        { }, --  preprocessor #include
    -- Define         { }, --   preprocessor #define
    -- Macro          { }, --    same as Define
    -- PreCondit      { }, --  preprocessor #if, #else, #endif, etc.

    -- Type           { }, -- (preferred) int, long, char, etc.
    -- StorageClass   { }, -- static, register, volatile, etc.
    -- Structure      { }, --  struct, union, enum, etc.
    -- Typedef        { }, --  A typedef

    -- Special        { }, -- (preferred) any special symbol
    -- SpecialChar    { }, --  special character in a constant
    -- Tag            { }, --    you can use CTRL-] on this
    -- Delimiter      { }, --  character that needs attention
    -- SpecialComment { }, -- special things inside a comment
    -- Debug          { }, --    debugging statements

    -- Underlined { gui = "underline" }, -- (preferred) text that stands out, HTML links
    -- Bold       { gui = "bold" },
    -- Italic     { gui = "italic" },

    -- ("Ignore", below, may be invisible...)
    -- Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|

    -- Error          { }, -- (preferred) any erroneous construct

    -- Todo           { }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client. Some other LSP clients may use
    -- these groups, or use their own. Consult your LSP client's documentation.

    -- LspDiagnosticsError               { }, -- used for "Error" diagnostic virtual text
    -- LspDiagnosticsErrorSign           { }, -- used for "Error" diagnostic signs in sign column
    -- LspDiagnosticsErrorFloating       { }, -- used for "Error" diagnostic messages in the diagnostics float
    -- LspDiagnosticsWarning             { }, -- used for "Warning" diagnostic virtual text
    -- LspDiagnosticsWarningSign         { }, -- used for "Warning" diagnostic signs in sign column
    -- LspDiagnosticsWarningFloating     { }, -- used for "Warning" diagnostic messages in the diagnostics float
    -- LspDiagnosticsInformation         { }, -- used for "Information" diagnostic virtual text
    -- LspDiagnosticsInformationSign     { }, -- used for "Information" signs in sign column
    -- LspDiagnosticsInformationFloating { }, -- used for "Information" diagnostic messages in the diagnostics float
    -- LspDiagnosticsHint                { }, -- used for "Hint" diagnostic virtual text
    -- LspDiagnosticsHintSign            { }, -- used for "Hint" diagnostic signs in sign column
    -- LspDiagnosticsHintFloating        { }, -- used for "Hint" diagnostic messages in the diagnostics float
    -- LspReferenceText                  { }, -- used for highlighting "text" references
    -- LspReferenceRead                  { }, -- used for highlighting "read" references
    -- LspReferenceWrite                 { }, -- used for highlighting "write" references

    -- These groups are for the neovim tree-sitter highlights.
    -- As of writing, tree-sitter support is a WIP, group names may change.
    -- By default, most of these groups link to an appropriate Vim group,
    -- TSError -> Error for example, so you do not have to define these unless
    -- you explicitly want to support Treesitter's improved syntax awareness.

    -- TSError              { }, -- For syntax/parser errors.
    -- TSPunctDelimiter     { }, -- For delimiters ie: `.`
    -- TSPunctBracket       { }, -- For brackets and parens.
    -- TSPunctSpecial       { }, -- For special punctutation that does not fall in the catagories before.
    -- TSConstant           { }, -- For constants
    -- TSConstBuiltin       { }, -- For constant that are built in the language: `nil` in Lua.
    -- TSConstMacro         { }, -- For constants that are defined by macros: `NULL` in C.
    -- TSString             { }, -- For strings.
    -- TSStringRegex        { }, -- For regexes.
    -- TSStringEscape       { }, -- For escape characters within a string.
    -- TSCharacter          { }, -- For characters.
    -- TSNumber             { }, -- For integers.
    -- TSBoolean            { }, -- For booleans.
    -- TSFloat              { }, -- For floats.
    -- TSFunction           { }, -- For function (calls and definitions).
    -- TSFuncBuiltin        { }, -- For builtin functions: `table.insert` in Lua.
    -- TSFuncMacro          { }, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
    -- TSParameter          { }, -- For parameters of a function.
    -- TSParameterReference { }, -- For references to parameters of a function.
    -- TSMethod             { }, -- For method calls and definitions.
    -- TSField              { }, -- For fields.
    -- TSProperty           { }, -- Same as `TSField`.
    -- TSConstructor        { }, -- For constructor calls and definitions: `                                                                       { }` in Lua, and Java constructors.
    -- TSConditional        { }, -- For keywords related to conditionnals.
    -- TSRepeat             { }, -- For keywords related to loops.
    -- TSLabel              { }, -- For labels: `label:` in C and `:label:` in Lua.
    -- TSOperator           { }, -- For any operator: `+`, but also `->` and `*` in C.
    -- TSKeyword            { }, -- For keywords that don't fall in previous categories.
    -- TSKeywordFunction    { }, -- For keywords used to define a fuction.
    -- TSException          { }, -- For exception related keywords.
    -- TSType               { }, -- For types.
    -- TSTypeBuiltin        { }, -- For builtin types (you guessed it, right ?).
    -- TSNamespace          { }, -- For identifiers referring to modules and namespaces.
    -- TSInclude            { }, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
    -- TSAnnotation         { }, -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
    -- TSText               { }, -- For strings considered text in a markup language.
    -- TSStrong             { }, -- For text to be represented with strong.
    -- TSEmphasis           { }, -- For text to be represented with emphasis.
    -- TSUnderline          { }, -- For text to be represented with an underline.
    -- TSTitle              { }, -- Text that is part of a title.
    -- TSLiteral            { }, -- Literal text.
    -- TSURI                { }, -- Any URI like a link or email.
    -- TSVariable           { }, -- Any variable name that does not have another highlight.
    -- TSVariableBuiltin    { }, -- Variable names that are defined by the languages, like `this` or `self`.
  }
end)

return theme

