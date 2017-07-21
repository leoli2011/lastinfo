" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2011 Apr 15
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=1000		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
"add by leo
set confirm
"set tabstop=4
"set shiftwidth=4
"set expandtab
"set autoindent
"
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set nu
"add for cscope

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

"cs add /home/leoli/nwd_rft/components/networking/net.out /home/leoli/nwd_rft/components/networking
"cs add /home/leoli/nwd_rft/components/firewall/fw.out /home/leoli/nwd_rft/components/firewall
"cs add /home/leoli/nwd_rft/components/wg_linux/wgl.out /home/leoli/nwd_rft/components/wg_linux
"cs add /home/leoli/nwd_rft/components/wgcore/wgc.out /home/leoli/nwd_rft/components/wgcore
"cs add /home/leoli/nwd_rft/components/utm/utm.out /home/leoli/nwd_rft/components/utm/
"cs add /home/leoli/nwd_rft/components/deprecated/dep.out /home/leoli/nwd_rft/components/deprecated/
"cs add /home/leoli/tmp/libxml2-2.9.1/xml.out /home/leoli/tmp/libxml2-2.9.1/
"cs add /home/leoli/ml_linux_laptop/linux/linux.out /home/leoli/ml_linux_laptop/linux/
"cs add /home/leo/mainline_newcastle/components/networking/net.out /home/leo/mainline_newcastle/components/networking/
"cs add /work/leoli/mainline_x86_linux26/components/networking/net.out /work/leoli/mainline_x86_linux26/components/networking/
"cs add /work/leoli/mainline_x86_linux26/components/foundation/fnd.out /work/leoli/mainline_x86_linux26/components/foundation/
"cs add /work/leoli/11.9.1_newport/components/networking/net.out /work/leoli/11.9.1_newport/components/networking/
"cs add /work/leoli/11.9.6_Monroe/components/networking/net.out /work/leoli/11.9.6_Monroe/components/networking/
"cs add /home/leo/mainline_kennewick/components/networking/net.out /home/leo/mainline_kennewick/components/networking
"cs add /home/leo/mainline_kennewick/components/cli/cli.out /home/leo/mainline_kennewick/components/cli/
"cs add /home/leo/mainline_kennewick/components/utm/utm.out /home/leo/mainline_kennewick/components/utm/
"cs add /home/leo/mainline_kennewick/components/wg_linux/wgl.out /home/leo/mainline_kennewick/components/wg_linux
"cs add /home/leo/mainline_kennewick/components/wgcore/wgc.out /home/leo/mainline_kennewick/components/wgcore
"cs add /home/leo/mainline_kennewick/components/firewall/fw.out /home/leo/mainline_kennewick/components/firewall
"cs add /home/leo/mainline_kennewick/components/foundation/fnd.out /home/leo/mainline_kennewick/components/foundation/
"cs add /home/leo/mainline_kennewick/components/snmp/snmp.out /home/leo/mainline_kennewick/components/snmp/
"cs add /home/leo/mainline_kennewick/tps/Xbinder/1.4.4/wg3.0/cmbuild/x86-linux26-eglibc212/include/xbind.out /home/leo/mainline_kennewick/tps/Xbinder/1.4.4/wg3.0/cmbuild/x86-linux26-eglibc212/include
"cs add /home/leo/libnl-3.2.25/nl.out /home/leo/libnl-3.2.25/
"cs add /home/leo/tmp/mptcp/mptcp-mptcp_v0.89/mptcp_89.out /home/leo/tmp/mptcp/mptcp-mptcp_v0.89/
"cs add /home/leo/ivi/MultiModem/ubuntu3.16_mptcp_kernel/ivi.kernel.out /home/leo/ivi/MultiModem/ubuntu3.16_mptcp_kernel/

"cs add /usr/src/linux-source-3.19.0/linux-source-3.19.0/3.19.out /usr/src/linux-source-3.19.0/linux-source-3.19.0/
"cs add /usr/src/linux-source-3.19.0/linux-source-3.19.0/3.19.out /usr/src/linux-source-3.19.0/linux-source-3.19.0/
cs add /home/leo/tmp/mptcp/source_code/libnl-3.2.25/nl.out  /home/leo/tmp/mptcp/source_code/libnl-3.2.25/

"cs add /home/leo/kronos/kernel_ti/ti.kernel.out /home/leo/kronos/kernel_ti/
"cs add /home/leo/ivi/MultiModem/MultiModem_Proxy/redsocks/rs.out /home/leo/ivi/MultiModem/MultiModem_Proxy/redsocks/
"cs add /home/leo/sr1/external/la_proxy/redsocks/red.out  /home/leo/sr1/external/la_proxy/redsocks/
"cs add /home/leo/sr1/kernel/net/mptcp/mptcp.out /home/leo/sr1/kernel/net/mptcp/
"cs add /home/leo/tmp/mptcp/dante-1.4.1/sockd.out /home/leo/tmp/mptcp/dante-1.4.1/
cs add /home/leo/openwrt/external/la_proxy/redsocks/red.out  /home/leo/openwrt/external/la_proxy/redsocks/
cs add /home/leo/openwrt/external/la_module/cmanager/cman.out  /home/leo/openwrt/external/la_module/cmanager/
cs add /home/leo/ivi/MultiModem/MultiModem_Proxy/dante-1.4.1/dan.out /home/leo/ivi/MultiModem/MultiModem_Proxy/dante-1.4.1/
"cs add /home/leo/tmp/usrsctp/usrsctplib/sctp.out /home/leo/tmp/usrsctp/usrsctplib/
cs add /home/leo/tmp/mptcp/source_code/json-c-0.12/json-c.out /home/leo/tmp/mptcp/source_code/json-c-0.12/
cs add /home/leo/tmp/mptcp/source_code/curl-7.50.3/curl.out /home/leo/tmp/mptcp/source_code/curl-7.50.3/
cs add /home/leo/tmp/mptcp/source_code/ipset-6.29/ipset.out /home/leo/tmp/mptcp/source_code/ipset-6.29/
cs add /home/leo/tmp/mptcp/source_code/libevent-2.0.22-stable/libevent.out /home/leo/tmp/mptcp/source_code/libevent-2.0.22-stable/
cs add /home/leo/date_report/vendor/letv/proprietary/cloudclient/libs/data_report/dr.out /home/leo/date_report/vendor/letv/proprietary/cloudclient/libs/data_report

cs add /home/leo/date_report/vendor/letv/proprietary/cloudclient/libs/gb/gb.out /home/leo/date_report/vendor/letv/proprietary/cloudclient/libs/gb
cs add /home/leo/date_report/vendor/letv/proprietary/cloudclient/libs/mqtt3.1.1/mqtt.out /home/leo/date_report/vendor/letv/proprietary/cloudclient/libs/mqtt3.1.1/
cs add /home/leo/date_report/frameworks/base/libs/carinfo_client/carclient.out /home/leo/date_report/frameworks/base/libs/carinfo_client/
cs add /home/leo/openwrt/mmu_project/application/services/VehicleControlservice/ff91.out  /home/leo/openwrt/mmu_project/application/services/VehicleControlservice/
"cs add /home/leo/mainline_kennewick/linux/linux.out /home/leo/mainline_kennewick/linux/
"cs add /work/leoli/11.9.1_xtm330/components/networking/net.out /work/leoli/11.9.1_xtm330/components/networking/
"cs add /work/leoli/bp_vn/netvis/netvis.out /work/leoli/bp_vn/netvis/
"cs add /home/leo/mainline_newcastle/components/firewall/fw.out /home/leo/mainline_newcastle/components/firewall
"cs add /home/leo/mainline_newcastle/components/wg_linux/wgl.out /home/leo/mainline_newcastle/components/wg_linux
"cs add /home/leo/mainline_newcastle/components/wgcore/wgc.out /home/leo/mainline_newcastle/components/wgcore
"cs add /home/leo/mainline_newcastle/components/utm/utm.out /home/leo/mainline_newcastle/components/utm/
"cs add /home/leo/mainline_newcastle/components/deprecated/dep.out /home/leo/mainline_newcastle/components/deprecated/
"cs add /home/leo/mainline_newcastle/components/dynroute/dyc.out /home/leo/mainline_newcastle/components/dynroute/
"cs add /home/leoli/tmp/libxml2-2.9.1/xml.out /home/leoli/tmp/libxml2-2.9.1/
"cs add /home/leoli/tmp/libnet-1.2-rc2/src/libnet.out /home/leoli/tmp/libnet-1.2-rc2/src/
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

    "cscope end
set ignorecase
set nocompatible
"shortcut key
let mapleader=";"
"NERDTree
nmap <Leader>fl :NERDTreeToggle<CR>
let NERDTreeWinSize=20
let NERDTreeWinPos="right"
colorscheme desert

"auto complete
let g:neocomplcache_enable_at_startup = 1
set wildmenu
set wildmode=list:longest,full
set completeopt=longest,menu,preview

set ignorecase
set smartcase
"auto cmd InsertEnter * set noignorecase
"auto cmd InsertLeave * set ignorecase
"
"
"mixed option
set ruler
set nobackup
"set fdm=marker
imap <c-c> <ESC>
imap jj <ESC>
"set laststatus=2
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %l:%c\ \(%p%%\)%)
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

"taglist requirements
filetype on
nmap <Leader>sl :TlistToggle<CR>
let Tlist_File_Fold_Auto_Close=1
"keep grep result
nnoremap <silent> <F3> :redir @a<CR>:g//<CR>:redir END<CR>:new<CR>:put! a<CR>

