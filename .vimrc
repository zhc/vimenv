"Установка менеджера плагинов vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin("~/.vim/plugged")
"Git
Plug 'tpope/vim-fugitive'
"Автодополнение кода
Plug 'ycm-core/YouCompleteMe'
"Для линтеров
Plug 'vim-syntastic/syntastic'
"Для терминала расцветка
Plug 'jnurmine/Zenburn'
"Для GUI расцветка
Plug 'altercation/vim-colors-solarized'
"Статусная строка
Plug 'vim-airline/vim-airline'
call plug#end()


"Выставить расцветку для терминала
colorscheme zenburn


"russian input
set keymap=russian-jcukenwin 
"default insert english input
set iminsert=0
"default search english input
set imsearch=0
"подсветка найденного текста
set hlsearch
"инкрементальный поиск
set incsearch
"поиск без кейс по умолчания, если написать 
"что-то с большой то будет искать по кейсу
set ignorecase
set smartcase
"Относительный номер строки и правильный номер строки
set relativenumber
set number
"отступ в 4 пробела
set shiftwidth=4
set tabstop=4
set expandtab
"заменить звук на вспышку
set visualbell
"показывать дополнения в менюшке
set wildmenu
"добавить в поиск подпапки
set path+=**

"Настройки дефолтного браузера файлов
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25


"YCM по умолчанию загружать .ycm_extra_conf.py
let g:ycm_confirm_extra_conf = 0


"syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_python_flake8_exec=''
"let g:syntastic_python_checkers=['flake8']


"команда для создания индекса тегов
"command -bar CtagsExecute silent !ctags -R * 2> /dev/null &
command -bar CtagsExecute silent !ctags -R --languages=python * 2> /dev/null &
command -bar CtagsRedraw redraw!
command Ctags CtagsExecute|CtagsRedraw

"для юниттестирования питон файлов
if has("autocmd")
    autocmd FileType python setlocal makeprg=python\ -m\ unittest\  
    autocmd FileType python compiler pyunit
endif

"переназначение клавиш
imap <F12> <C-^>
cmap <F12> <C-^>
nmap <F2> :Vex<CR>
