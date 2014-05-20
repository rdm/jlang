NB. slider demo
NB.
NB. cc track slider [v] [numeric options]
NB.
NB. numeric options are:
NB. tick style
NB.   0=no ticks
NB.   1=ticks above horizontal, to left of vertical
NB.   2=ticks below horizontal, to right of vertical
NB.   3=ticks both sides
NB. minimum
NB. single step
NB. page step
NB. maximum
NB. position

NB.
NB. min,max,value should be integers

coclass 'qtdemo'

NB. =========================================================
SLdemo=: 0 : 0
pc sliderdemo;
cc track slider 2 0 1 5 20 7;
)

NB. =========================================================
sliderdemo_close=: 3 : 0
wd 'pclose'
showevents_jqtide_ 0
)

NB. =========================================================
sliderdemo_run=: 3 : 0
P=. jpath '~addons/ide/qt/images/'
wd SLdemo
wd 'pmove 700 10 400 200'
wd 'pshow'
)

NB. =========================================================
showevents_jqtide_ 2
sliderdemo_run''
smoutput 0 : 0
Try:
  wd 'set track pos 11'
  wd 'set track max 30'
)
