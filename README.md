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
	fzf \
	rg \
	ctags
test -f ~/.vimrc && mv ~/.vimrc ~/.vimrc.backup
curl -s https://raw.githubusercontent.com/lzap/vim-lzap/master/.vimrc -o ~/.vimrc
mkdir ~/.vimbackup

## FZF

By default the configuration makes use of the excellent `fzf` fuzzy file search
tool when Leader-Leader is pressed. It is one of the fastest and the most
accurate file fuzzy searchers out there. By default it searches all files and
directories, it is possible to configure it to use `ag` or `rg` (ripgrep) to
utilize `.gitignore` and similar configuration files for even better results.

To do that, make sure to use the following environmental variable (e.g. in
shell profile):

	export FZF_DEFAULT_COMMAND="rg --files"

Additional directories (e.g. locale commited into git) can go into
$HOME/.ripgrep:

	$ cat .ripgreprc
	--ignore-file=/home/lzap/.agignore

	$ cat .agignore
	/vendor
	/log
	/tmp
	/coverage
	/spec/fixtures
	/public/assets
	/app/assets/javascripts/locale
	/jenkins
	/locale
	/test/reports
	/test/data
	/CHANGELOG
	/tags
	/web/assets
	/test/**/fixtures/**

## Legacy configuration

If you are looking for my old configuration it is here:

https://github.com/lzap/vim-lzap/tree/legacy
