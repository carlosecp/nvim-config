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
		TSAnnotation         { fg = hsl("#d3869b") },
		TSAttribute          { fg = hsl("#d3869b") },
		TSBoolean            { fg = hsl("#d3869b") },
		TSCharacter          { fg = hsl("#89b482") },
		TSComment            { Comment },
		TSConditional        { fg = hsl("#ea6962") },
		TSConstBuiltin       { fg = hsl("#7daea3") },
		TSConstMacro         { fg = hsl("#7daea3") },
		TSConstant           { fg = Normal.fg },
		TSConstructor        { fg = hsl("#a9b665") },
		TSDanger             { fg = hsl("#282828"), bg = hsl("#ea6962"), gui = "bold" },
		TSEmphasis           { gui = "bold" },
		TSEnvironment        { Macro },
		TSEnvironmentName    { Type },
		TSException          { fg = p.error },
		TSField              { fg = hsl("#a9b665") },
		TSFloat              { fg = hsl("#d3869b") },
		TSFuncBuiltin        { fg = hsl("#a9b665") },
		TSFuncMacro          { fg = hsl("#a9b665") },
		TSFunction           { fg = hsl("#a9b665") },
		TSInclude            { fg = hsl("#ea6962") },
		TSKeyword            { fg = hsl("#ea6962") },
		TSKeywordFunction    { fg = hsl("#ea6962") },
		TSKeywordOperator    { fg = hsl("#e78a4e") },
		TSKeywordReturn      { TSKeyword },
		TSLabel              { fg = hsl("#e78a4e") },
		TSLiteral            { String },
		TSMath               { fg = hsl("#7daea3") },
		TSMethod             { fg = hsl("#a9b665") },
		TSNamespace          { fg = hsl("#d8a657") },
		TSNone               { fg = Normal.fg },
		TSNumber             { fg = hsl("#d3869b") },
		TSOperator           { fg = hsl("#e78a4e") },
		TSParameter          { fg = Normal.fg },
		TSParameterReference { fg = Normal.fg },
		TSProperty           { fg = hsl("#a9b665") },
		TSPunctBracket       { fg = Normal.fg },
		TSPunctDelimiter     { fg = hsl("#928374") },
		TSPunctSpecial       { fg = hsl("#7daea3") },
		TSRepeat             { fg = hsl("#ea6962") },
		TSString             { fg = hsl("") },
		TSStringEscape       { fg = hsl("") },
		TSStringRegex        { fg = hsl("") },
		TSStructure          { fg = hsl("") },
		TSSymbol             { fg = hsl("") },
		TSTag                { fg = hsl("") },
		TSTagDelimiter       { fg = hsl("") },
		TSText               { fg = hsl("") },
		TSStrike             { fg = hsl("") },
		TSMath               { fg = hsl("") },
		TSType               { fg = hsl("") },
		TSTypeBuiltin        { fg = hsl("") },
		TSURI                { fg = hsl("") },

		-- Nvimtree
		-- NvimTreeSymlink xxx links to Fg
		-- NvimTreeFolderName xxx links to Green
		-- NvimTreeRootFolder xxx links to Grey
		-- NvimTreeFolderIcon xxx links to Orange
		-- NvimTreeEmptyFolderName xxx links to Green
		-- NvimTreeOpenedFolderName xxx links to Green
		-- NvimTreeExecFile xxx links to Fg
		-- NvimTreeOpenedFile xxx links to Fg
		-- NvimTreeSpecialFile xxx links to Fg
		-- NvimTreeImageFile xxx links to Fg
		-- NvimTreeMarkdownFile xxx links to Fg
		-- NvimTreeIndentMarker xxx links to Grey
		-- NvimTreeGitDirty xxx links to Yellow
		-- NvimTreeGitStaged xxx links to Blue
		-- NvimTreeGitMerge xxx links to Orange
		-- NvimTreeGitRenamed xxx links to Purple
		-- NvimTreeGitNew xxx links to Aqua
		-- NvimTreeGitDeleted xxx links to Red

		-- Telescope
		-- TelescopeSelectionCaret xxx links to TelescopeSelection
		-- TelescopeMultiSelection xxx links to Type
		-- TelescopeNormal xxx links to Normal
		-- TelescopePreviewNormal xxx links to Normal
		-- TelescopePromptBorder xxx links to TelescopeBorder
		-- TelescopeResultsBorder xxx links to TelescopeBorder
		-- TelescopePreviewBorder xxx links to TelescopeBorder
		-- TelescopePreviewLine xxx links to Visual
		-- TelescopePreviewMatch xxx links to Search
		-- TelescopePreviewPipe xxx links to Constant
		-- TelescopePreviewCharDev xxx links to Constant
		-- TelescopePreviewDirectory xxx links to Directory
		-- TelescopePreviewBlock xxx links to Constant
		-- TelescopePreviewLink xxx links to Special
		-- TelescopePreviewSocket xxx links to Statement
		-- TelescopePreviewRead xxx links to Constant
		-- TelescopePreviewWrite xxx links to Statement
		-- TelescopePreviewExecute xxx links to String
		-- TelescopePreviewHyphen xxx links to NonText
		-- TelescopePreviewSticky xxx links to Keyword
		-- TelescopePreviewSize xxx links to String
		-- TelescopePreviewUser xxx links to Constant
		-- TelescopePreviewGroup xxx links to Constant
		-- TelescopePreviewDate xxx links to Directory
		-- TelescopeResultsClass xxx links to Function
		-- TelescopeResultsConstant xxx links to Constant
		-- TelescopeResultsField xxx links to Function
		-- TelescopeResultsFunction xxx links to Function
		-- TelescopeResultsMethod xxx links to Method
		-- TelescopeResultsOperator xxx links to Operator
		-- TelescopeResultsStruct xxx links to Struct
		-- TelescopeResultsVariable xxx links to SpecialChar
		-- TelescopeResultsLineNr xxx links to LineNr
		-- TelescopeResultsIdentifier xxx links to Identifier
		-- TelescopeResultsNumber xxx links to Number
		-- TelescopeResultsComment xxx links to Comment
		-- TelescopeResultsSpecialComment xxx links to SpecialComment
		-- TelescopeResultsDiffChange xxx links to DiffChange
		-- TelescopeResultsDiffAdd xxx links to DiffAdd
		-- TelescopeResultsDiffDelete xxx links to DiffDelete
		-- TelescopeResultsDiffUntracked xxx links to NonText

		--
  }
end)

return theme

