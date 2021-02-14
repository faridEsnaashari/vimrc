" vim backup files store in '~/.vim/backups'
set directory=~/.vim/backups

"active mouse
set mouse=a

" open this vim config file(~/.vimrc) in new tab when execute ':Vimrc' in
" command mode
command! Vimrc tabe ~/.vimrc

" show entered command in right bottom of the screen
set showcmd

set encoding=UTF-8

" these settings are about indentation. with these settings, indentation in
" files are 4 space.
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set expandtab
set smartindent

" enable line number in the left of the files when they open.
set number

" I don't know what exactly are these but I believe that I use these to setup
" powerline(bottom bar, that shows some details about opened file).
set background=dark
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256

" highlight next search result when typing search key word if any exists.
set incsearch

" remove highlight search results in whole file.
set nohlsearch
" remove highlight from search results by one tab on space button. and
" reEnable it by two times tab on space button
nmap <Space> :set nohlsearch<CR>
nmap <Space><Space> :set hlsearch<CR>

" ignore letters case in search results
set ic
" count letters case in search results by tab 'ctrl-i' and ignore
" letters case in search results by tab 'crtl-i-i'
nmap <C-i> :set noic<CR>
nmap <C-i><C-i> :set ic<CR>

" enable syntax colors for different file types
syntax on


" by default when open a new window vertically or horizontally, vim focuses on
" current window yet. if you want vim change focuses to the opened window, these
" two lines help you with this.
set splitbelow
set splitright


" these are plugins the I installed. there are different ways to install
" plugins in vim. for use this way, execute this:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" then run this command in vim:
" :PlugInstall
call plug#begin('~/.vim/plugged')
"   this one is a greate file explorer. its configurations are at in the following
    Plug 'preservim/nerdtree'

"   this is a nice aireline(a bar shows in bottom of opened buffers and
"   provide us some details about opened buffer)
    Plug 'vim-airline/vim-airline'

"   tabs management
    Plug 'jistr/vim-nerdtree-tabs'

"   this one gives you a nice experience when do somethings with pairs(pairs mean: '', "", {}, [], (), etc)
    Plug 'jiangmiao/auto-pairs'

"   a wonderful plugin for use nerdtree and git. it shows you different icons
"   for different state of git about each file or directory.(shows you
"   different git states like: indexed, untracked, bothModified, staged, etc)
    Plug 'Xuyuanp/nerdtree-git-plugin'

"   a tool uses for closeing html tags when write opened pair
    Plug 'alvan/vim-closetag'

"   shows proper icons for different types of files(for showing all icons
"   currectly you should install proper fonts and use it in terminal. 
"   I find DejaVu Sans Mono Nerd Font Complete Mono suitable after a lot searching. I provide it in this repo and you can download and install it
    Plug 'ryanoasis/vim-devicons'

"   these four cool plugins provide nice things that make it easy to work with
"   js, ts, jsx and graphql. you can find appropriate plugins about your needs
    Plug 'pangloss/vim-javascript'    
    Plug 'leafgarland/typescript-vim' 
    Plug 'maxmellon/vim-jsx-pretty'   
    Plug 'jparise/vim-graphql'

"   a nice tool for auto compliation and some stuff like that, that make vim a
"   nice IDE for you
    Plug 'neoclide/coc.nvim' , { 'branch' : 'release'  }
call plug#end()


" these configs are about airLine plugin. I spend some time and set these for
" my self. you can get more details on https://github.com/vim-airline/vim-airline and customize for you own 
let g:airline_powerline_fonts = 1
let g:airline_theme = 'dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_tab_count = 2
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
" use crtl-l and crtl-h for moving between opened tabs
map <C-l> <Plug>AirlineSelectNextTab
map <C-h> <Plug>AirlineSelectPrevTab

" press ctrl-n to open or close nerdtree(the plugin I installed that use as
" file explorer)
nmap <C-n> :NERDTreeTabsToggle<CR><S-r><ESC>

" nerdtree doesn't show files with .meta type(I work with unity and unity
" create these meta files)
" you can other types of files that you don't want to show on nerdtree
let NERDTreeIgnore=['\.meta$']

" use crtl-shift-d to delete a file when you on nerdtree window.
nmap <C-S-d> md
" use crtl-shift-a to create a new file or directory when you on nerdtree window.
nmap <C-S-a> ma

" copy and paste is a little tricky on vim. addition to usual vim copy and
" paste, you can copy something with ctrl-shift-y to copy that thing to system
" clipboard(you should be sure that your version of vim supports clipboard. I
" use vim-gnome and it is ok)
map <C-S-y> "+y
" use ctrl-shift-p to paste form system clipboard to your opened files
map <C-S-p> :set paste<CR>"+p:set nopaste<CR>

" this hide '[' and ']' charackters from nerdtree. if don't use this all icons
" in nerdtree sourended by []
augroup nerdtreeconcealbrackets
      autocmd!
      autocmd FileType nerdtree syntax match hideBracketsInNerdTree "\]" contained conceal containedin=ALL
      autocmd FileType nerdtree syntax match hideBracketsInNerdTree "\[" contained conceal containedin=ALL
      autocmd FileType nerdtree setlocal conceallevel=3
      autocmd FileType nerdtree setlocal concealcursor=nvic
augroup END


" these configs set color for different types of files in nerdtree.
 function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
 endfunction

   call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
   call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
   call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
   call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
   call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
   call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
   call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
   call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
   call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
   call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
   call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
   call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
   call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
   call NERDTreeHighlightFile('cs', 'green', 'none', 'green', 'green')
   call NERDTreeHighlightFile('ts', 'cyan', 'none', 'cyan', 'cyan')
   



""""""""""""""""""""""""""""""""""
"coc(autoCompletation) config
""""""""""""""""""""""""""""""""""
" disable any warning about coc when open a file.
let g:coc_disable_startup_warning = 1






""""""""""""""""""""""""""""""""""
"snippets
""""""""""""""""""""""""""""""""""

"Debug.Log() unity
"press ,db to print Debug.Log()
nnoremap ,db <Esc>:read ~/.vim/snippet/unity/DebugLog.txt<CR>==f)i

"Console.WriteLine() c#
"press ,cw to print Console.WriteLine()
nnoremap ,cw <Esc>:read ~/.vim/snippet/consolewriteline.txt<CR>==f)i

"Console.Write() c#
"press ,cdw to print Console.Write()
nnoremap ,cdw <Esc>:read ~/.vim/snippet/consolewrite.txt<CR>==f)i

"for loop c#
"press ,fl to print a c# for loop
nnoremap ,fl <Esc>:read ~/.vim/snippet/forLoop.txt<CR><S-v>2j=f<a

"while loop c#
"press ,wl to print a c# while loop
nnoremap ,wl <Esc>:read ~/.vim/snippet/whileLoop.txt<CR><S-v>2j=f)i

"console.log js
"press ,cl to print a console.log()
nnoremap ,cl <Esc>:read ~/.vim/snippet/consolelog.txt<CR>==f)i

"console.error js
"press ,ce to print a console.error()
nnoremap ,ce <Esc>:read ~/.vim/snippet/consoleerror.txt<CR>==f)i

"trycatch js
"press ,tc to print a js try catch
nnoremap ,tc <Esc>:read ~/.vim/snippet/tryCatch.txt<CR><S-v>3j=o

"htmlStructure js
"press ,html to print a simple html structure
nnoremap ,html <Esc>:read ~/.vim/snippet/html.txt<CR><S-v>10j=7jo

"htmlFormStructure js
"press ,form to print a simple html form structure
nnoremap ,form <Esc>:read ~/.vim/snippet/form.txt<CR><S-v>4j=3ei

""""""""""""""""""""""""""""""""""
"commenter
""""""""""""""""""""""""""""""""""

"commenter
" select some lines and use crtl-c-c to comment them. this is for C base
" programming language(c#, java, c++, js, ts, etc)
xmap <expr> <C-c>c mode() ==# "\<C-V>" ? "0<S-i>//<Esc>":"<C-v>0<S-i>//<Esc>"
xmap <expr> <C-c>cu mode() ==# "\<C-V>" ? "0<S-o>0lx<Esc>":"<C-v>0<S-o>0lx<Esc>"
