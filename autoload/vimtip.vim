" Usage:
" 
" Configuration:
"   let g:vimtip_tips = ["Use tips of the day!", "Make more useful stuff","Be cool!"]
"   let g:vimtip_titlestring = "%<%f%={tip}"
"
" Assign vimtip#NextTip() to an event of your choice, e.g.
"
"   autocmd VimEnter * call vimtip#NextTip()
"   autocmd WinEnter * call vimtip#NextTip()

if (!exists('g:vimtip_tips'))
	let g:vimtip_tips = []
	call add(g:vimtip_tips, "No tips for vimtip configured")
	call add(g:vimtip_tips, "Set g:vimtip_tips")
	call add(g:vimtip_tips, "Configure events for vimtip#NextTip()")
endif

if (!exists('g:vimtip_titlestring'))
	let g:vimtip_titlestring = "%<%f%={tip}"
endif

func! vimtip#SetTip()
	call vimtip#Init()
	let l:tip = substitute(g:vimtip_tips[vimtip#GetTipIndex()], '%', '%%', '')
	let &titlestring = substitute(g:vimtip_titlestring, '{tip}', l:tip, '')
	set title
endfunc

func! vimtip#NextTip()
	call vimtip#Init()
	let g:vimtip_next_tip += 1
		let g:vimtip_next_tip = g:vimtip_next_tip % len(g:vimtip_tips)
	call vimtip#SetTip()
	return g:vimtip_next_tip
endfunc

func! vimtip#GetTipIndex()
	call vimtip#Init()
	return g:vimtip_next_tip
endfunc

func! vimtip#Init()
	if (!exists("g:vimtip_next_tip"))
		let g:vimtip_next_tip = -1
	endif
endfunc
