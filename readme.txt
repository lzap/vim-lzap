
Lukas "lzap" Zapletal's 
personal VIM configuration for UNIX and WINDOWS.

WINDOWS

Put the vimfiles directory in the

	Document and settings\user

directory and create file

	Document and settings\user\_vimrc

with this content (one line):

	runtime! _vimrc 

UNIX

Extract the vimfiles directory to your HOME directory and make these links:

	ln -s .vim vimfiles
	ln -s .vimrc vimfiles/_vimrc

You are done.
