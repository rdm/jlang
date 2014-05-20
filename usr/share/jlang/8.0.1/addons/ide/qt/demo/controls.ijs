NB. controls demos
NB. also:
NB. pc controls closeok
NB. pc controls escclose

coclass 'qtdemo'

Controls=: 0 : 0
pc controls;
rem make nested vertical, horizontal, vertical bins:;
bin vhv;

groupbox Display;
cc linear radiobutton;
cn "view linear";
cc boxed radiobutton group;
cn "view boxed";
cc tree radiobutton group;
cn "view tree";
groupboxend;

bin zv;

groupbox Expense Type;
cc gross radiobutton;
cc net radiobutton group;
cc paid checkbox;
set boxed value 1;
set net value 1;
groupboxend;

bin z s1 z;
cc names combobox;
set names items Bressoud Frye Rosen Wagon;
set names select 2;
cc list listbox;
set list items one "two turtle doves" three "four colly birds" five six seven;
cc entry edit;
set entry text 盛大 abc 巨嘴鸟;
cc ted editm readonly;
rem demonstrate bin and child stretch:;
bin h s2;
cc ok button;cn "Push Me";
cc cancel button default;cn "Cancel";
set ok stretch 1;
)

NB. =========================================================
controls_run=: 3 : 0
wd Controls
wd 'set ted stylesheet *background-color:#eeeeee'
wd 'set ted text *How grand to be a Toucan',LF,'Just think what Toucan do.'
wd 'pmove 400 10 300 300'
wd 'pshow'
)

NB. =========================================================
controls_close=: 3 : 0
wd 'pclose'
showevents_jqtide_ 0
)

showevents_jqtide_ 2
controls_run''

controls_cancel_button=: controls_close
