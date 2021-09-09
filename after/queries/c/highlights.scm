; highlights.scm

; Highlight structs identifiers as custom types
(struct_specifier
		name: (type_identifier) @structure)

; Highlight typedef identifiers as custom types
(type_definition
	declarator: (type_identifier) @type)

; Separate builtin type from custom types
((primitive_type) @type.builtin)
