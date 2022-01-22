local lush = require "lush"
local hsl = lush.hsl

---@diagnostic disable: undefined-global
local theme = lush(function()
	return {
		ColorColumn     { bg = hsl("#586e74") }, -- used for the columns set with 'colorcolumn'
		-- Conceal      { }, -- placeholder characters substituted for concealed text (see 'conceallevel')
		-- Cursor       { }, -- character under the cursor
		-- lCursor      { }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
		-- CursorColumn { }, -- screen-column at the cursor, when 'cursorcolumn' is set.
		CursorLine      { }, -- screen-line at the cursor, when 'cursorline' is set.
		-- Directory       { gui = "bold", fg = hsl("#ffffff") }, -- directory names (and other special names in listings)
		-- DiffAdd      { }, -- diff mode: Added line |diff.txt|
		-- DiffChange   { }, -- diff mode: Changed line |diff.txt|
		-- DiffDelete   { }, -- diff mode: Deleted line |diff.txt|
		-- DiffText     { }, -- diff mode: Changed text within a changed line |diff.txt|
		EndOfBuffer     { fg = "none" }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
		-- TermCursor   { }, -- cursor in a focused terminal
		-- TermCursorNC { }, -- cursor in an unfocused terminal
		-- ErrorMsg     { }, -- error messages on the command line
		-- VertSplit       { fg = "reverse", bg = "none" }, -- the column separating vertically split windows
		Folded          { fg = hsl("#586e75")         }, -- line used for closed folds
		-- FoldColumn   { }, -- 'foldcolumn'
		SignColumn      { bg = hsl("#586e75") }, -- column where |signs| are displayed
		-- IncSearch    { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		-- Substitute   { }, -- |:substitute| replacement text highlighting
		LineNr          { fg = hsl("#586e75") }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		CursorLineNr    { gui = "bold"        }, -- Like LineNr when 'cursorline' is set and 'cursorlineopt' contains "number" or is "both", for the cursor line.
		-- MatchParen   { }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		-- ModeMsg      { }, -- 'showmode' message (e.g., "-- INSERT -- ")
		-- MsgArea      { }, -- Area for messages and cmdline
		-- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
		-- MoreMsg      { }, -- |more-prompt|
		NonText         { fg = hsl("#586e75") }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		-- Normal       { }, -- normal text
		-- NormalNC     { }, -- normal text in non-current windows
		Pmenu           { fg = Normal.fg, bg = hsl("#31353f") }, -- Popup menu: normal item.
		PmenuSel        { gui = "reverse", Pmenu              }, -- Popup menu: selected item.
		PmenuSbar       { bg = Pmenu.bg.darken(25)            }, -- Popup menu: scrollbar.
		PmenuThumb      { bg = Pmenu.bg                       }, -- Popup menu: Thumb of the scrollbar.
		-- Question     { }, -- |hit-enter| prompt and yes/no questions
		-- QuickFixLine { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		-- Search       { }, -- Last search pattern highlighting.
		-- SpecialKey   { }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
		-- SpellBad     { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		-- SpellCap     { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		-- SpellLocal   { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		-- SpellRare    { }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
		-- StatusLine   { }, -- status line of current window
		-- StatusLineNC { }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		-- TabLine      { }, -- tab pages line, not active tab page label
		-- TabLineFill  { }, -- tab pages line, where there are no labels
		-- TabLineSel   { }, -- tab pages line, active tab page label
		Title        { gui = "bold", fg = hsl("#f5f65e") }, -- titles for output from ":set all", ":autocmd" etc.
		Visual          { fg = hsl("#002b36"), bg = hsl("#586e75") }, -- Visual mode selection
		-- VisualNOS    { }, -- Visual mode selection when vim is "Not Owning the Selection".
		-- WarningMsg   { }, -- warning messages
		-- Whitespace   { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		-- WildMenu     { }, -- current match in 'wildmenu' completion

		Comment	{ fg = hsl("#586e75") }, -- any comment

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

		-- Underlined { }, -- (preferred) text that stands out, HTML links
		-- Bold       { },
		-- Italic     { },

		-- ("Ignore", below, may be invisible...)
		-- Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|

		-- Error          { }, -- (preferred) any erroneous construct

		Todo           { fg = hsl("#40ffff"), gui = "bold" }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		-- DiagnosticError            { fg = "red" }, -- used as the base highlight group.
		-- DiagnosticVirtualTextError { }, -- used for "Error" diagnostic virtual text.
		-- DiagnosticUnderlineError   { }, -- used to underline "Error" diagnostics.
		-- DiagnosticFloatingError    { },
		-- DiagnosticSignError        { },

		-- DiagnosticWarn             { }, -- used as the base highlight group.
		-- DiagnosticVirtualTextWarn  { }, -- used for "Warn" diagnostic virtual text.
		-- DiagnosticUnderlineWarn    { }, -- used to underline "Warn" diagnostics.
		-- DiagnosticFloatWarn        { },
		-- DiagnosticSignWarn         { },

		-- DiagnosticInfo             { }, -- used as the base highlight group.
		-- DiagnosticVirtualTextInfo  { }, -- used for "Info" diagnostic virtual text.
		-- DiagnosticUnderlineInfo    { }, -- used to underline "Info" diagnostics.
		-- DiagnosticFloatingInfo     { },
		-- DiagnosticSignInfo         { },

		-- DiagnosticHint             { }, -- used as the base highlight group.
		-- DiagnosticVirtualTextHint  { }, -- used for "Hint" diagnostic virtual text.
		-- DiagnosticUnderlineHint    { }, -- used to underline "Hint" diagnostics.
		-- DiagnosticFloatingHint     { },
		-- DiagnosticSignHint         { },

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
		TSURI                   { gui = "underline", fg = hsl("#586e75") }, -- Any URI like a link or email.
		-- TSVariable           { }, -- Any variable name that does not have another highlight.
		-- TSVariableBuiltin    { }, -- Variable names that are defined by the languages, like `this` or `self`.

		-- NvimTreeRootFolder { fg = hsl("#586e74") },
		-- NvimTreeSpecialFile { gui = "bold,underline", fg = hsl("#e5c07b") },
		TelescopeMatching { gui = "bold", fg = "orange" },

		gitcommitSummary { fg = "fg" },
	}
end)

return theme
