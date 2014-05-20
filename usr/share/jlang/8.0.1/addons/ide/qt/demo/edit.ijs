NB. alignment, password, readonly
NB.

coclass 'qtdemo'

NB. =========================================================
edit=: 3 : 0
wd 'pc edit'
wd 'minwh 150 20'
wd 'cc e0 edit'
wd 'cc e1 edit left'
wd 'cc e2 edit center'
wd 'cc e3 edit right'
wd 'cc e4 edit password'
wd 'cc e5 edit readonly'
wd 'cc l1 static left'
wd 'cc l2 static center'
wd 'cc l3 static right'
wd 'pshow'
wd 'set e0 limit 10'
wd 'set e0 text *limit=10'
wd 'set e1 text *left'
wd 'set e2 text *center'
wd 'set e3 text *right'
wd 'set e4 text *password'
wd 'set e5 text *readonly'
wd 'set l1 text *left'
wd 'set l2 text *center'
wd 'set l3 text *right'
wd 'pstylesheet *QLineEdit{color:blue} QLabel{color:green;background-color:yellow}'
wd 'set e4 stylesheet *color:red'
wd 'set e5 stylesheet *background-color:#bbbbbb'
)

NB. =========================================================
edit_close=: 3 : 0
wd 'pclose'
)

NB. =========================================================
edit''
