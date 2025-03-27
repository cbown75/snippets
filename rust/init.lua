local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  -- Function
  s(
    "fn",
    fmt(
      [[
  fn {}({}){} {{
      {}
  }}
  ]],
      {
        i(1, "name"),
        i(2, ""),
        c(3, {
          fmt(" -> {}", { i(1, "ReturnType") }),
          t(""),
        }),
        i(4, ""),
      }
    )
  ),

  -- Struct
  s(
    "struct",
    fmt(
      [[
  struct {}{} {{
      {}
  }}
  ]],
      {
        i(1, "Name"),
        c(2, {
          fmt("<{}>", { i(1, "T") }),
          t(""),
        }),
        i(3, ""),
      }
    )
  ),

  -- Implement
  s(
    "impl",
    fmt(
      [[
  impl{} {}{} {{
      {}
  }}
  ]],
      {
        c(1, {
          fmt("<{}>", { i(1, "T") }),
          t(""),
        }),
        i(2, "Name"),
        c(3, {
          fmt(" for {}", { i(1, "Type") }),
          t(""),
        }),
        i(4, ""),
      }
    )
  ),

  -- Match
  s(
    "match",
    fmt(
      [[
  match {} {{
      {} => {},
      {} => {},
  }}
  ]],
      {
        i(1, "expression"),
        i(2, "pattern1"),
        i(3, "result1"),
        i(4, "pattern2"),
        i(5, "result2"),
      }
    )
  ),

  -- Error handling with ?
  s(
    "resq",
    fmt(
      [[
  let {} = {}?;
  ]],
      {
        i(1, "result"),
        i(2, "expression"),
      }
    )
  ),

  -- Result type
  s(
    "result",
    fmt(
      [[
  Result<{}, {}>
  ]],
      {
        i(1, "T"),
        i(2, "Error"),
      }
    )
  ),
}
