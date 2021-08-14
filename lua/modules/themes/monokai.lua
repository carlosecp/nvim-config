local lush = require "lush"
local hsl = lush.hsl

local p = {
	ui = {
		fg0 = hsl("#dddddd"),

		bg0 = hsl("#0f0f0f"),
		bg1 = hsl("#161616"),
		bg2 = hsl("#1f1f1f"),

		error = hsl("#f44747"),
		todo = hsl("#c586c0"),
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
		Normal { fg = p.ui.fg0, bg = p.ui.bg2 },

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

		NvimTreeNormal { bg = p.ui.explorer_bg }
	}
end)

return theme

