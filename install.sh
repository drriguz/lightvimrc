#! /bin/bash
install_pathogen(){
    if ! mkdir -p ~/.vim/autoload ~/.vim/bundle; then
        echo "X  failed to create vim folders"
        exit -1
    fi
    if ! [ -f ~/.vim/autoload/pathogen.vim ]; then
        echo "-> installing pathogen..."
        curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
    fi
    if [ -f ~/.vim/autoload/pathogen.vim ]; then
        echo "√  pathogen"
    else
        echo "X  failed to install pathogen."
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
        echo "X  installation failed!"
        exit -1
    else
        echo "√  ${name}"
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
