NB. printer demo
NB.
NB. need the bmp

require' graphics/bmp'

coclass 'qtdemo'
coinsert 'qtprinter'

NB. =========================================================
printer_run=: 3 : 0
if. 0= #y do.
  p=. wd 'mb print'
else.
  p=. y
  glzprinter ({.~ i.&':') p
end.
if. 0= #p do.
  smoutput 'cancel printing'
  EMPTY return.
end.
smoutput 'printer: ', p
smoutput 'dpi: ', ":dpi=: glzresolution 300
smoutput 'wh(inch):', ":glzqwh QPrinter_Inch
smoutput 'wh(pixel):', ":<.glzqwh QPrinter_DevicePixel
if. '_'={.p do.
  glzstartdoc '' ; f=. }.(}.~ i.&':') p
else.
  glzstartdoc ''
end.
glzscale 2#dpi%96
paint''
glzenddoc''
if. '_'={.p do.
  smoutput 'finish. see file: ',f
else.
  smoutput 'finish. see printer paper output'
end.
EMPTY
)

NB. =========================================================
NB. eric's demo
paint=: 3 : 0
'w h'=: <.glzqwh QPrinter_DevicePixel
NB. draw grid
glzrgb 128 128 18
glzpen 0 0
for_i. 50* i.>.h%50 do.
  glzlines 0,i,w,i
end.
for_i. 50* i.>.w%50 do.
  glzlines i,0,i,h
end.

glzrgb 0 0 255
glzpen 5 0
glzrgb 120 120 120
glzbrush''
glzrect 0 50,w,20
glzrgb 255 0 0
glzpen 1 0
glzrgb 0 0 255
glzbrush''
glzrect 10 10 5 5
glzrect 15 15 5 5

NB. arc pie
glzrgb 255 0 0
glzpen 0 0
glzrgb 0 0 255
glzbrush''
glzpie 40 140 60 60 200 70 70 0
glzarc 100 100 160 160 300 170 170 0

NB. clip
glzrgb 255 0 0
glzpen 5 0
glzrgb 0 0 255
glzbrush''
glzclip 40 40 200 100
glzrect 20 20 200 200
glzclipreset''
glzlines 10 10 300 300

NB. text
glzrgb 255 0 0
glztextcolor''
glzfont '"courier new" 20'
glztextxy 150 150
glzfontangle 450
glztext 'how now'

NB. polygon
glzrgb 0 255 0
glzpen 1 0
glzbrush''
glzpolygon 250 200 300 300 400 100 300 150

NB. ellipse
glzellipse 200 200 200 100

b=. readbmp jpath'~addons/graphics/bmp/toucan.bmp'
glzpixels 100 300 200 144,,b
)

smoutput 'available printers:'
smoutput wd 'qprinters'
printer_run''
smoutput 0 : 0
Try:
  printer_run_qtdemo_ 'PDF'  NB. or name of your prniter
)


