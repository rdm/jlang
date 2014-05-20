NB. mb (message box) demo
NB.
NB. the message box syntax is:
NB.   wd 'mb type buttons title message'
NB.
NB. type specifies the icon and default behaviour:
NB.  info      (default OK button)
NB.  warn      (default OK button)
NB.  critical  (default OK button)
NB.  query     (requires two or three buttons, default is first given)
NB.             note - display order is platform-dependent
NB.
NB. if 1 buttons, there is no result,
NB. otherwise the result is the button numeric value
NB.
NB. buttons (with numeric values) are from the set:
NB.  0 mb_ok
NB.  1 mb_cancel
NB.  2 mb_yes
NB.  3 mb_no
NB.  4 mb_save
NB.  5 mb_discard

coclass 'qtdemo'

demo1=: 3 : 0
wd 'mb info *Job finished.',LF,LF,'Goodbye.'
)

demo2=: 3 : 0
wd 'mb warn "Model Run" "Job finished early."'
)

demo3=: 3 : 0
wd 'mb critical "Model Run" "Job failed."'
)

demo4=: 3 : 0
wd 'mb query mb_ok mb_cancel "Model Run" "OK to save?"'
)

demo5=: 3 : 0
wd 'mb query mb_yes mb_no mb_cancel "Model Run" "OK to continue?"'
)

demo1''
demo2''
demo3''
smoutput demo4''
smoutput demo5''
