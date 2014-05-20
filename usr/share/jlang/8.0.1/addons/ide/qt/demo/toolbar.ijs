NB. toolbar demo
NB.
NB. force maximum size as widthxheight, e.g.
NB. cc tools toolbar 16x16;

coclass 'qtdemo'

NB. =========================================================
TBdemo=: 0 : 0
pc tbdemo;
cc tools toolbar;
cc enable button;
cc disable button;
cc list listbox;
set list items one two three;
)

NB. =========================================================
tbdemo_run=: 3 : 0
P=. jpath '~addons/ide/qt/images/'
wd TBdemo
wd 'set tools add home "Go Home" "',P,'home.png"'
wd 'set tools add refresh "Refresh" "',P,'refresh.png"'
wd 'set tools addsep'
wd 'set tools add cut Cut "',P,'cut.png"'
wd 'set tools add copy Copy "',P,'copy.png"'
wd 'set tools add paste Paste "',P,'paste.png"'
wd 'pmove 700 10 300 200'
wd 'pshow'
wd 'set tools checkable home'
wd 'set tools checked home'
wd 'set tools checked refresh'  NB. ignored
wd 'set tools enable cut 0'
wd 'set tools enable cut 1'
wd 'set tools enable paste 0'
)

tbdemo_disable_button=: 3 : 0
wd 'set tools enable 0'
)

tbdemo_enable_button=: 3 : 0
wd 'set tools enable'
)

NB. =========================================================
tbdemo_close=: 3 : 0
wd 'pclose'
showevents_jqtide_ 0
)

NB. =========================================================
showevents_jqtide_ 2
tbdemo_run''
