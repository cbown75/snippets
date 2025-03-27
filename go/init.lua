local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  -- Function with error return
  s(
    "fn",
    fmt(
      [[
  func {}({}) ({}) {{
  	{}
  }}
  ]],
      {
        i(1, "name"),
        i(2, ""),
        c(3, {
          t("error"),
          fmt("({}, error)", { i(1, "returnType") }),
          t(""),
        }),
        i(4, ""),
      }
    )
  ),

  -- Error check
  s(
    "iferr",
    fmt(
      [[
  if err != nil {{
  	return {}
  }}
  ]],
      {
        c(1, {
          t("err"),
          fmt("nil, {}", { i(1, "err") }),
          fmt('fmt.Errorf("failed to %s: %w", {}, {})', { i(1, "action"), i(2, "err") }),
        }),
      }
    )
  ),

  -- For loop
  s(
    "for",
    fmt(
      [[
  for {} {{
  	{}
  }}
  ]],
      {
        c(1, {
          fmt("{} := 0; {} < {}; {}++", { i(1, "i"), i(2, "i"), i(3, "n"), i(4, "i") }),
          fmt("{}, {} := range {}", { i(1, "i"), i(2, "v"), i(3, "collection") }),
        }),
        i(2, ""),
      }
    )
  ),

  -- Struct definition
  s(
    "struct",
    fmt(
      [[
  type {} struct {{
  	{}
  }}
  ]],
      {
        i(1, "Name"),
        i(2, ""),
      }
    )
  ),

  -- Method definition
  s(
    "method",
    fmt(
      [[
  func ({} {}) {}({}) ({}) {{
  	{}
  }}
  ]],
      {
        i(1, "r"),
        i(2, "Receiver"),
        i(3, "name"),
        i(4, ""),
        c(5, {
          t("error"),
          fmt("({}, error)", { i(1, "returnType") }),
          t(""),
        }),
        i(6, ""),
      }
    )
  ),
}
