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

# 安装插件
# git clone --depth 1 https://github.com/wbthomason/packer.nvim\
# ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# pipi pynvim neovim pyls-flake8 pylsp-mypy pyls-isort
# npm install -g neovim
# /Users/wxnacy/.pyenv/versions/3.7.12/bin/python3 -m pip install pynvim

# npm install jsonlint -g     # json lint
# npm install --save-dev stylelint stylelint-config-standard -g
# brew install google-java-format

# has_command() {
# command -v $1
# }
# sudo pacman -S base-devel

# For mason: python-pip npm wget go
# mason install markdownlint 失败解决
# https://blog.csdn.net/qq_35485875/article/details/120168944
basic_softs="gcc git wget unzip"
python_softs="python python-pynvim python-pip"
go_softs="go"
node_softs="neovim npm"
softs="${basic_softs} ${python_softs} ${go_softs} ${node_softs}"

can_install='true'

install_arch() {
	echo 'Installing for archlinux'
	echo ''
	for i in $basic_softs; do
		path=$(sudo pacman -Q $i)
		if [[ $path ]]; then
			echo "Installed $path"
		else
			sudo pacman -S $i
		fi
	done
}

install_ubuntu() {
	echo 'Installing for ubuntu'
	echo ''
    # 更新软件
    apt update
    # 下载新版 neovim
    apt install -y software-properties-common
    add-apt-repository ppa:neovim-ppa/stable
    apt update
    apt install -y neovim
	for i in $basic_softs; do
        if [[ $(command -v $i >/dev/null 2>&1 && echo true  || { echo ""; }) ]]
        then
			echo "Installed $path"
		else
			apt install -y $i
		fi
	done
}

install_linux() {
    if [[ -f /etc/os-release ]]; then
        source /etc/os-release
        case $ID in
        arch)
            install_arch
            ;;
        ubuntu)
            install_ubuntu
            ;;
        *)
            can_install='false'
            ;;
        esac

    fi
}

install_macos() {
    if [[ $(command -v brew >/dev/null 2>&1 && echo true  || { echo ""; }) ]]
    then
        for soft in ${softs}; do
            brew install ${soft}
        done

    else
        echo '需要先安装 brew 才能继续 https://mirrors.tuna.tsinghua.edu.cn/help/homebrew/'
    fi
}

install() {
    platform=$(uname -s)
    case $platform in
    Linux)
        install_linux
        ;;
    Darwin)
        install_macos
        ;;
    *)
        can_install='false'
        ;;
    esac
}

main() {
	# 安装必要工具
	install
	if [[ $can_install == 'false' ]]; then
		echo '不支持的平台'
		return
	fi
	# 下载 wnvim
	if [[ ! -d ~/.config/nvim ]]; then
		echo '下载 nvim'
		git clone -b dev_sync_2023-03-20 --depth 1 https://github.com/wxnacy/wnvim ~/.config/nvim
	fi
}

main
