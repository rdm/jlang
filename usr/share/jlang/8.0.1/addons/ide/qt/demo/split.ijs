NB. splitter demo
NB.
NB. splith f1 f2 s1 s2
NB.   - horizontal split (also splitv)
NB.   - f = stretch factors
NB.   - s  = initial sizes (optional)
NB.
NB. splitsep   separates control panels
NB. splitz     finishes split

NB. splith 1 2 200 200;

coclass 'qtdemo'

NB. =========================================================
Splitter=: 0 : 0
pc splitter closeok escclose;
splith 0 1 100 200;
cc ed1 editm;
splitsep;
splitv 1 1 250 150;
cc ed2 editm;
splitsep;
splith 1 0 200 100;
cc ed3 editm;
splitsep;
cc ed4 editm;
splitend;
splitend;
splitend;
)

NB. =========================================================
splitter_run=: 3 : 0
wd Splitter
wd 'set ed1 text *pane 1'
wd 'set ed2 text *pane 2'
wd 'set ed3 text *pane 3'
wd 'set ed4 text *pane 4'
wd 'pmove 400 10 400 300'
wd 'pshow'
)

NB. =========================================================
splitter_close=: 3 : 0
wd 'pclose'
showevents_jqtide_ 0
)

showevents_jqtide_ 2
splitter_run''
