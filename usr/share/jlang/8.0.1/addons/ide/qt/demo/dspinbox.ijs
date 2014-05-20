NB. dspinbox demo
NB.
NB. cc track dspinbox [numeric options]
NB.
NB. numeric options are:
NB. minimum
NB. single step
NB. maximum
NB. value

NB.
NB. all numeric options should be integers

coclass 'qtdemo'

NB. =========================================================
DSPdemo=: 0 : 0
pc dspinboxdemo;
cc track dspinbox _20 0.5 20 7.5;
)

NB. =========================================================
dspinboxdemo_close=: 3 : 0
wd 'pclose'
showevents_jqtide_ 0
)

NB. =========================================================
dspinboxdemo_run=: 3 : 0
P=. jpath '~addons/ide/qt/images/'
wd DSPdemo
wd 'pmove 700 10 400 200'
wd 'pshow'
)

NB. =========================================================
showevents_jqtide_ 2
dspinboxdemo_run''
smoutput 0 : 0
Try:
  wd 'set track value 11'
  wd 'set track max 30'
)
