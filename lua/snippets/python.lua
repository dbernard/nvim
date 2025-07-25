local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  -- Django setUp method
  s("su", fmt([[
    def setUp(self):
        super().setUp()
        {}
  ]], { i(1) })),

  -- Django setUpTestData method
  s("sutd", fmt([[
    @classmethod
    def setUpTestData(cls):
        super().setUpTestData()
        {}
  ]], { i(1) })),

  -- Gargoyle switches decorator
  s("switches", fmt([[
    @switches({}={})
  ]], { i(1, "flag_name"), i(2, "return_value") })),
}