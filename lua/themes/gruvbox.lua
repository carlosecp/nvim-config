local lush = require "lush"
local hsl = lush.hsl

local p = {
	-- Interface
	fg = hsl("#d4be98"),
	bg = hsl("#282828"),
	hidden = hsl("#5a524c"), -- Color used in EndOfBuffer
	error = hsl("#ea6962"),
	float_bg = hsl("#45403d"),

	-- Syntax
	comment = hsl("#928374"),
	string = hsl("#a9b665")
}

local theme = lush(function()
  return {
		-- Interface
		Normal       { fg = p.fg, bg = p.bg },

    ColorColumn  { bg = hsl("#32302f") },
    Conceal      { bg = p.hidden },
    Cursor       { fg = Normal.bg, bg = Normal.fg },
		CursorColumn { bg = hsl("#32302f") },
		CursorLine   { CursorColumn },
    Directory    { fg = hsl("#a9b665") },
    DiffAdd      { bg = hsl("#34381b") },
    DiffChange   { bg = hsl("#0e363e") },
    DiffDelete   { bg = hsl("#402120") },
    DiffText     { fg = Normal.bg, bg = hsl("#7daea3") },
    EndOfBuffer  { fg = p.hidden, bg = Normal.bg },
		TermCursor   { Cursor },
		TermCursorNC { Cursor },
    ErrorMsg     { fg = p.error, gui = "bold,underline" },
    VertSplit    { fg = p.hidden },
    Folded       { fg = hsl("#928374"), bg = hsl("#32302f") },
    FoldColumn   { Folded },
    SignColumn   { fg = hsl("#d4be98"), bg = hsl("#32302f") },
		IncSearch    { fg = Normal.bg, bg = hsl("#ea6962") },
		Substitute   { fg = Normal.bg, bg = hsl("#d8a657")},
		LineNr       { fg = p.hidden },
		CursorLineNr { fg = hsl("#928374") },
    MatchParen   { bg = hsl("#45403d") },
    ModeMsg      { fg = hsl("#d4be98"), gui = "bold" },
    MoreMsg      { fg = hsl("#d8a657"), gui = ModeMsg.gui },
    NormalFloat  { fg = hsl("#ddc7a1"), bg = hsl("#45403d") },
    NonText      { fg = p.hidden },
    Pmenu        { fg = hsl("#ddc7a1"), bg = p.float_bg },
    PmenuSel     { fg = Pmenu.bg, bg = hsl("#a89984") },
    PmenuSbar    { bg = Pmenu.bg },
    PmenuThumb   { bg = hsl("#7c6f64") },
    Question     { fg = hsl("#d8a657") },
    QuickFixLine { fg = hsl("#d3869b"), gui = "bold" },
		Search { fg = Normal.bg, bg = hsl("#a9b665") },
    SpecialKey   { fg = p.hidden },
    SpellBad     { sp = hsl("#ea6962"), gui = "undercurl" },
    SpellCap     { sp = hsl("#7daea3"), gui = SpellBad.gui },
    SpellLocal   { sp = hsl("#89b482"), gui = SpellBad.gui },
    SpellRare    { sp = hsl("#d3869b"), gui = SpellBad.gui },
    StatusLine   { fg = hsl("#ddc7a1"), bg = hsl("#32302f") },
    StatusLineNC { fg = hsl("#928374"), bg = hsl("#32302f") },
		MsgSeparator { StatusLine },
    TabLine      { fg = hsl("#ddc7a1"), bg = hsl("#504945") },
    TabLineFill  { fg = hsl("#ddc7a1"), bg = hsl("#32302f") },
    TabLineSel   { fg = hsl("#282828"), bg = hsl("#a89984") },
    Title        { fg = hsl("#e78a4e"), gui = "bold" },
    Visual       { bg = hsl("#45403d") },
    VisualNOS    { Visual },
    WarningMsg   { fg = hsl("#d8a657"), gui = "bold" },
    Whitespace   { fg = p.hidden }, 
    WildMenu     { PmenuSel },

		-- Syntax
    Comment        { fg = p.comment, gui = "italic" },
    Constant       { fg = hsl("#89b482") },
    String         { fg = p.string },
    Character      { String },
    Number         { fg = hsl("#d3869b") },
    Boolean        { fg = hsl("#d3869b") },
    Float          { Number },
    Identifier     { fg = hsl("#7daea3") },
    Function       { fg = hsl("#a9b665") },
    Statement      { fg = hsl("#ea6962") },
    Conditional    { fg = hsl("#ea6962") },
    Repeat         { fg = hsl("#ea6962") },
    Label          { fg = hsl("#e78a4e") },
    Operator       { fg = hsl("#e78a4e") },
    Keyword        { fg = hsl("#ea6962") },
    Exception      { fg = hsl("#ea6962") },
    PreProc        { fg = hsl("#d3869b") },
    Include        { fg = hsl("#d3869b") },
    Define         { fg = hsl("#d3869b") },
    Macro          { fg = hsl("#89b482") },
    PreCondit      { fg = hsl("#d3869b") },
    Type           { fg = hsl("#d8a657") },
    StorageClass   { fg = hsl("#e78a4e") },
    Structure      { fg = hsl("#e78a4e") },
    Typedef        { fg = hsl("#ea6962") },
    Special        { fg = hsl("#d8a657") },
    SpecialChar    { fg = hsl("#d8a657") },
    Tag            { fg = hsl("#e78a4e") },
    Delimiter      { fg = hsl("#d4be98") },
    SpecialComment { fg = hsl("#928374"), gui = "italic"},
    Debug          { fg = hsl("#e78a4e") },
    Underlined     { gui = "underline" },
    Bold           { gui = "bold" },
    Italic         { gui = "italic" },
    Ignore         { fg = hsl("#928374") },
    Error          { fg = p.error },
    Todo           { bg = hsl("#d3869b"), gui = "italic"},

		-- LSP Depedencies
		ErrorText          { sp = p.error, gui = "undercurl" },
		HintText           { sp = hsl("#a9b665"), gui = "undercurl" },
		InfoText           { sp = hsl("#7daea3"), gui = "undercurl" },
		WarningText        { sp = hsl("#d8a657"), gui = "undercurl" },
		ErrorFloat         { fg = p.error, bg = p.float_bg },
		HintFloat          { fg = hsl("#a9b665"), bg = p.float_bg },
		InfoFloat          { fg = hsl("#7daea3"), bg = p.float_bg },
		WarningFloat       { fg = hsl("#d8a657"), bg = p.float_bg },
		RedSign            { fg = p.error, bg = hsl("#32302f") },
		BlueSign           { fg = hsl("#7daea3"), bg = hsl("#32302f") },
		YellowSign         { fg = hsl("#d8a657"), bg = hsl("#32302f") },
		VirtualTextError   { fg = hsl("#928374") },
		VirtualTextHint    { fg = hsl("#928374") },
		VirtualTextInfo    { fg = hsl("#928374") },
		VirtualTextWarning { fg = hsl("#928374") },

		-- LSP
    LspDiagnosticsDefaultError         { ErrorText },
		LspDiagnosticsDefaultHint          { HintText },
		LspDiagnosticsDefaultInformation   { InfoText },
		LspDiagnosticsDefaultWarning       { WarningText },
		LspDiagnosticsFloatingError        { ErrorFloat },
		LspDiagnosticsFloatingHint         { HintFloat },
		LspDiagnosticsFloatingInformation  { InfoFloat },
		LspDiagnosticsFloatingWarning      { WarningFloat },
		LspDiagnosticsSignError            { RedSign },
		LspDiagnosticsSignHint             { BlueSign },
		LspDiagnosticsSignInformation      { BlueSign },
		LspDiagnosticsSignWarning          { YellowSign },
		LspDiagnosticsUnderlineError       { ErrorText },
		LspDiagnosticsUnderlineHint        { HintText },
		LspDiagnosticsUnderlineInformation { InfoText },
		LspDiagnosticsUnderlineWarning     { WarningText },
		LspDiagnosticsVirtualTextError     { VirtualTextError },
		LspDiagnosticsVirtualTextHint      { VirtualTextHint },
		LspDiagnosticsVirtualTextInfo      { VirtualTextInfo },
		LspDiagnosticsVirtualTextWarning   { VirtualTextWarning },

		-- Treesitter
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

