NB. image demo
NB.
NB. demos need the bmp and publish addons

coclass 'qtdemo'

NB. =========================================================
imdemo_run=: 3 : 0
wd 'pc imdemo closeok escclose'
wd 'cc pic image'
wd 'set pic image *',jpath '~addons/graphics/bmp/toucan.bmp'
wd 'pshow'
)

NB. =========================================================
demo1=: 3 : 0
wd 'set pic image *',jpath '~addons/format/publish/demo/map.jpg'
)

imdemo_run''

smoutput 0 : 0
Try:
   demo1_qtdemo_''
)
