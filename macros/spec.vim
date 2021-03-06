let g:packager="Lukas Zapletal <lzap+rpm@redhat.com>"

map <F5> :wa<CR>:!rpmbuild --define '_source_filedigest_algorithm md5' --define '_binary_filedigest_algorithm md5' --define 'dist .el5' -bs %<CR>
map <F6> :wa<CR>:!rpmbuild -bs %<CR>
map <F7> :wa<CR>:!rpmbuild -bc --short-circuit %<CR>
map <F8> :wa<CR>:!rpmbuild -bb %<CR>

map <F9> O<C-R>=strftime("%a %b %d %Y")<CR> Lukas Zapletal <lzap+rpm[@]redhat.com> - <CR><Esc>
map <F10> :%s/$RPM_BUILD_ROOT/%{buildroot}/g<CR>
"map <F10> :%s/%{buildroot}/$RPM_BUILD_ROOT/g<CR>
