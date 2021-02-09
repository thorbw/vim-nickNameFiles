# vim-nickNameFiles

Make your own nick names on files and jump to them inside vim with autocompletion.

## Commands


```
:Nick myNickName

:NickSave myNickName

:NickDelete myNickName
```


## Options

Put this in your vimrc if you like:

``` vim
" where to store nickNames (default same directory as plugin)  
" g:nickNameFiles = "path to nickNameFiles.txt"

nnoremap <leader>n :Nick<space>
```

## Install

Use your favorite package manager or use Vim's native way to load plugins:

``` bash
mkdir -p ~/.vim/pack/plugins/start
cd ~/.vim/pack/plugins/start
git clone https://github.com/thorbw/vim-nickNameFiles
```


