<div align="center">

![Last commit](https://img.shields.io/github/last-commit/Comamoca/runit.nvim?style=flat-square)
![Repository Stars](https://img.shields.io/github/stars/Comamoca/runit.nvim?style=flat-square)
![Issues](https://img.shields.io/github/issues/Comamoca/runit.nvim?style=flat-square)
![Open Issues](https://img.shields.io/github/issues-raw/Comamoca/runit.nvim?style=flat-square)
![Bug Issues](https://img.shields.io/github/issues/Comamoca/runit.nvim/bug?style=flat-square)

<img src="https://emoji2svg.deno.dev/api/🦊" alt="eyecatch" height="100">

# RunIt

シンプルなプログラムランナー🚀

<br>
<br>

</div>

<table>
  <thead>
    <tr>
      <th style="text-align:center">🍡日本語</th>
      <th style="text-align:center"><a href="README.md">🍔English</a></th>
    </tr>
  </thead>
</table>

<div align="center">

</div>

## 🚀 使い方

NeoVimで以下のコマンドを実行してください。

```
:RunIt
```
### 設定

`setup()`内に、拡張子と実行するコマンドをテーブルにして指定してください。 以下はサンプルです。


```lua
local function isNodejs()
	local packagejson = "package.json"

	if vim.fn.findfile(packagejson, "./") == packagejson then
		return true
	else
		return false
	end
end

require("runit").setup({
	js = function(file)
		if isNodejs() then
			return "node" .. file
		else
			return "deno run -A " .. file
		end
	end,
	ts = function(file)
		return "deno run -A " .. file
	end,
	mjs = function()
		return "node" .. file
	end,
	py = function(file)
		return "python" .. file
	end,
})
```

## ⬇️  Install

- dein.vim

```
[[plugins]]
repo = "https://github.com/Comamoca/runit.nvim"
on_cmd = ["RunIt"]
```

- dein.vim(toml)

```
call("dein#add", "https://github.com/Comamoca/runit.nvim")
```

## ⛏️   開発

このリポジトリをクローンして`./lua/runit.lua`を編集してください。

## 📝 Todo

- [ ] コマンドライン引数に対応させる。

## 📜 ライセンス

MIT

## 👏 影響を受けたプロジェクト

[vim-quickrun.vim](https://github.com/thinca/vim-quickrun)
