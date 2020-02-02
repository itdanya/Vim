colorscheme wombat256mod "Цветовая схема
syntax on
set number
filetype indent plugin on
filetype on
set tabstop=4 
set expandtab 
set shiftwidth=4 
set softtabstop=4
set autoindent
let python_highlight_all = 1
set t_Co=256
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

"Авто комплит по табу
function InsertTabWrapper()
let col = col('.') - 1
if !col || getline('.')[col - 1] !~ '\k'
return "\"
else
return "\<c-p>"
endif
endfunction
imap <c-r>=InsertTabWrapper()"Показываем все полезные опции автокомплита сразу
set complete=""
set complete+=.
set complete+=k
set complete+=b
set complete+=t

"Перед сохранением вырезаем пробелы на концах (только в .py файлах)
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
"В .py файлах включаем умные отступы после ключевых слов
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
"Колоночка, чтобы показывать плюсики для скрытия блоков кода:
set foldcolumn=1
set colorcolumn=80
