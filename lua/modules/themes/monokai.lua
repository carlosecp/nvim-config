local lush = require "lush"
local hsl = lush.hsl

local p = {
	nvimtree = {
		inactive = hsl("#666666"),
		folder_icon = hsl("#90a4ae"),
	},
	lsp = {
		error = hsl("#f44747"),
		warning = hsl("#b1b011"),
		hint = hsl("#007acc"),
		info = hsl("#007acc")
	},
	bufferline = {
		inactive = hsl("#666666"),
	},
	ui = {
		fg = hsl("#dddddd"),
		bg = {
			std = hsl("#1f1f1f"),
			dark = hsl("#161616"),
		},

		inactive = hsl("#666666"),
		cursor = hsl("#f2f2f2"),
		cursor_line = hsl("#292929"),
		visual = hsl("#464646"),
		border = hsl("#666666"),

		autocomplete = {
			bg = hsl("#262626"),
			scrollbar = hsl("#505050"),
			selection = hsl("#363636")
		},

		error = hsl("#f44747"),
		todo = hsl("#c586c0"),
	},
	git = {
		added = hsl("#ffd600"),
		conflict = hsl("#fe413f"),
		deleted = hsl("#c4265e"),
		ignored = hsl("#777777"),
		modified = hsl("#b3b42b"),
		untracked = hsl("#86b42b"),
	},
	syntax = {
		reg = {
			comment         = hsl("#608b4e"),
			constant        = hsl("#dcdcaa"),
			string          = hsl("#ce9178"),
			number          = hsl("#b5cea8"),
			boolean         = hsl("#569cd6"),
			identfier       = hsl("#569cd6"),
			func            = hsl("#dcdcaa"),
			-- {Statement, Conditional, Repeat, Operator, Exception}
			statement       = hsl("#c586c0"),
			label           = hsl("#9cdcfe"),
			keyword         = hsl("#569cd6"),
			preproc         = hsl("#dcdcaa"),
			include         = hsl("#c586c0"),
			title           = hsl("#4ec9b0"),
			precondit       = hsl("#9cdcfe"),
			type            = hsl("#9cdcfe"),
			structure       = hsl("#dcdcaa"),
			typedef         = hsl("#dcdcaa"),
			special         = hsl("#569cd6"),
			special_char    = hsl("#d7ba7d"),
			special_comment = hsl("#5c6370"),
		},
		ts = {
			annotation       = hsl("#dcdcaa"),
			attribute        = hsl("#4ec9b0"),
			const_builtin    = hsl("#569cd6"),
			const_macro      = hsl("#4ec9b0"),
			constructor      = hsl("#4ec9b0"),
			field            = hsl("#9cdcfe"),
			keyword_function = hsl("#c586c0"),
			method           = hsl("#dcdcaa"),
			namespace        = hsl("#4ec9b0"),
			parameter        = hsl("#9cdcfe"),
			parameter_ref    = hsl("#9cdcfe"),
			property         = hsl("#9cdcfe"),
			string_esc       = hsl("#d7ba7d"),
			structure        = hsl("#ff00ff"),
			tag              = hsl("#569cd6"),
			tag_delimiter    = hsl("#5c6370"),
			type             = hsl("#4ec9b0"),
			type_builtin     = hsl("#569cd6"),
		}
	}
}

local theme = lush(function()
  return {
		Normal { fg = p.ui.fg, bg = p.ui.bg.std },

		-- Syntax
		-- Syntax: Regular
		Comment        { fg = p.syntax.reg.comment },
		Constant       { fg = p.syntax.reg.constant },
		String         { fg = p.syntax.reg.string },
		Character      { String },
		Number         { fg = p.syntax.reg.number },
		Float          { Number },
		Boolean        { fg = p.syntax.reg.boolean },
		Identifier     { fg = p.syntax.reg.identifier },
		Function       { fg = p.syntax.reg.func },
		Statement      { fg = p.syntax.reg.statement },
		Conditional    { Statement },
		Repeat         { Statement },
		Operator       { Statement },
		Exception      { Statement },
		Label          { fg = p.syntax.reg.label },
		Keyword        { fg = p.syntax.reg.keyword },
		PreProc        { fg = p.syntax.reg.preproc },
		Include        { fg = p.syntax.reg.include },
		Define         { Include },
		Macro          { Include },
		Title          { fg = p.syntax.reg.title },
		PreCondit =    { fg = p.syntax.reg.precondit },
		Type           { fg = p.syntax.reg.type },
		StorageClass   { Type },
		Structure      { fg = p.syntax.reg.structure },
		Typedef        { fg = p.syntax.reg.typedef },
		Special        { fg = p.syntax.reg.special },
		SpecialChar    { fg = p.syntax.reg.special_char },
		SpecialComment { fg = p.syntax.reg.special_comment },
		Tag            { Special },
		Delimiter      { Special },
		Debug          { Special },
		Underlined { gui = "underline" },
		Error      { fg = p.ui.error },
		Todo       { fg = p.ui.todo },

		-- Syntax: Treesitter
		TSAnnotation         { fg = p.syntax.ts.annotation },
		TSAttribute          { fg = p.syntax.ts.attribute },
		TSBoolean            { Boolean },
		TSCharacter          { Character },
		TSComment            { Comment },
		TSConditional        { Conditional },
		TSConstBuiltin       { fg = p.syntax.ts.const_builtin },
		TSConstMacro         { fg = p.syntax.ts.const_macro },
		TSConstant           { Constant },
		TSConstructor        { fg = p.syntax.ts.constructor },
		TSDanger             { },
		TSEmphasis           { },
		TSEnvironment        { Macro },
		TSEnvironmentName    { Type },
		TSException          { Exception },
		TSField              { fg = p.syntax.ts.field },
		TSFloat              { Float },
		TSFuncBuiltin        { Function },
		TSFuncMacro          { Function },
		TSFunction           { Function },
		TSInclude            { Include },
		TSKeyword            { Keyword },
		TSKeywordFunction    { fg = p.syntax.ts.keyword_function },
		TSKeywordOperator    { TSKeyword },
		TSKeywordReturn      { TSKeyword },
		TSLabel              { Label },
		TSLiteral            { String },
		TSMath               { },
		TSMethod             { fg = p.syntax.ts.method },
		TSNamespace          { fg = p.syntax.ts.namespace },
		TSNone               { fg = Normal.fg },
		TSNumber             { Number },
		TSOperator           { fg = Normal.fg },
		TSParameter          { fg = p.syntax.ts.parameter },
		TSParameterReference { fg = p.syntax.ts.parameter_ref },
		TSProperty           { fg = p.syntax.ts.property },
		TSPunctBracket       { fg = Normal.fg },
		TSPunctDelimiter     { fg = Normal.fg },
		TSPunctSpecial       { fg = Normal.fg },
		TSRepeat             { Repeat },
		TSString             { String },
		TSStringEscape       { fg = p.syntax.ts.string_esc },
		TSStringRegex        { TSString },
		TSStructure          { fg = p.syntax.ts.structure },
		TSSymbol             { },
		TSTag                { fg = p.syntax.ts.tag },
		TSTagDelimiter       { fg = p.syntax.ts.tag_delimiter },
		TSText               { },
		TSStrike             { },
		TSType               { fg = p.syntax.ts.type },
		TSTypeBuiltin        { fg = p.syntax.ts.type_builtin },
		TSURI                { },

		-- LSP 
		-- LSP: Diagnostics
		LspDiagnosticsDefaultError         { fg = p.lsp.error },
		LspDiagnosticsDefaultHint          { fg = p.lsp.hint },
		LspDiagnosticsDefaultInformation   { fg = p.lsp.info },
		LspDiagnosticsDefaultWarning       { fg = p.lsp.warning },

		-- Interface
		-- Interface: General
		LineNr { fg = p.ui.inactive },
		CursorLineNR { LineNr },
    EndOfBuffer  { LineNr },
    VertSplit    { LineNr },
    Cursor       { fg = Normal.bg, bg = p.ui.cursor },
		CursorLine { bg = p.ui.cursor_line },
		CursorColumn { CursorLine },
    Visual       { bg = p.ui.visual },
    VisualNOS    { Visual },
    TermCursor   { Cursor },
    TermCursorNC { },
    SignColumn   { bg = Visual.bg },
    Substitute   { Visual },

		-- Interface: Git
    DiffAdd      { fg = p.git.added },
    DiffChange   { fg = p.git.modified },
    DiffDelete   { fg = p.git.deleted },
    DiffText     { },

		-- Interface: Autocomplete
    Pmenu        { bg = p.ui.autocomplete.bg },
    PmenuSbar    { Pmenu },
    PmenuSel     { bg = p.ui.autocomplete.selection },
    PmenuThumb   { bg = p.ui.autocomplete.scrollbar },
    WildMenu     { Pmenu },

		-- Interface: Statusline
    StatusLine   { fg = p.ui.fg, bg = p.ui.bg.dark },
    StatusLineNC { fg = p.ui.inactive, bg = StatusLine.bg },

		-- Interface: Tabline
    TabLine      { },
    TabLineFill  { },
    TabLineSel   { },

    ColorColumn  { },
    Conceal      { },
    CursorIM     { },
    ErrorMsg     { fg = p.ui.error },
    FoldColumn   { },
    Folded       { },
    MatchParen   { },
    ModeMsg      { },
    MoreMsg      { },
    MsgArea      { },
    MsgSeparator { },
    NonText      { },
    NormalFloat  { },
    NormalNC     { },
    Question     { },
    QuickFixLine { },
    SpecialKey   { },
    WarningMsg   { },
    Whitespace   { fg = p.ui.inactive },

		-- Spell
		SpellBad     { gui = "underline" },
    SpellCap     { SpellBad },
    SpellLocal   { SpellBad },
		SpellRare    { SpellBad },

		-- NvimTree
		NvimTreeNormal          { fg = Normal.fg, bg = p.ui.bg.dark },
    Directory               { fg = Normal.fg },
		NvimTreeFolderIcon      { fg = p.nvimtree.folder_icon },
		NvimTreeFolderName      { Directory },
		NvimTreeEmptyFolderName { Directory },
		NvimTreeOpenedFile       { fg = NvimTreeNormal.fg },
		NvimTreeOpenedFolderName { fg = NvimTreeNormal.fg },
		NvimTreeCursorLine      { CursorLine },
		NvimTreeCursorColumn    { CursorColumn },
		NvimTreeEndOfBuffer     { fg = p.nvimtree.inactive },
		NvimTreeIndentMarker    { fg = p.nvimtree.inactive },
		NvimTreeVertSplit       { fg = p.nvimtree.inactive, bg = NvimTreeNormal.bg },

		-- NvimTree Git
		NvimTreeGitDeleted { DiffDelete },
		NvimTreeGitIgnored { fg = p.git.ignored },
		NvimTreeGitDirty   { DiffChange },
		NvimTreeGitRenamed { DiffChange },
		NvimTreeGitMerge   { },
		NvimTreeGitNew     { DiffAdd },
		NvimTreeGitStaged  { DiffAdd },

		NvimTreeFileDeleted      { NvimTreeGitDeleted },
		NvimTreeFileDirty        { NvimTreeGitDirty },
		NvimTreeFileRenamed      { NvimTreeGitRenamed },
		NvimTreeFileMerge        { NvimTreeGitMerge },
		NvimTreeFileNew          { NvimTreeGitNew },
		NvimTreeFileStaged       { NvimTreeGitStaged },

		-- NvimTree LSP
		NvimTreeLspDiagnosticsError       { LspDiagnosticsDefaultError },
		NvimTreeLspDiagnosticsHint        { LspDiagnosticsDefaultHint },
		NvimTreeLspDiagnosticsInformation { LspDiagnosticsDefaultInformation },
		NvimTreeLspDiagnosticsWarning     { LspDiagnosticsDefaultWarning },
		
		NvimTreeExecFile         { },
		NvimTreeImageFile        { },
		NvimTreePopup            { },
		NvimTreeRootFolder       { },
		NvimTreeSpecialFile      { },
		NvimTreeStatusLine       { },
		NvimTreeStatusLineNC     { },
		NvimTreeSymlink          { },
		NvimTreeWindowPicker     { },

		-- Bufferline
		BufferLineFill                      { bg = p.ui.bg.dark },
		BufferLineTabClose                  { BufferLineFill },

		-- Not Active/Selected Tabs
		BufferLineBackground                { fg = p.ui.inactive, bg = Normal.bg },
		BufferLineCloseButton               { fg = BufferLineBackground.fg },
		BufferLineError                     { LspDiagnosticsDefaultError },
		BufferLineInfo                      { LspDiagnosticsDefaultInformation },
		BufferLineWarning                   { LspDiagnosticsDefaultWarning },
		BufferLineDiagnostic                { },
		BufferLineErrorDiagnostic           { BufferLineError },
		BufferLineInfoDiagnostic            { BufferLineInfo },
		BufferLineWarningDiagnostic         { BufferLineWarning },
		BufferLineModified                  { DiffChange },
		BufferLineDuplicate                 { },
		BufferLinePick                      { },
		BufferLineSeparator                 { },

		-- Active/Selected Tabs
		BufferLineBufferSelected            { fg = Normal.fg, bg = BufferLineBackground.bg },
		BufferLineCloseButtonSelected       { fg = BufferLineBufferVisible.fg },
		BufferLineErrorSelected             { BufferLineError },
		BufferLineInfoSelected              { BufferLineInfo },
		BufferLineWarningSelected           { BufferLineWarning },
		BufferLineDiagnosticSelected        { },
		BufferLineErrorDiagnosticSelected   { BufferLineErrorDiagnostic },
		BufferLineInfoDiagnosticSelected    { BufferLineInfoDiagnostic },
		BufferLineWarningDiagnosticSelected { BufferLineWarningDiagnostic },
		BufferLineModifiedSelected          { BufferLineModified },
		BufferLineDuplicateSelected         { },
		BufferLinePickSelected              { },
		BufferLineSeparatorSelected         { },
		BufferLineIndicatorSelected         { },

		BufferLineBufferVisible             { },
		BufferLineCloseButtonVisible        { },
		BufferLineErrorVisible              { BufferLineError },
		BufferLineInfoVisible               { BufferLineInfo },
		BufferLineWarningVisible            { BufferLineWarning },
		BufferLineDiagnosticVisible         { },
		BufferLineErrorDiagnosticVisible    { BufferLineErrorDiagnostic },
		BufferLineInfoDiagnosticVisible     { BufferLineInfoDiagnostic },
		BufferLineWarningDiagnosticVisible  { BufferLineWarningDiagnostic },
		BufferLineModifiedVisible           { BufferLineModified },
		BufferLineDuplicateVisible          { },
		BufferLinePickVisible               { },
		BufferLineSeparatorVisible          { },

		BufferLineTab                       { },
		BufferLineTabSelected               { },

		BufferlineDevIconDefaultInactive    { },
		BufferlineDevIconDefaultSelected    { },

		-- Telescope
		TelescopeBorder { fg = p.ui.border }
	}
end)

return theme

