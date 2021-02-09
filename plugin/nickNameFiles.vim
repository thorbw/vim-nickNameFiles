" vim-nickNameFiles - nick name your most used files
" Maintainer: thorbw <https://github.com/thorbw/vim-nickNameFiles>



if !exists("g:nickNameFiles")
    " nicks and paths will be stored in current file directory
    let g:nickNameFiles = expand('<sfile>:p:h') . '/nickNameFiles.txt'
endif

" create a file for saved name with filepath if it does not exist already
call  writefile([], g:nickNameFiles, "a")



function! LoadNicks()
    let s:dict_nicks = {}
    let s:nick_names = ""
    let l:nick_names_and_path = readfile(g:nickNameFiles)
    for line in l:nick_names_and_path
        let l:s = split(line)
        let s:dict_nicks[l:s[0]] = l:s[1]
        let s:nick_names = s:nick_names . l:s[0] . "\n"
    endfor
endfunction

" Read from file and load all nicks when vim starts
call LoadNicks()

function! UpdateNicks()
    " create new empty file (just remove the old one if exist)
    call  writefile([], g:nickNameFiles)
    let s:nick_names = ""
    for [key, value] in items(s:dict_nicks)
        let l:name_and_path = key . ' ' . value
        call  writefile([l:name_and_path], g:nickNameFiles, "a")
        let s:nick_names = s:nick_names . key . "\n"
    endfor
endfunction


function! OpenFile(tag)
    execute ':e ' .  s:dict_nicks[split(a:tag)[0]]
endfunction

command! -complete=custom,AutoCompleteNicks -nargs=1 Nick call OpenFile(<f-args>)
function! AutoCompleteNicks(A, L, P)
    return s:nick_names
endfunction


function! DeleteNick(tag)
    if has_key(s:dict_nicks, a:tag)
        unlet s:dict_nicks[a:tag]
        call UpdateNicks()
    endif
endfunction

command! -complete=custom,AutoCompleteNicks -nargs=1 NickDelete call DeleteNick(<f-args>)
function! AutoCompleteNicks(A, L, P)
    return s:nick_names
endfunction


function! SaveNick(tag)
    if len(split(a:tag)) == 1
        let l:current_path = expand('%:p')
        let s:dict_nicks[a:tag] = l:current_path
        call UpdateNicks()
    else
        echo 'not valid nick name: ' . a:tag
    endif
endfunction

command! -complete=custom,AutoCompleteNicks -nargs=1 NickSave call SaveNick(<f-args>)
function! AutoCompleteNicks(A, L, P)
    return s:nick_names
endfunction

