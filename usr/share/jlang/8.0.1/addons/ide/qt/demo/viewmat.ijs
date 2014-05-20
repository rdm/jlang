
require 'viewmat'

coclass 'qtdemo'

NB. =========================================================
test1=: 3 : 0
if. -. 'Android'-:UNAME do.
  viewmat i.5 5
  wd 'pmove ', ":(n=. ?100 100), _1 _1
end.
viewmat (] +./ .*. |:) 3&#. inverse i.243
if. -. 'Android'-:UNAME do.
  wd 'pmove ', ":(50+n), _1 _1
end.
)

NB. =========================================================
test1''
