NB. progressbar demo
NB.
NB. cc prog progressbar [v] [min] [max] [value];
NB.
NB. min,max,value should be integers

coclass 'qtdemo'

NB. =========================================================
PBdemo=: 0 : 0
pc pbdemo closeok escclose;
cc prog progressbar 0 20 7;
)

NB. =========================================================
pbdemo_run=: 3 : 0
P=. jpath '~addons/ide/qt/images/'
wd PBdemo
wd 'pmove 700 10 400 200'
wd 'pshow'
)

NB. =========================================================
pbdemo_run''
smoutput 0 : 0
Try:
  wd 'set prog pos 11'
  wd 'set prog max 30'
)
