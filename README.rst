======
VIMTip
======

VIMTip allows you to display custom tips in your terminal emulations title bar.
This is especially useful for learning new VIM habits, which improve your daily
working cycle.

To set VIMTip up, install the script and configure the following things:

1. A list of tips to use into g:vimtip_tips
2. Events on which the displayed tip should be changed

For example::

    let g:vimtip_tips = []
    call add(g:vimtip_tips, "Minimize horizon. window: <CTRL>+<w> <_>")
    call add(g:vimtip_tips, "Register <*> is middle mouse clipboard")
    call add(g:vimtip_tips, "Minimize vert. window: <CTRL>+<w> <|>")
    call add(g:vimtip_tips, "Search in pman: <SHIFT>+<k>")
    call add(g:vimtip_tips, "Jump to matching brace: <%>")

    autocmd VimEnter * call vimtip#NextTip()
    autocmd WinEnter * call vimtip#NextTip()

This defines 5 tips and makes a tip appear as soon as you start up VIM. In
addition, the tip changes every time you switch windows. Since this would
change the title of your terminal anyway, it does not disturb your normal
working flow.

You can still customize your titlestring using the ``g:vimtip_titlestring``
variable. Use ``{tip}`` to place the tip where you want it. It defaults to::

	let g:vimtip_titlestring = "%<%F%={tip}"

Have fun.


..
   Local Variables:
   mode: rst
   fill-column: 79
   End: 
   vim: et syn=rst tw=79
