NB. table
NB.
NB. !!! this is experimental and *will* change...
NB.
NB. cover for the QTableWidget
NB.
NB. rows, cols are the data size
NB. headers do not include the top left cell
NB.
NB. cell types:
NB.  0   text
NB.  100 checkbox
NB.
NB. cell align:
NB.  0 left
NB.  1 center
NB.  2 right
NB.
NB. set parameters:
NB.   data                 - ravelled data
NB.   hdr                  - column headers
NB.   lab                  - row labels
NB.   cell row col value   - cell value
NB.   block row col rows cols values  - block values
NB.
NB. following are singleton or one per column:
NB.   hdralign  - column header align (make header first)
NB.
NB. following are singleton, one per column, or one per ravelled data:
NB.   align - alignment   (default left)
NB.   protect  - if protected (default 0)
NB.   type  - cell type   (default 0)
NB.
NB. set size parameter - this resets the table:
NB.   shape rows cols

coclass 'qtdemo'

NB. =========================================================
fmt1=: 3 : 0
if. 2=3!:0 y do. ' "',y,'"' else. ' ',,8!:2 y end.
)

NB. =========================================================
Tab=: _2 [\ 11 8 6 9 23 6
Sel=: 0 0 1

NB. =========================================================
makedata=: 3 : 0
t=. <&>t,+/t=. Tab,.+/"1 Tab
dat=. ((<&>Sel),<''),.t,.;:'USA Japan Germany All'
;fmt1 each ,dat
)

NB. =========================================================
table=: 3 : 0
wd 'pc table'
wd 'cc pac table 4 5'
wd 'set pac hdr Select Hire Lease Total Origin'
wd 'set pac hdralign 1 1 1 1 0'
wd 'set pac type ',":20{.15$100 0 0 0 0
wd 'set pac align 1 2 2 2 0'
wd 'set pac protect ',":20{.(!.1) 15$0 0 0 1 1
wd 'set pac lab Ford Toyota "Mercedes Benz" Total'
wd 'set pac data *',makedata''
wd 'pmove 100 10 500 200'
wd 'pshow'
)

NB. =========================================================
table_pac_change=: 3 : 0
'row col'=. 0 ". pac_cell
new=. 0 ". pac
if. col=0 do.
  Sel=: new row} Sel
else.
  Tab=: new (<row,col-1)} Tab
  wd 'set pac data *',makedata''
end.
)

NB. =========================================================
table_close=: 3 : 0
wd 'pclose'
showevents_jqtide_ 0
)

NB. =========================================================
showevents_jqtide_ 2
table''
