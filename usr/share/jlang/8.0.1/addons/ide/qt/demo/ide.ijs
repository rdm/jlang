NB. ide
NB. show/hide ide

coclass 'qtdemo'

NB. =========================================================
Idemo=: 0 : 0
pc idemo ptop;
cc show button;cn "Toggle show/hide the J Qt Ide";
cc closeonly button;cn "Close dialog, no change to Ide state";
cc closeshow button;cn "Close dialog and show Ide";
)

NB. =========================================================
idemo_run=: 3 : 0
IShow=: 0
wd 'ide hide'
wd Idemo
wd 'pmove 400 100 300 50'
wd 'pshow'
)

NB. =========================================================
idemo_show_button=: 3 : 0
IShow=: -.IShow
wd 'ide ', IShow pick 'hide';'show'
)

NB. =========================================================
idemo_closeonly_button=: 3 : 0
wd 'pclose'
)

NB. =========================================================
idemo_close=: 3 : 0
wd 'ide show'
wd 'pclose'
)

NB. =========================================================
idemo_closeshow_button=: idemo_close

idemo_run''
