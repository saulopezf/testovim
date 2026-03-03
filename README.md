# testovim

This is my custom Neovim setup built on top of [NvChad](https://github.com/NvChad/NvChad), tailored for full-stack web development — especially for JavaScript, TypeScript, and Node.js — and also supports C/C++ development and debugging.

---

## ✨ Features

- 🚀 **IDE-like experience** with fast startup and modern UI
- 🌐 **Preconfigured for JavaScript / TypeScript** (linters, formatters, LSPs)
- 📁 **Code folding** with VSCode style 
- 🧪 **Integrated debugger** for:
  - Node.js
  - Web (browser debugging)
  - C / C++
- 📏 **Linters & Formatters** out-of-the-box using `conform.nvim`
- 🧠 **LSPs** preinstalled and configured for web & backend development
- 🧩 Plugin structure split for easy maintenance and scalability

---

## ⚙️ Requirements

Before running Neovim with this configuration, make sure you have the following installed:

#### System
- **Neovim ≥ 0.11**
- **ripgrep** (`rg`) — for Telescope

#### Terminal
- **Nerd Font** (like [FiraCode Nerd Font](https://www.nerdfonts.com/)) set in your terminal
- Terminal that supports **virtual text**, **ligatures**, **popup windows** and **true colors**


## 📦 Installation

1.  Clone this repo into the nvim config directory:

    UNIX based system
    ```bash
    $ git clone https://github.com/saulopezf/testovim.git ~/.config/nvim`
    ```
    WINDOWS
    ```bash
    $ git clone https://github.com/saulopezf/testovim.git ~/AppData/Local/nvim`
    ```

2.  Launch Neovim and let Lazy install all plugins
    - In case of Lazy not installing plugins automatically
        ```
        :Lazy install
        ```
    - In case of wanting the lock version
        ```
        :Lazy sync
        ```

3.  For LSPs, formatters, linters and DAPs to be installed.
    ```
    :MasonInstallAll
    ```

4.  For parsers and color in your files
    ```
    :TSInstallAll
    ```
    - Treesitter `auto_install` is set to `false`. In case of a filetype or language not having a parser
        ```
        :TSInstall filetype
        ```

5. You are ready to go! `:checkhealth` to ensure all the environment is running smoothly.
