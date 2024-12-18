local ls = require 'luasnip'
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require 'luasnip.util.events'
local ai = require 'luasnip.nodes.absolute_indexer'
local fmt = require('luasnip.extras.fmt').fmt
local extras = require 'luasnip.extras'
local m = extras.m
local l = extras.l
local rep = extras.rep
local postfix = require('luasnip.extras.postfix').postfix

local snippets, autosnippets = {}, {} --}}}

table.insert(
  snippets,
  s('ternary', {
    i(1, 'cond'),
    t ' ? ',
    i(2, 'then'),
    t ' : ',
    i(3, 'else'),
  })
)

table.insert(snippets, ls.parser.parse_snippet('path', '$TM_FILEPATH'))

table.insert(
  snippets,
  s('todo', {
    t 'MZ.TODO ',
    f(function()
      return os.date '%Y-%m-%d '
    end),
    i(0),
  })
)

table.insert(
  snippets,
  s('mark', {
    t '// mz.marker ',
    i(0),
  })
)

table.insert(snippets, ls.parser.parse_snippet('cw', 'Console.WriteLine($"$0");'))

return snippets, autosnippets
