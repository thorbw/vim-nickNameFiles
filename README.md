# vim-nickNameFiles

Make your own nick names on files and jump to them inside vim with autocompletion.

## Commands

:Nick \<nickName\>

:NickSave \<nickName\>

:NickDelete \<nickName\>

all with autocompletion


## Options

Put this is your vimrc if you like:

``` vim
" where to store nickNames (default same dir as plugin)  
" g:nickNameFiles = "\<path to nickNameFiles.txt\>"

nnoremap <leader>n :Nick\<space\>
```

## Install

Use your favorite package manager or use Vim's built in package support.

``` bash
mkdir -p ~/.vim/pack/plugins/start
cd ~/.vim/pack/plugins/start
git clone https://github.com/thorbw/vim-nickNameFiles
```


