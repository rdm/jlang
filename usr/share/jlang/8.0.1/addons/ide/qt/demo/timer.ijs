NB. timer
NB.
NB. argument is milliseconds

coclass 'qtdemo'

timer=: 3 : 0
if. y do.
  sys_timer_z_=: 3 : 'smoutput 6!:0$0'
  wd 'timer ',":y
else.
  wd 'timer 0'
  sys_timer_z_=: ]
end.
EMPTY
)

NB. =========================================================
smoutput 0 : 0
start, e.g. every two seconds:
   timer_qtdemo_ 2000

stop:
   timer_qtdemo_ 0
)
