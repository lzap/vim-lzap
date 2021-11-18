# Sane Vim configuration

As much as "vanilla" configuration as possible for Vim 8.2+ with only plugins
which are avaialble in Fedora 35+.

## Safe installation

        dnf install --allowerasing vim-default-editor \
                vim-enhanced \
                vim-ctrlp \
                vim-airline \
                vim-trailing-whitespace \
                vim-fugitive \
                vim-ale \
                ctags
        test -f ~/.vimrc && mv ~/.vimrc ~/.vimrc.backup
        curl -s https://raw.githubusercontent.com/lzap/vim-lzap/master/.vimrc -o ~/.vimrc
        mkdir ~/.vimbackup

## Legacy configuration

If you are looking for my old configuration it is here:

https://github.com/lzap/vim-lzap/tree/legacy
