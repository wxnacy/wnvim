#!/usr/bin/env bash

# https://zhuanlan.zhihu.com/p/445331508
# http://xfyuan.github.io/2021/02/neovim-builtin-lsp-basic-configuration/
# http://vimdoc.sourceforge.net/htmldoc/intro.html#key-notation
# https://zhuanlan.zhihu.com/p/382092667
# https://github.com/nshen/learn-neovim-lua
# https://github.com/williamboman/nvim-lsp-installer/blob/main/lua/nvim-lsp-installer/servers/pylsp/README.md
# https://www.xwxwgo.com/post/2022/01/18/neovim%E5%BC%80%E5%8F%91%E7%8E%AF%E5%A2%83%E9%85%8D%E7%BD%AE/
# https://github.com/mhinz/vim-startify
# https://github.com/lxyoucan/nvim-as-java-ide/blob/main/nvim/init.lua
# https://github.com/williamboman/nvim-lsp-installer#available-lsps
# https://github.com/ayamir/nvimdots
# https://github.com/LunarVim/LunarVim
# https://github.com/glepnir/nvim-lua-guide-zh
# https://learnku.com/articles/68258
# https://github.com/glepnir/dashboard-nvim
# https://zhuanlan.zhihu.com/p/551941252
# https://github.com/kevinhwang91/rnvimr
# https://github.com/TheZoraiz/ascii-image-converter

# python >= 3.7

npm install -g neovim

# 安装插件
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

pipi pynvim neovim pyls-flake8 pylsp-mypy pyls-isort
/Users/wxnacy/.pyenv/versions/3.7.12/bin/python3 -m pip install pynvim
