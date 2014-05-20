NB. msgs
NB.

coclass 'qtdemo'

NB. =========================================================
msgs=: 3 : 0
wd 'pc msgs'
wd 'cc ms checkbox;cn "smoutput immediately";'
wd 'cc bu button;cn start;'
wd 'cc prog progressbar 0 10 10'
wd 'pshow'
)

NB. =========================================================
msgs_bu_button=: 3 : 0
closef=: 0
usemsgs=. 0 ". ms
for_i. i.11 do.
  if. closef do. break. end.
  wd 'set prog pos ', ":10-i
  smoutput 10-i
  wd^:usemsgs 'msgs'
  6!:3[1
end.
)

NB. =========================================================
msgs_close=: 3 : 0
closef=: 1
wd 'pclose'
)

NB. =========================================================
msgs''
