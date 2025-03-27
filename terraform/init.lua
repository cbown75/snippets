local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  -- Resource
  s(
    "resource",
    fmt(
      [[
  resource "{}" "{}" {{
    {}
  }}
  ]],
      {
        i(1, "type"),
        i(2, "name"),
        i(3, ""),
      }
    )
  ),

  -- Data source
  s(
    "data",
    fmt(
      [[
  data "{}" "{}" {{
    {}
  }}
  ]],
      {
        i(1, "type"),
        i(2, "name"),
        i(3, ""),
      }
    )
  ),

  -- Variable
  s(
    "variable",
    fmt(
      [[
  variable "{}" {{
    type        = {}
    description = "{}"
    {}
  }}
  ]],
      {
        i(1, "name"),
        c(2, {
          t("string"),
          t("number"),
          t("bool"),
          fmt("list({})", { i(1, "string") }),
          fmt("map({})", { i(1, "string") }),
          t("any"),
        }),
        i(3, "description"),
        c(4, {
          fmt("default     = {}", { i(1, "null") }),
          t(""),
        }),
      }
    )
  ),

  -- Output
  s(
    "output",
    fmt(
      [[
  output "{}" {{
    description = "{}"
    value       = {}
    {}
  }}
  ]],
      {
        i(1, "name"),
        i(2, "description"),
        i(3, ""),
        c(4, {
          fmt("sensitive   = {}", { c(1, { t("true"), t("false") }) }),
          t(""),
        }),
      }
    )
  ),

  -- Module
  s(
    "module",
    fmt(
      [[
  module "{}" {{
    source  = "{}"
    {}
  }}
  ]],
      {
        i(1, "name"),
        i(2, "source"),
        i(3, ""),
      }
    )
  ),
}
