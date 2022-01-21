local lush = require "lush"
local hsl = lush.hsl

---@diagnostic disable: undefined-global
local theme = lush(function()
	return {
		Normal       { fg = hsl("#839496"), bg = "none"         },
		CursorLine   { bg = "none"                              },
		Visual       { fg = hsl("#002b36"), bg = hsl("#586e75") },
		CursorColumn { fg = hsl("#585e75"), bg = hsl("#002b36") },
		Comment      { fg = hsl("#586e75")                      },
		LineNr       { fg = hsl("#586e75")                      },
		CursorLineNr { fg = hsl("#839496")                      },
		EndOfBuffer  { fg = "none"                              },
		VertSplit    { fg = "none"                              },

		ColorColumn  { bg = hsl("#586e75") },

		Pmenu        { fg = Normal.fg, bg = hsl("#31353f") },
		PmenuSel     { Pmenu, gui="reverse"                },
		PmenuSbar    { bg = Pmenu.bg.darken(25)            },
		PmenuThumb   { bg = Pmenu.fg                       },

		TelescopeMatching      { fg = hsl("#ffa500"), gui="bold" },
		TelescopePromptCounter { fg = hsl("#586e75")             },

		DiagnosticUnderlineError { gui = "undercurl" },
		DiagnosticUnderlineWarn { gui = "undercurl" },
		DiagnosticUnderlineInfo { gui = "undercurl" },
		DiagnosticUnderlineHint { gui = "undercurl" },

		NvimTreeRootFolder { fg = hsl("#586e75") },

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
    TSTitle              { fg = hsl("#ffff60") }, -- Text that is part of a title.
    -- TSLiteral            { }, -- Literal text.
    TSURI                { fg = hsl("#586e75"), gui = "underline" }, -- Any URI like a link or email.
    -- TSVariable           { }, -- Any variable name that does not have another highlight.
    -- TSVariableBuiltin    { }, -- Variable names that are defined by the languages, like `this` or `self`.
	}
end)

return theme
