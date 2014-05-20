NB. statusbar demo
NB.
NB. after creating the statusbar, run commands in the form:
NB. wd 'set sbar command [options]'
NB.
NB. show temporary message, default timeout none:
NB.  show text [timeout in ms]
NB.  clear               NB. needed if no timeout
NB.
NB. add and set a label:
NB.  addlabel pos [stretch factor, default 0]
NB.  addlabelp ...      (for a permanent label)
NB.  setlabel pos text
NB.
NB. To demo temporary messages, try:
NB.    demo1''
NB.    demo2''

coclass 'qtdemo'

NB. =========================================================
SBdemo=: 0 : 0
pc sbdemo closeok escclose;
cc list listbox;
set list items one two three;
set list select 1;
cc sbar statusbar;
set sbar addlabel row;
set sbar addlabel col;
set sbar addlabelp name;
)

NB. =========================================================
sbdemo_run=: 3 : 0
P=. jpath '~addons/ide/qt/images/'
wd SBdemo
wd 'set sbar setlabel row "line 5"'
wd 'set sbar setlabel col "column 20"'
wd 'set sbar setlabel name "tools/util.ijs"'
wd 'pmove 700 10 400 200'
wd 'pshow'
)

NB. =========================================================
demo1=: 3 : 0
wd 'set sbar show "just testing (2 seconds)" 2000'
)

NB. =========================================================
demo2=: 3 : 0
wd 'set sbar show "test message - clear to remove"'
smoutput 'to remove message, run:',LF,LF,'   wd ''set sbar clear'''
)

NB. =========================================================
sbdemo_run''

NB. =========================================================
smoutput 0 : 0
To demo temporary messages, try:
   demo1_qtdemo_''
   demo2_qtdemo_''
)
