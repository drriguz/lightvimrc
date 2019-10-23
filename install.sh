#! /bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

current_dir=`pwd`
command=$1

install_pathogen(){
    if ! mkdir -p ~/.vim/autoload ~/.vim/bundle; then
        echo -e "${RED}X${NC}  failed to create vim folders"
        exit -1
    fi
    if ! [ -f ~/.vim/autoload/pathogen.vim ]; then
        echo "-> installing pathogen..."
        curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
    fi
    if [ -f ~/.vim/autoload/pathogen.vim ]; then
        echo -e "${GREEN}√${NC}  pathogen"
    else
        echo -e "${RED}X${NC} failed to install pathogen."
        exit -1
    fi
}

install_bundle(){
    local url=$1
    local name=${1##*/}
    name=${name/".git"/}
    local install_dir="${HOME}/.vim/bundle/${name}"
    if ! [ -d $install_dir ]; then
        echo "-> installing ${name} to ${install_dir}..."
        git clone $url $install_dir
    fi
    if ! [ -d $install_dir ]; then
        echo -e "\t${RED}X${NC}  installation failed!"
        exit -1
    elif [ "${command}" = "-update" ]; then
        echo -e "\tFound existing ${name}, trying to update..."
        cd ${install_dir} && git pull 
        echo -e "${GREEN}√${NC} ${name}"
    fi
}
install_pathogen
install_bundle "https://github.com/altercation/vim-colors-solarized.git"
install_bundle "https://github.com/ervandew/supertab.git"
install_bundle "https://github.com/scrooloose/nerdtree.git"
install_bundle "https://github.com/dkprice/vim-easygrep.git"
install_bundle "https://github.com/junegunn/limelight.vim.git"
install_bundle "https://github.com/junegunn/goyo.vim.git"
install_bundle "https://github.com/itchyny/lightline.vim.git"
install_bundle "https://github.com/vim-scripts/mru.vim.git"
install_bundle "https://github.com/amix/open_file_under_cursor.vim.git"
install_bundle "https://github.com/tpope/vim-commentary.git"
install_bundle "https://github.com/jlanzarotta/bufexplorer.git"
install_bundle "https://github.com/rust-lang/rust.vim.git"

echo "Updating vimrc..."
cp ${current_dir}/_vimrc ~/.vimrc
