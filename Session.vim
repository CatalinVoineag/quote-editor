let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/code/play/quote-editor
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
$argadd ~/code/play/quote-editor
edit app/views/quotes/_form.html.erb
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 69 + 70) / 140)
exe 'vert 2resize ' . ((&columns * 70 + 70) / 140)
argglobal
balt test/system/quotes_test.rb
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=10
setlocal fml=1
setlocal fdn=10
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 35) / 71)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
lcd ~/code/play/quote-editor
wincmd w
argglobal
if bufexists("~/code/play/quote-editor/app/views/quotes/new.html.erb") | buffer ~/code/play/quote-editor/app/views/quotes/new.html.erb | else | edit ~/code/play/quote-editor/app/views/quotes/new.html.erb | endif
if &buftype ==# 'terminal'
  silent file ~/code/play/quote-editor/app/views/quotes/new.html.erb
endif
balt ~/code/play/quote-editor/app/controllers/quotes_controller.rb
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=10
setlocal fml=1
setlocal fdn=10
setlocal fen
2
normal! zo
let s:l = 3 - ((2 * winheight(0) + 35) / 71)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 3
normal! 0
lcd ~/code/play/quote-editor
wincmd w
exe 'vert 1resize ' . ((&columns * 69 + 70) / 140)
exe 'vert 2resize ' . ((&columns * 70 + 70) / 140)
tabnext 1
badd +10 ~/code/play/quote-editor/app/views/quotes/new.html.erb
badd +0 ~/code/play/quote-editor
badd +13 ~/code/play/quote-editor/app/views/quotes/index.html.erb
badd +4 ~/code/play/quote-editor/app/models/quote.rb
badd +40 ~/code/play/quote-editor/Gemfile
badd +27 ~/code/play/quote-editor/Session.vim
badd +53 ~/code/play/quote-editor/app/controllers/quotes_controller.rb
badd +5 ~/code/play/quote-editor/config/cable.yml
badd +12 ~/code/play/quote-editor/app/views/quotes/_quote.html.erb
badd +5 ~/code/play/quote-editor/test/system/quotes_test.rb
badd +8 ~/code/play/quote-editor/app/views/quotes/edit.html.erb
badd +6 ~/code/play/quote-editor/app/views/quotes/show.html.erb
badd +1 ~/code/play/quote-editor/app/views/quotes/destroy.turbo_stream.erb
badd +1 ~/code/play/quote-editor/app/views/quotes/create.turbo_stream.erb
badd +1 ~/code/play/quote-editor/test/models/quote_test.rb
badd +0 ~/code/play/quote-editor/app/views/quotes/_form.html.erb
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOF
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
