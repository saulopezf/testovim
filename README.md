# testovim

This is my custom Neovim setup built on top of [LazyVim](https://github.com/LazyVim/LazyVim), tailored for full-stack web development — featuring environment for JavaScript, TypeScript, Golang and C/C++ with debugging.

> The previous setup based on [NvChad](https://github.com/NvChad/NvChad) lives in the `nvchad` branch.

---

## ✨ Features

- 🚀 **IDE-like experience** with fast startup and modern UI
- 🌐 **Preconfigured for JavaScript / TypeScript** (vtsls, eslint_d + oxlint, project prettier or oxfmt)
- 📁 **Code folding** with VSCode style (`nvim-ufo`)
- 🧪 **Integrated debugger** for:
  - Node.js
  - Web (browser debugging)
  - Jest (current file)
  - C / C++
- 📏 **Linters & Formatters** out-of-the-box using `nvim-lint` and `conform.nvim`
- 🧠 **LSPs** preinstalled and configured for web & backend development
- 🔭 **Telescope** with `live-grep-args`
- 🤖 **Copilot** inline suggestions (`<C-a>` to accept)
- 🧩 Plugin structure split for easy maintenance and scalability

---

## ⚙️ Requirements

Before running Neovim with this configuration, make sure you have the following installed:

#### System
- **Neovim ≥ 0.11.2**
- **git**, a **C compiler** and **tree-sitter-cli** — for treesitter parsers
- **ripgrep** (`rg`) — for Telescope
- **node** — for LSPs, Copilot and the JS debugger
- **go** — for gopls, gofumpt, goimports and delve

#### Terminal
- **Nerd Font** (like [FiraCode Nerd Font](https://www.nerdfonts.com/)) set in your terminal
- Terminal that supports **virtual text**, **ligatures**, **popup windows** and **true colors**


## 📦 Installation

1.  Clone the repo into the nvim config directory:

    UNIX based system
    ```bash
    $ git clone https://github.com/saulopezf/testovim.git ~/.config/nvim
    ```
    WINDOWS
    ```bash
    $ git clone https://github.com/saulopezf/testovim.git ~/AppData/Local/nvim
    ```

2.  Launch Neovim. LazyVim installs all plugins, LSPs, formatters, linters, DAPs (Mason) and treesitter parsers automatically.
    - In case of wanting the lock version
        ```
        :Lazy restore
        ```

3.  Log in to Copilot
    ```
    :Copilot auth
    ```

4. You are ready to go! `:checkhealth` to ensure all the environment is running smoothly.


## 🧱 Structure

```
init.lua                 -> require("config.lazy")
lua/config/lazy.lua      lazy.nvim bootstrap + LazyVim extras
lua/config/options.lua   vim options
lua/config/keymaps.lua   general keymaps
lua/config/autocmds.lua  autocmds
lua/plugins/*.lua        one file per plugin / feature
```

LazyVim extras are declared in `lua/config/lazy.lua` (instead of `:LazyExtras`), so the whole setup is visible in the code.


## ⌨️ Custom keymaps

On top of the [LazyVim defaults](https://www.lazyvim.org/keymaps):

| Keys | Action |
|---|---|
| `;` | Enter command mode |
| `<A-Up>` / `<A-Down>` | Move line up / down |
| `<C-Arrows>` / `<A-S-Arrows>` | Resize window (see macOS note below) |
| `<C-n>` | Toggle file explorer (neo-tree) |
| `<leader>e` | Open and focus file explorer (neo-tree) |
| `<Tab>` / `<S-Tab>` | Next / previous buffer |
| `<C-p>` (visual) | Paste without yanking |
| `<leader>fr` | Telescope resume last search |
| `<leader>fo` | Telescope recent files |
| `<leader>fw` | Telescope live grep |
| `<leader>fq` | Telescope live grep args |
| `<leader>fz` | Telescope fuzzy find in current buffer |
| `<leader>fh` | Telescope help pages |
| `<leader>fa` | Telescope find all files (hidden + ignored) |
| `<leader>fd` | Telescope diagnostics |
| `<leader>ma` | Telescope marks |
| `<leader>fm` | Format file |
| `<leader>sr` | Find & Replace (grug-far) |
| `<leader>cL` | Run linter |
| `<leader>ghl` | Toggle git line blame |
| `<leader>at` | Toggle Copilot |
| `<C-a>` (insert) | Accept Copilot suggestion |
| `<leader>do` / `<leader>dO` | DAP step over / step out |
| `<leader>du` / `<leader>de` | DAP UI toggle / eval |
| `zR` / `zM` / `zK` | Open all folds / close all folds / peek fold or hover |

> **macOS:** `<C-Arrows>` are captured by Mission Control. Disable them in *System Settings > Keyboard > Keyboard Shortcuts > Mission Control* or use `<A-S-Arrows>` (the terminal must send Option as Meta, e.g. iTerm2 *Use Option as Meta key*).


## 🔀 Switching between `main` (LazyVim) and `nvchad` branches

Plugins, Mason packages and caches live outside the config directory, so clean them when switching branches:

```bash
rm -rf ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim
```

Or keep both setups side by side with `NVIM_APPNAME`:

```bash
git clone -b nvchad https://github.com/saulopezf/testovim.git ~/.config/nvim-nvchad
NVIM_APPNAME=nvim-nvchad nvim
```
