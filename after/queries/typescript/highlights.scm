; highlights.scm

; Imports as regular variables
(import_specifier
	name: (identifier) @property)
(namespace_import (identifier) @property)
(import_clause (identifier) @property)

; Methods in interface definitions
(property_signature
 name: (property_identifier) @method
 type: (type_annotation (function_type)))

; Arrow functions default parameters
(required_parameter (
	object_pattern (
		object_assignment_pattern
			left: (shorthand_property_identifier_pattern) @parameter)))
(rest_pattern (identifier) @parameter)
