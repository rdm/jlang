NB. table with combolists
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
NB.  10  multiline text
NB.  100 checkbox
NB.  200 combolist 
NB.  300 combobox
NB.  400 button
NB.
NB. cell align:
NB.  0 left
NB.  1 center
NB.  2 right
NB.
NB. set parameters:
NB.   align                - alignment    (default left)
NB.   background           - background color
NB.   block                - block mode for set (align|background|colwidth|data|font|foreground|protect|rowheight|type)
NB.                          row1 row2 col1 col2, for row2 and col2, _1 means last row or column
NB.                          row col (one cell only)
NB.   cell                 - cell data
NB.   colwidth             - column width in pixels
NB.   data                 - table data
NB.   font                 - cell font
NB.   foreground           - foreground color
NB.   hdr                  - column headers
NB.   lab                  - row labels
NB.   protect              - if protected (default 0)
NB.   rowheight            - row height in pixels
NB.   type                 - cell type    (default 0)
NB.   sort                 - column [ascending|descending] only applies to type 0
NB.
NB. following are singleton or one per column:
NB.   hdralign  - column header align (make header first)
NB.
NB. set shape parameter - this resets the table:
NB.   shape rows cols
NB.
NB. get commands
NB.    cell row col - get contents of cell at row col
NB.    row r        - get contents of row r
NB.    col c        - get contents of column c
NB.    table        - get block data as LF delimited string
NB.                   optional arguments [row col] ro [row1 row2 col1 col2]

coclass 'qtdemo'

NB. =========================================================
makedata=: 3 : 0
a=. ' 0 ',DEL,'"First Item" "Second Item" "Third Item"',DEL,' 11'
a=. a,' 1 "1 First Second Third" "push me"'
)

NB. =========================================================
table=: 3 : 0
wd 'pc table'
wd 'cc pac table 5 7'
wd 'set pac hdr Manufacturer Select Options Hire Lease Type Origin'
wd 'set pac hdralign 0 1 1 1 1 1 0'
wd 'set pac lab zero one two three four'
wd 'set pac block 2 3 1 3'
wd 'set pac type 100 200 0 100 200 400'
wd 'set pac protect 0 0 1 1 0 0'
wd 'set pac data *',makedata''
NB. un-initialised cells default to text
wd 'set pac block 0 0'
wd 'set pac protect 1'
wd 'set pac cell 0 0 "first cell',LF,'second row"'
NB. multiline edit
wd 'set pac block 1 0'
wd 'set pac type 10'
wd 'set pac data "first cell',LF,'second row',LF,'third row"'
wd 'set pac block 3 4'
wd 'set pac type 200'
wd 'set pac cell 3 4 *3 First Second Third Fourth'
wd 'set pac block 1 2 3 4'
wd 'set pac type 0 100 100 400'
wd 'set pac align 0 1 2 0'
wd 'set pac data mouse 1 0 "black cat"'
wd 'set pac font mono 24'
wd 'set pac block 3 3'
wd 'set pac type 200'
wd 'set pac cell 3 3 *3 First Second Third Fourth'
wd 'set pac font sans 30'
NB. wd 'set pac data "text"'
wd 'set pac block 2 3 5 6'
wd 'set pac data one two'
wd 'set pac block'
fg=. '#ff0000 #00ff00 #0000ff #ff0000 #00ff00 #0000ff #000000 '
bg=. '#eeeeee #ffffff #eeeeee #ffffff #eeeeee #ffffff #eeeeee '
bgfg=. '#eeeeee #ff0000 #ffffff #00ff00 #eeeeee #0000ff #ffffff #ff0000 #eeeeee #00ff00 #ffffff #0000ff #eeeeee #000000'
NB.wd'set pac foreground ',fg
NB.wd'set pac background ',bg
wd 'set pac color ',bgfg
wd 'set pac block 0 0 2 3'
wd 'set pac colwidth 100'
wd 'set pac block 0 2 0 0'
wd 'set pac rowheight 40 60 60'
wd 'pmove 100 10 800 300'
wd 'pshow'
)

NB. =========================================================
table_pac_change=: 3 : 0
'row col'=. 0 ". pac_cell
smoutput (":row),' ',(":col),': ',pac_value
smoutput 3 4$ <;._2 wd'get pac table 1 3 1 4'
)


NB. =========================================================
table_close=: 3 : 0
wd 'pclose'
showevents_jqtide_ 0
)

NB. =========================================================
showevents_jqtide_ 2
table''
