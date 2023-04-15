<div align="center">

![Last commit](https://img.shields.io/github/last-commit/Comamoca/runit.nvim?style=flat-square)
![Repository Stars](https://img.shields.io/github/stars/Comamoca/runit.nvim?style=flat-square)
![Issues](https://img.shields.io/github/issues/Comamoca/runit.nvim?style=flat-square)
![Open Issues](https://img.shields.io/github/issues-raw/Comamoca/runit.nvim?style=flat-square)
![Bug Issues](https://img.shields.io/github/issues/Comamoca/runit.nvim/bug?style=flat-square)

<img src="https://emoji2svg.deno.dev/api/🦊" alt="eyecatch" height="100">

# RunIt

The simple program runner🚀

<br>
<br>


</div>

<table>
  <thead>
    <tr>
      <th style="text-align:center">🍔English</th>
      <th style="text-align:center"><a href="README.ja.md">🍡日本語</a></th>
    </tr>
  </thead>
</table>

<div align="center">

</div>

## 🚀 How to use

To run the following command on NeoVim.

```
:RunIt
```

### Settings

In `setup()`, specify a table of extensions and commands to run. Below is a sample.

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

## ⛏️   Development

Clone this repository and edit `./lua/runit.lua`.

## 📝 Todo

- [ ] Correspond to command line arguments.

## 📜 License

MIT

## 👏 Affected projects

[vim-quickrun.vim](https://github.com/thinca/vim-quickrun)
