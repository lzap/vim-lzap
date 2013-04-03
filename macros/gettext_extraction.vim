"
" Helper vim commands for manual gettext string extraction. Following macros
" are optimized for Ruby language in the following format:
"
" _("string")
" _('string')
" _("One parameter: %s) % (param)
" _("Two or more %{param1} and %{param2}") % { :param1 => 1, :param2 => :xyz }
"
" To use this technique just source this file:
"
" source ./path/to/gettext_extraction.vim
"
" The workflow is simple:
" 
" Search for "strings" and 'strings' using this key and use "n" key to find
" required string you want to convert
" 
map <F12> /["'][^"]*["']<CR>
"
" Once a match is found and the caret is on the first quote, use one of the 
" following keys to wrap _() around
"
map <F5> i_(<ESC>2f"a)<ESC>2F"
map <F6> i_(<ESC>2f'a)<ESC>2F'
"
" If there is one parameter, you can create % () behind the string using this
" key
"
map <F7> mXf"f)a % ()<ESC>`X
"
" And then press this key to change the parameter to %s and move it into
" prepared braces
"
map <F8> mXf#ll"ndt}F#cf}%s<ESC>2f)"nP<ESC>`X
"
" If there are two or more params prepare curly braces behind the string using
" this key
"
map <F9> mXf"f)a % { }<ESC>`X
" 
" And then pres this key multple times to rewrite #{xyz} params to %{xyz}
" params and move them into the hash { :xyz => xyz }
"
map <F10> mXf#ll"ndt}F#cf}%{}<ESC>"nPf%f}i:<ESC>"npa => <ESC>"npa, <ESC>`X
" 
" Note if the params contains @ or @@ you will need to clean this out. Also
" the last macro leaves tailing comma - if you don't like it, remove manually.
"
" The typical key flow is:
" F12 n n n n F6 n n n F5 F7 F8 n n n F5 F9 F10 n n ...
"
