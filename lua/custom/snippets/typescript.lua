local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local extras = require("luasnip.extras")
local m = extras.m
local l = extras.l
local rep = extras.rep
local postfix = require("luasnip.extras.postfix").postfix

local snippets, autosnippets = {}, {}

table.insert(snippets,
    s("arr", {
        t("new Array("), i(1, "length"), t(")"),
        c(2, {
            sn(3, { t(".fill("), i(1, "0"), t(")") }),
            i(0),
        })
    }))

table.insert(snippets,
    s("min", {
        t("Math.min("), i(1, "x"), t(", "), i(2, "y"), t(")"), i(0)
    }))

table.insert(snippets,
    s("max", {
        t("Math.max("), i(1, "x"), t(", "), i(2, "y"), t(")"), i(0)
    }))

table.insert(snippets,
    s("dp", {
        t("const dp = ("), i(1, "args"), t(") => {"), i(0), t("};"),
    }))

table.insert(snippets,
    ls.parser.parse_snippet("cw", "console.warn($0)")
)

table.insert(snippets,
    ls.parser.parse_snippet("cl", "console.log($0)")
)

table.insert(snippets,
    ls.parser.parse_snippet("tcw", "tap(val => { console.warn($0); }),")
)

table.insert(snippets,
    ls.parser.parse_snippet("for", "for (let ${1:i} = ${2:0}; $1 < ${3:n}; $1++) {\n\t$0\n}")
)

table.insert(snippets,
    ls.parser.parse_snippet("ford", "for (let ${1:i} = ${2:n}; $1 >= ${3:0}; $1--) {\n\t$0\n}")
)

table.insert(snippets,
    ls.parser.parse_snippet("p", "{ x: ${1:0}, y: ${2:0} }$0")
)

table.insert(snippets,
    ls.parser.parse_snippet("str", "JSON.stringify($1, null, 4)$0")
)

table.insert(snippets,
ls.parser.parse_snippet("range", '\
function* range(start: number, n: number) {\
\tfor (let i = 0; i < n; i++) {\
\t\tyield i + start;\
\t}\
}\
'))

table.insert(snippets,
ls.parser.parse_snippet("cf", '\
if (d[\'$1\'] === undefined) {\
    throw new Error(`missing $1`);\
}$0\
'))

table.insert(snippets,
ls.parser.parse_snippet("sort", '${1:arr}.sort((a, b) => ${2:a} - ${3:b});$0'))

table.insert(snippets,
ls.parser.parse_snippet("unionfind", '\
class UnionFind {\
    private root: number[];\
    private rank: number[];\
    private size: number;\
    constructor(n: number) {\
        this.rank = new Array(n).fill(0);\
        this.root = new Array(n);\
        for (let i = 0; i < n; i++) {\
            this.root[i] = i;\
        }\
        this.size = n;\
    }\
    public find(a: number): number {\
        if (this.root[a] !== a) {\
            this.root[a] = this.find(this.root[a]);\
        }\
        return this.root[a];\
    }\
    public union(a: number, b: number): boolean {\
        const aRoot = this.find(a);\
        const bRoot = this.find(b);\
        if (aRoot !== bRoot) {\
            if (this.rank[aRoot] > this.rank[bRoot]) {\
                this.root[bRoot] = aRoot;\
            } else if (this.rank[aRoot] < this.rank[bRoot]) {\
                this.root[aRoot] = bRoot;\
            } else {\
                this.root[aRoot] = bRoot;\
                this.rank[bRoot]++;\
            }\
            this.size--;\
            return true;\
        }\
        return false;\
    }\
    public connected(a: number, b: number): boolean {\
        return this.find(a) === this.find(b);\
    }\
    public getSize() {\
        return this.size;\
    }\
}\
'))

table.insert(snippets,
ls.parser.parse_snippet("minheap", '\
class MinHeap<T> {\
    private arr: T[] = [];\
    constructor(private accessor: (i: T) => number) {}\
    public add(item: T) {\
        this.arr.push(item);\
        this.heapifyUp(this.arr.length - 1);\
    }\
    public top(): T | null {\
        if (this.arr.length === 0) {\
            return null;\
        }\
        return this.arr[0];\
    }\
    public pop(): T | null {\
        if (this.arr.length === 0) {\
            return null;\
        }\
        const res = this.arr[0];\
        this.arr[0] = this.arr[this.arr.length - 1];\
        this.arr.pop();\
        this.heapifyDown(0);\
        return res;\
    }\
    public size() {\
        return this.arr.length;\
    }\
    private swap(idx1: number, idx2: number) {\
        const temp = this.arr[idx1];\
        this.arr[idx1] = this.arr[idx2];\
        this.arr[idx2] = temp;\
    }\
    private heapifyUp(idx: number) {\
        if (idx <= 0) {\
            return;\
        }\
        const parentIdx = Math.floor((idx - 1) / 2);\
        if (this.accessor(this.arr[idx]) < this.accessor(this.arr[parentIdx])) {\
            this.swap(idx, parentIdx);\
            this.heapifyUp(parentIdx);\
        }\
    }\
    private heapifyDown(idx: number) {\
        const leftIdx = idx * 2 + 1;\
        const rightIdx = idx * 2 + 2;\
        if (leftIdx >= this.arr.length) {\
            return;\
        }\
        let childIdx = leftIdx;\
        if (rightIdx < this.arr.length) {\
            childIdx =\
                this.accessor(this.arr[leftIdx]) <\
                this.accessor(this.arr[rightIdx])\
                    ? leftIdx\
                    : rightIdx;\
        }\
        if (this.accessor(this.arr[childIdx]) < this.accessor(this.arr[idx])) {\
            this.swap(idx, childIdx);\
            this.heapifyDown(childIdx);\
        }\
    }\
}\
'))

local field = sn(nil, { t({ "", "field " }) })
table.insert(snippets, s("ddd", field))

local rec_ls
rec_ls = function()
    return sn(
        nil,
        c(1, {
            -- Order is important, sn(...) first would cause infinite loop of expansion.
            t(""),
            sn(nil, { t({ "", "\t\\item " }), i(1), t('ddd'), i(1), d(2, rec_ls, {}) }),
        })
    )
end

table.insert(snippets,
    s("fields", {
        t({ "\\begin{itemize}", "\t\\item " }),
        i(1),
        d(2, rec_ls, {}),
        t({ "", "\\end{itemize}" }),
    })
)

table.insert(snippets,
    s("fff", {
        t({ "\\begin{itemize}", "\t" }),
        i(1),
        d(2, rec_ls, {}),
        t({ "", "\\end{itemize}" }),
    })
)
return snippets, autosnippets
