NB. spinbox demo
NB.
NB. cc int spinbox [numeric options]
NB.
NB. numeric options are:
NB. minimum
NB. single step
NB. maximum
NB. value
NB.
NB. cc double dspinbox [numeric options]
NB.
NB. numeric options are:
NB. decimal places
NB. minimum
NB. single step
NB. maximum
NB. value

coclass 'qtdemo'

NB. =========================================================
SPdemo=: 0 : 0
pc spinboxdemo;
cc int spinbox _20 1 20 7;
cc double dspinbox 2 _200 10.5 200 7;
)

NB. =========================================================
spinboxdemo_close=: 3 : 0
wd 'pclose'
showevents_jqtide_ 0
)

NB. =========================================================
spinboxdemo_run=: 3 : 0
P=. jpath '~addons/ide/qt/images/'
wd SPdemo
wd 'pmove 700 10 400 200'
wd 'pshow'
)

NB. =========================================================
showevents_jqtide_ 2
spinboxdemo_run''
smoutput 0 : 0
Try:
  wd 'set int value 11'
  wd 'set int max 30'
  wd 'set double value 11'
  wd 'set double max 30'
)
