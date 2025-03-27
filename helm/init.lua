local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt

return {
	-- If statement
	s(
		"if",
		fmt(
			[[
  {{- if {} }}
  {}
  {{- end }}
  ]],
			{
				i(1, "condition"),
				i(2, ""),
			}
		)
	),

	-- If/else statement
	s(
		"ifelse",
		fmt(
			[[
  {{- if {} }}
  {}
  {{- else }}
  {}
  {{- end }}
  ]],
			{
				i(1, "condition"),
				i(2, ""),
				i(3, ""),
			}
		)
	),

	-- Range loop
	s(
		"range",
		fmt(
			[[
  {{- range ${} }}
  {}
  {{- end }}
  ]],
			{
				i(1, "items"),
				i(2, ""),
			}
		)
	),

	-- With scope
	s(
		"with",
		fmt(
			[[
  {{- with ${} }}
  {}
  {{- end }}
  ]],
			{
				i(1, "object"),
				i(2, ""),
			}
		)
	),

	-- Define template
	s(
		"define",
		fmt(
			[[
  {{- define "{}" }}
  {}
  {{- end }}
  ]],
			{
				i(1, "template.name"),
				i(2, ""),
			}
		)
	),

	-- Include template
	s(
		"include",
		fmt(
			[[
  {{- include "{}" {} }}
  ]],
			{
				i(1, "template.name"),
				i(2, "."),
			}
		)
	),
}
