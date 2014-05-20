NB. grid layout
NB.

coclass 'qtdemo'

NB. =========================================================
grid=: 3 : 0
wd 'pc grid'
wd 'bin vhg'
wd 'grid size 2 3'
wd 'grid colwidth 1 200'
wd 'grid colstretch 0 1'
wd 'grid rowheight 0 40'
wd 'cc b00 button'
wd 'cc b01 button'
wd 'cc b02 button'
wd 'cc b10 button'
wd 'cc b11 button'
wd 'cc b12 button'
wd 'bin zsz'
wd 'bin g'
wd 'grid cell 1 3'
wd 'cc c13 button'
wd 'grid cell 2 2'
wd 'grid rowstretch 2 10'
wd 'cc c22 button'
wd 'grid cell 4 4'
wd 'cc c44 button'
wd 'grid cell 3 0 2 2'
wd 'minwh 100 100'
wd 'cc m editm'
wd 'bin z'
wd 'pshow'
wd 'set m text "3 0:4 1"'
)

NB. =========================================================
grid_close=: 3 : 0
wd 'pclose'
)

NB. =========================================================
grid''
