" =============================================================================
" File:          autoload/ctrlp/sample.vim
" Description:   Example extension for ctrlp.vim
" =============================================================================

" You can rename anything that has 'sample' in it.
" ctrlp only looks for g:ctrlp_ext_vars
"
"
" To load this extension into ctrlp, add this to your vimrc:
"
"     let g:ctrlp_extensions = ['sample']
"
" 'sample' is the name of the file 'sample.vim'
"
" For multiple extensions:
"
"     let g:ctrlp_extensions = [
"         \ 'my_extension',
"         \ 'my_other_extension',
"         \ 'someone_elses_extension',
"         \ ]


" Change the name of the g:loaded_ variable to make it unique
if ( exists('g:loaded_ctrlp_sample') && g:loaded_ctrlp_sample )
	\ || v:version < 700 || &cp
	fini
endif
let g:loaded_ctrlp_sample = 1


" The main variable for this extension.
"
" The values are:
" + the name of the input function (including the brackets and any argument)
" + the name of the action function (only the name)
" + the long and short names to use for the statusline
" + the matching type: line, path, tabs, tabe
"                      |     |     |     |
"                      |     |     |     `- match last tab delimited str
"                      |     |     `- match first tab delimited str
"                      |     `- match full line like file/dir path
"                      `- match full line
let s:sample_var = {
	\ 'init': 'ctrlp#sample#init()',
	\ 'accept': 'ctrlp#sample#accept',
	\ 'lname': 'long statusline name',
	\ 'sname': 'shortname',
	\ 'type': 'line',
	\ }


" Append s:sample_var to g:ctrlp_ext_vars
if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
	let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:sample_var)
else
	let g:ctrlp_ext_vars = [s:sample_var]
endif


" Provide a list of strings to search in
"
" Return: a Vim's List
func! ctrlp#sample#init()
	let input = [
		\ 'Sed sodales fri magna, non egestas ante consequat nec.',
		\ 'Aenean vel enim mattis ultricies erat.',
		\ 'Donec vel ipsummauris euismod feugiat in ut augue.',
		\ 'Aenean porttitous quam, id pellentesque diam adipiscing ut.',
		\ 'Maecenas luctuss ipsum, vitae accumsan magna adipiscing sit amet.',
		\ 'Nulla placerat  ante, feugiat egestas ligula fringilla vel.',
		\ ]
	retu input
endfunc


" The action to perform on the selected string.
"
" Arguments:
"  a:mode   the mode that has been chosen by pressing <cr> <c-v> <c-t> or <c-x>
"           the values are 'e', 'v', 't' and 'h', respectively
"  a:str    the selected string
func! ctrlp#sample#accept(mode, str)
	" For this example, just exit ctrlp and run help
	cal ctrlp#exit()
	help ctrlp-extending
endfunc


" Give the extension an ID
let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
" Allow it to be called later
func! ctrlp#sample#id()
	retu s:id
endfunc


" Create a command to directly call the new search type.
"
" Put something like this in vimrc or plugin/sample.vim
" com! CtrlPSample cal ctrlp#init(ctrlp#sample#id())


" vim:fen:fdl=0:ts=2:sw=2:sts=2
