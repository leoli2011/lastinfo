"基础设置
set nocompatible              "去除兼容vi
set number                    "显示行号
set nobackup                  "禁止生成临时文件
syntax on                     "语法高亮
set hlsearch                  "搜索高亮
set incsearch                 "增量搜索
set backspace=indent,eol,start "允许使用退格键
set tabstop=4                 "设置Tab宽度
set shiftwidth=4              "设置自动对齐空格数
set expandtab                 "将Tab键自动转换成空格 真正需要Tab键时使用[Ctrl + V + Tab]
set ignorecase                "搜索时 忽略大小写
set fencs=utf-8,ucs-bom,shift-jis,GB2312,GBK,gb18030,gbk,gb2312,cp936 "支持的字符集
set softtabstop=4             "设置按退格键时可以一次删除4个空格

set smarttab
set showfulltag
imap jj <ESC>
filetype off
autocmd FileType c,cpp :set smartindent

"programmer
ab #d #define
ab #i #include

let g:ycm_global_ycm_extra_conf = '/home/leo/.vim/.ycm_extra_conf.py' 
let g:ycm_server_python_interpreter='/usr/bin/python'

"vundle setting
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'

Plugin 'SirVer/ultisnips'       "这个是片段补全引擎
Plugin 'honza/vim-snippets'     "这个是片段集合
" for AUTO PAIRS auto complete ()
Plugin 'jiangmiao/auto-pairs'


Plugin 'kien/ctrlp.vim'

call vundle#end()            " required
filetype plugin indent on    " required

"add for cscope
"cscope configuration
if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
endif

"cs add /home/andbase/workspace/source/mqtt3.1.1/mqtt.out /home/andbase/workspace/source/mqtt3.1.1/
	nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

	" Using 'CTRL-spacebar' then a search type makes the vim window
	" split horizontally, with search result displayed in
	" the new window.

	nmap <C-p>s :scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-p>g :scs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-p>c :scs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-p>t :scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-p>e :scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-p>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-p>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-p>d :scs find d <C-R>=expand("<cword>")<CR><CR>

	" Hitting CTRL-space *twice* before the search type does a vertical
	" split instead of a horizontal one

	nmap <C-p><C-p>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-p><C-p>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-p><C-p>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-p><C-p>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-p><C-p>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-p><C-p>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>

	nmap <C-p><C-p>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>

"Ultisnips 配置
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"                                      "触发补全代码片段
let g:UltiSnipsJumpForwardTrigger="<c-j>"                                 "调到下一个补全处
let g:UltiSnipsJumpBackwardTrigger="<c-k>"                                "调到上一个补全处
let g:UltiSnipsListSnippets= "<c-l>"                                      "列出补全列表
let g:UltiSnipsEditSplit="vertical"                                       " If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsSnippetsDir = '~/.vim/bundle/vim-snippets/UltiSnips'       "定义补全集合文件目录
let g:UltiSnipsSnippetDirectories=$HOME.'/.vim/bundle/vim-snippets/UltiSnips' "定义的查找目录名, 定义成绝对路径

"Auto pairs 配置
let g:AutoPairsMoveCharacter = "()[]{}\"'"  " 跳出()用）其它类似


let g:ycm_confirm_extra_conf = 0
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
let g:ycm_complete_in_strings = 1


let g:ycm_goto_buffer_command = 'horizontal-vsplit' "跳转打开新的分屏 :e#退出分屏
let mapleader = '\'                                 "命令模式,\df跳转到定义,\dc跳转到声明,\de任意找
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR> "跳转到定义，没有定义调到声明
nnoremap <leader>i :YcmCompleter GoToInclude<CR> "跳转到头文件
nnoremap <leader>t :YcmCompleter GetType<CR> " 得到光标处变量类型
"nnoremap <leader>gp :YcmCompleter GetParent<CR>
nmap <F4> :YcmDiags<CR>
"g:ycm_collect_identifiers_from_tags_files = 1

let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
let g:ycm_autoclose_preview_window_after_completion = 1

"This assumes your kernel directory has the word 'kernel'
if getcwd() =~ "kernel"
    let g:ycm_global_ycm_extra_conf='~/ycm_extra_conf_kernel.py'
else
    let g:ycm_global_ycm_extra_conf='/home/leo/.vim/.ycm_extra_conf.py'
endif
        

