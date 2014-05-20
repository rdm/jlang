NB. J qtide

require 'project'

coclass 'jqtide'

Debugwd=: 0

cocurrent 'z'
'jws_onOpen jws_onClose jws_onMessage jws_onError jws_onStateChange'=: i.5
wd=: 3 : 0"1
'r c l p n'=. wd1 (,y);(#,y);(,2);(,0)
select. r
case. 0 do. 
 EMPTY
case. _1 do.
 memr p,0,n
case. _2 do.
 _2 [\ <;._2 memr p,0,n
case. do.
  (wd ::(''"_) 'qer') (13!:8) 3
end.
)

wd1=: ('"',libjqt,'" wd ', (IFWIN#'+'),' i *c i * *i') & cd f.
wdhandler=: 3 : 0
wdq=: wd 'q'
wd_val=. {:"1 wdq
({."1 wdq)=: wd_val
if. 3=4!:0<'wdhandler_debug' do.
  try. wdhandler_debug'' catch. end.
end.
wd_ndx=. 1 i.~ 3 = 4!:0 [ 3 {. wd_val
if. 3 > wd_ndx do.
  wd_fn=. > wd_ndx { wd_val
  if. 13!:17'' do.
    wd_fn~''
  else.
    try. wd_fn~''
    catch.
      wd_err=. 13!:12''
      if. 0=4!:0 <'ERM_j_' do.
        wd_erm=. ERM_j_
        ERM_j_=: ''
        if. wd_erm -: wd_err do. i.0 0 return. end.
      end.
      wd_err=. LF,,LF,.}.;._2 wd_err
      wdinfo 'wdhandler';'error in: ',wd_fn,wd_err
    end.
  end.
end.
i.0 0
)
wdclippaste=: (wd bind 'clippaste') :: (''"_)
wdqq=: (wd bind 'q') :: (''"_)
wdqchildxywh=: (0 ". [: wd 'qchildxywh ' , ]) :: (0 0 0 0"_)
wdqchildxywh=: (0 ". [: wd 'qchildxywh ' , ] ) :: (0 0 0 0"_)
wdqcolor=: (0 ". [: wd 'qcolor ' , ":) :: ( 0 0 0"_)
wdqd=: (wd bind 'qd') :: (''"_)
wdqer=: (wd bind 'qer') :: (''"_)
wdqform=: (0 ". wd bind 'qform') :: (0 0 800 600"_)
wdqhinst=: (0 ". wd bind 'qhinst') :: 0:
wdqhwndc=: (0 ". [: wd 'qhwndc ' , ]) :: 0:
wdqhwndp=: (0 ". wd bind 'qhwndp') :: 0:
wdqhwndx=: (0 ". wd bind 'qhwndx') :: 0:
wdqm=: (0 ". wd bind 'qm') :: (800 600 8 16 1 1 3 3 4 4 19 19 0 0 800 570"_)
wdqp=: (wd bind 'qp') :: (''"_)
wdqprinters=: (wd bind 'qprinters') :: (''"_)
wdqpx=: (wd bind 'qpx') :: (''"_)
wdqscreen=: (0 ". wd bind 'qscreen') :: (264 211 800 600 96 96 32 1 _1 36 36 51"_)
wdqwd=: (wd bind 'qwd') :: ('jqt'"_)
wdcenter=: 0:
wdfit=: 0:

wdreset=: wd bind 'reset'
wdforms=: <;._2;._2 @ wd bind 'qpx'
wdisparent=: (boxopen e. 0: {"1 wdforms) ::0:
wdishandle=: (boxopen e. 1: {"1 wdforms) ::0:
wdinfo=: 3 : 0
'a b'=. _2{. boxopen y
if. 2=#$b=. ":b do. b=. }.,LF,.b end.
f=. 8 u: DEL&, @ (,&DEL) @ -.&(0 127{a.)
empty wd 'mb info ',(f a),' ',(f b)
)
wdquery=: 3 : 0
0 3 wdquery y
:
msg=. ' mb_'&,&.> res=. ;:'ok cancel yes no save discard'
t=. x [ 'a b'=. _2{. boxopen y
if. 2=#$b=. ":b do. b=. }.,LF,.b end.
f=. 8 u: DEL&, @ (,&DEL) @ -.&(0 127{a.)
m=. 'mb query', (;t{msg), ' ', (f a),' ',(f b)
res i. <wd m
)
mbopen=: 3 : 0
jpathsep wd 8 u: 'mb open1 ',y
)
mbsave=: 3 : 0
jpathsep wd 8 u: 'mb save ',y
)

wdreadimg=: ('"',libjqt,'" wdreadimg >',(IFWIN#'+'),' x *c *i')&cd
wdgetimg=: ('"',libjqt,'" wdgetimg >',(IFWIN#'+'),' x *c i *i')&cd
wdwriteimg=: ('"',libjqt,'" wdwriteimg >',(IFWIN#'+'),' i *c *i *c *c i')&cd
wdputimg=: ('"',libjqt,'" wdputimg >',(IFWIN#'+'),' x *c *i *i *c i')&cd
wdget=: 4 : 0
nms=. {."1 y
vls=. {:"1 y
if. L. x do. vls {~ nms i. ,&.>x
else. > vls {~ nms i. <,x
end.
)

wdpclose=: [: wd :: empty 'psel ' , ';pclose' ,~ ":
NB gl2 overlay on opengl
rpcinfinity=: 3 : 0
<. 0 (I.(_=y)+.__=y)}y
)
gl_arc=: ('"',libjqt,'" gl_arc >',(IFWIN#'+'),' i *i') cd <
gl_brush=: ('"',libjqt,'" gl_brush >',(IFWIN#'+'),' i')&cd bind ''
gl_brushnull=: ('"',libjqt,'" gl_brushnull >',(IFWIN#'+'),' i')&cd bind ''
gl_capture=: ('"',libjqt,'" gl_capture >',(IFWIN#'+'),' i i')&cd
gl_caret=: ('"',libjqt,'" gl_caret >',(IFWIN#'+'),' i *i') cd <
gl_clear=: ('"',libjqt,'" gl_clear >',(IFWIN#'+'),' i')&cd bind ''
gl_clip=: ('"',libjqt,'" gl_clip >',(IFWIN#'+'),' i *i') cd <
gl_clipreset=: ('"',libjqt,'" gl_clipreset >',(IFWIN#'+'),' i')&cd bind ''
gl_cmds=: ('"',libjqt,'" gl_cmds >',(IFWIN#'+'),' i *i i') cd (;#)@:rpcinfinity
gl_cursor=: ('"',libjqt,'" gl_cursor >',(IFWIN#'+'),' i i')&cd
gl_ellipse=: ('"',libjqt,'" gl_ellipse >',(IFWIN#'+'),' i *i') cd <@:<.
gl_font=: ('"',libjqt,'" gl_font >',(IFWIN#'+'),' i *c') cd <@,
gl_font2=: ('"',libjqt,'" gl_font2 >',(IFWIN#'+'),' i *i i') cd (;#)@:<.
gl_fontangle=: ('"',libjqt,'" gl_fontangle >',(IFWIN#'+'),' i i')&cd
gl_lines=: ('"',libjqt,'" gl_lines >',(IFWIN#'+'),' i *i i') cd (;#)
gl_nodblbuf=: ('"',libjqt,'" gl_nodblbuf >',(IFWIN#'+'),' i i') cd {.@(,&0)
gl_paint=: ('"',libjqt,'" gl_paint >',(IFWIN#'+'),' i')&cd bind ''
gl_paintx=: ('"',libjqt,'" gl_paintx >',(IFWIN#'+'),' i')&cd bind ''
gl_pen=: ('"',libjqt,'" gl_pen >',(IFWIN#'+'),' i *i') cd <@:(2&{.)
gl_pie=: ('"',libjqt,'" gl_pie >',(IFWIN#'+'),' i *i') cd <
gl_pixel=: ('"',libjqt,'" gl_pixel >',(IFWIN#'+'),' i *i') cd <
gl_pixels=: ('"',libjqt,'" gl_pixels >',(IFWIN#'+'),' i *i i') cd (;#)@:<.
gl_pixelsx=: ('"',libjqt,'" gl_pixelsx >',(IFWIN#'+'),' i *i') cd <@:<.
gl_polygon=: ('"',libjqt,'" gl_polygon >',(IFWIN#'+'),' i *i i') cd (;#)@:<.
gl_rect=: ('"',libjqt,'" gl_rect >',(IFWIN#'+'),' i *i') cd <@:rpcinfinity
gl_rgb=: ('"',libjqt,'" gl_rgb >',(IFWIN#'+'),' i *i') cd <@:<.
gl_rgba=: ('"',libjqt,'" gl_rgba >',(IFWIN#'+'),' i *i') cd <@:<.
gl_sel=: ('"',libjqt,'" gl_sel >',(IFWIN#'+'),' i x')&cd
gl_sel2=: ('"',libjqt,'" gl_sel2 >',(IFWIN#'+'),' i *c') cd <@,
gl_text=: ('"',libjqt,'" gl_text >',(IFWIN#'+'),' i *c') cd <@,
gl_textcolor=: ('"',libjqt,'" gl_textcolor >',(IFWIN#'+'),' i')&cd bind ''
gl_textxy=: ('"',libjqt,'" gl_textxy >',(IFWIN#'+'),' i *i') cd <@:<.
gl_windoworg=: ('"',libjqt,'" gl_windoworg >',(IFWIN#'+'),' i *i') cd <@:<.
gl_updategl=: ('"',libjqt,'" gl_updategl >',(IFWIN#'+'),' i x')&cd

gl_setlocale=: ('"',libjqt,'" gl_setlocale >',(IFWIN#'+'),' i *c') cd <@,@>
gl_qhandles=: 3 : 0"1
hs=. 3#2-2
('"',libjqt,'" gl_qhandles >',(IFWIN#'+'),' i *x') cd <hs
hs
)
gl_qwh=: 3 : 0"1
wh=. 2#2-2
('"',libjqt,'" gl_qwh >',(IFWIN#'+'),' i *i') cd <wh
wh
)
gl_qpixels=: 3 : 0"1
n=. */ 2{.2}.y
pix=. n#2-2
('"',libjqt,'" gl_qpixels >',(IFWIN#'+'),' i *i *i') cd y;pix
pix
)
gl_qextent=: 3 : 0"1
wh=. 2#2-2
('"',libjqt,'" gl_qextent >',(IFWIN#'+'),' i *c *i') cd (,y);wh
wh
)
gl_qextentw=: 3 : 0"1
y=. y,(LF~:{:y)#LF [ y=. ,y
w=. (+/LF=y)#2-2
('"',libjqt,'" gl_qextentw >',(IFWIN#'+'),' i *c *i') cd y;w
w
)
gl_qtextmetrics=: 3 : 0"1
tm=. 7#2-2
('"',libjqt,'" gl_qtextmetrics >',(IFWIN#'+'),' i *i') cd tm
tm
)
dirmatch=: 3 : 'wd ''dirmatch '', ; dquote&.> 2 {. boxopen y'
open=: [: wd 'openj *'&,
immexj=: [: wd 'immexj *'&,
smact=: wd bind 'smact'
coclass 'jqtide'

showevents=: 3 : 0
select. {. y,1
case. 0 do.
  4!:55 <'wdhandler_debug_z_'
case. 1 do.
  wdhandler_debug_z_=: 3 : 'smoutput sysevent'
case. 2 do.
  wdhandler_debug_z_=: 3 : 'smoutput wdq'
end.
EMPTY
)
readimg=: 3 : 0
if. m=. wdreadimg (utf8 ,y);wh=. 2$2-2 do.
  d=. _2 ic memr m,0,(*/wh,4),2
  wdreadimg 2#<<0
  (|.wh)$d
else.
  0 0$2-2
end.
)
getimg=: 3 : 0
if. m=. wdgetimg y;(#y);wh=. 2$2-2 do.
  d=. _2 ic memr m,0,(*/wh,4),2
  wdreadimg 2#<<0
  (|.wh)$d
else.
  0 0$2-2
end.
)
writeimg=: 4 : 0
'h w'=. $x
d=. ,x
if. 2> #y=. boxopen y do.
  f=. >@{.y
  type=. }. (}.~ i:&'.') f
  opt=. ''
elseif. 2= #y do.
  f=. >@{.y
  type=. >1{y
  opt=. ''
elseif. do.
  f=. utf8 >@{.y
  type=. >1{y
  opt=. 2{.2}.y
  opt=. (":&.>1{opt) 1}opt
end.
if. 'jpg'-:type do. type=. 'jpeg'
elseif. 'tif'-:type do. type=. 'tiff'
end.
type=. toupper type
if. ''-:opt do. quality=. _1 else. quality=. <. {. 0&".opt end.
d=. fliprgb^:(-.RGBSEQ_j_) d
r=. wdwriteimg (2 ic d); (w,h); f; type; quality
EMPTY
)
putimg=: 4 : 0
'h w'=. $x
d=. ,x
if. 2> #y=. boxopen y do.
  type=. >@{.y
  opt=. ''
elseif. do.
  type=. >@{.y
  opt=. 2{.}.y
  opt=. (":&.>1{opt) 1}opt
end.
if. 'jpg'-:type do. type=. 'jpeg'
elseif. 'tif'-:type do. type=. 'tiff'
end.
type=. toupper type
if. ''-:opt do. quality=. _1 else. quality=. <. {. 0&".opt end.
d=. fliprgb^:(-.RGBSEQ_j_) d
m=. wdputimg (2 ic d); (w,h); (len=. ,_1); type; quality
if. m do.
  z=. memr m,0,len,2
  wdputimg (4#(<<0)),<0
  z
else.
  ''
end.
)
dbjqt=: 3 : 0
if. y do.
  if. _1 = 4!:0 <'jdb_open_jdebug_' do.
    0!:0 <jpath '~addons/ide/qt/debugs.ijs'
  end.
  jdb_open_jdebug_''
else.
  jdb_close_jdebug_ :: ] ''
end.
)

helpcontext0=: 3 : 0
require '~addons/ide/qt/help.ijs'
helpcontext y
)
labs_run=: 3 : 0
smfocus_jijs_=: 0:
closewindows_jijs_=: 0:
smclose_jijs_=: 0:
smopen_jijs_=: open
smsel_jijs_=: 0:
smselout_jijs_=: 0:
smsetsaved_jijs_=: 0:
smwrite_jijs_=: 0:
tile_jijs_=: 0:
coinsert_jijs_ (,copath) coname''

if. -.fexist jpath '~addons/labs/labs/lab.ijs' do.
  sminfo 'Labs';lab_msg
  return.
end.
require '~addons/labs/labs/lab.ijs'
lab_jlab_ y
)
Qt_Key_Escape                 =: 16b00f800
Qt_Key_Tab                    =: 16b00f801
Qt_Key_Backtab                =: 16b00f802
Qt_Key_Backspace              =: 16b00f803
Qt_Key_Return                 =: 16b00f804
Qt_Key_Enter                  =: 16b00f805
Qt_Key_Insert                 =: 16b00f806
Qt_Key_Delete                 =: 16b00f807
Qt_Key_Pause                  =: 16b00f808
Qt_Key_Print                  =: 16b00f809
Qt_Key_SysReq                 =: 16b00f80a
Qt_Key_Clear                  =: 16b00f80b
Qt_Key_Home                   =: 16b00f810
Qt_Key_End                    =: 16b00f811
Qt_Key_Left                   =: 16b00f812
Qt_Key_Up                     =: 16b00f813
Qt_Key_Right                  =: 16b00f814
Qt_Key_Down                   =: 16b00f815
Qt_Key_PageUp                 =: 16b00f816
Qt_Key_PageDown               =: 16b00f817
Qt_Key_Shift                  =: 16b00f820
Qt_Key_Control                =: 16b00f821
Qt_Key_Meta                   =: 16b00f822
Qt_Key_Alt                    =: 16b00f823
Qt_Key_CapsLock               =: 16b00f824
Qt_Key_NumLock                =: 16b00f825
Qt_Key_ScrollLock             =: 16b00f826
Qt_Key_F1                     =: 16b00f830
Qt_Key_F2                     =: 16b00f831
Qt_Key_F3                     =: 16b00f832
Qt_Key_F4                     =: 16b00f833
Qt_Key_F5                     =: 16b00f834
Qt_Key_F6                     =: 16b00f835
Qt_Key_F7                     =: 16b00f836
Qt_Key_F8                     =: 16b00f837
Qt_Key_F9                     =: 16b00f838
Qt_Key_F10                    =: 16b00f839
Qt_Key_F11                    =: 16b00f83a
Qt_Key_F12                    =: 16b00f83b
Qt_Key_F13                    =: 16b00f83c
Qt_Key_F14                    =: 16b00f83d
Qt_Key_F15                    =: 16b00f83e
Qt_Key_F16                    =: 16b00f83f
Qt_Key_F17                    =: 16b00f840
Qt_Key_F18                    =: 16b00f841
Qt_Key_F19                    =: 16b00f842
Qt_Key_F20                    =: 16b00f843
Qt_Key_F21                    =: 16b00f844
Qt_Key_F22                    =: 16b00f845
Qt_Key_F23                    =: 16b00f846
Qt_Key_F24                    =: 16b00f847
Qt_Key_F25                    =: 16b00f848
Qt_Key_F26                    =: 16b00f849
Qt_Key_F27                    =: 16b00f84a
Qt_Key_F28                    =: 16b00f84b
Qt_Key_F29                    =: 16b00f84c
Qt_Key_F30                    =: 16b00f84d
Qt_Key_F31                    =: 16b00f84e
Qt_Key_F32                    =: 16b00f84f
Qt_Key_F33                    =: 16b00f850
Qt_Key_F34                    =: 16b00f851
Qt_Key_F35                    =: 16b00f852
Qt_Key_Super_L                =: 16b00f853
Qt_Key_Super_R                =: 16b00f854
Qt_Key_Menu                   =: 16b00f855
Qt_Key_Hyper_L                =: 16b00f856
Qt_Key_Hyper_R                =: 16b00f857
Qt_Key_Help                   =: 16b00f858
Qt_Key_Direction_L            =: 16b00f859
Qt_Key_Direction_R            =: 16b00f860
Qt_Key_Space                  =: 16b20
Qt_Key_Any                    =: Qt_Key_Space
Qt_Key_Exclam                 =: 16b21
Qt_Key_QuoteDbl               =: 16b22
Qt_Key_NumberSign             =: 16b23
Qt_Key_Dollar                 =: 16b24
Qt_Key_Percent                =: 16b25
Qt_Key_Ampersand              =: 16b26
Qt_Key_Apostrophe             =: 16b27
Qt_Key_ParenLeft              =: 16b28
Qt_Key_ParenRight             =: 16b29
Qt_Key_Asterisk               =: 16b2a
Qt_Key_Plus                   =: 16b2b
Qt_Key_Comma                  =: 16b2c
Qt_Key_Minus                  =: 16b2d
Qt_Key_Period                 =: 16b2e
Qt_Key_Slash                  =: 16b2f
Qt_Key_0                      =: 16b30
Qt_Key_1                      =: 16b31
Qt_Key_2                      =: 16b32
Qt_Key_3                      =: 16b33
Qt_Key_4                      =: 16b34
Qt_Key_5                      =: 16b35
Qt_Key_6                      =: 16b36
Qt_Key_7                      =: 16b37
Qt_Key_8                      =: 16b38
Qt_Key_9                      =: 16b39
Qt_Key_Colon                  =: 16b3a
Qt_Key_Semicolon              =: 16b3b
Qt_Key_Less                   =: 16b3c
Qt_Key_Equal                  =: 16b3d
Qt_Key_Greater                =: 16b3e
Qt_Key_Question               =: 16b3f
Qt_Key_At                     =: 16b40
Qt_Key_A                      =: 16b41
Qt_Key_B                      =: 16b42
Qt_Key_C                      =: 16b43
Qt_Key_D                      =: 16b44
Qt_Key_E                      =: 16b45
Qt_Key_F                      =: 16b46
Qt_Key_G                      =: 16b47
Qt_Key_H                      =: 16b48
Qt_Key_I                      =: 16b49
Qt_Key_J                      =: 16b4a
Qt_Key_K                      =: 16b4b
Qt_Key_L                      =: 16b4c
Qt_Key_M                      =: 16b4d
Qt_Key_N                      =: 16b4e
Qt_Key_O                      =: 16b4f
Qt_Key_P                      =: 16b50
Qt_Key_Q                      =: 16b51
Qt_Key_R                      =: 16b52
Qt_Key_S                      =: 16b53
Qt_Key_T                      =: 16b54
Qt_Key_U                      =: 16b55
Qt_Key_V                      =: 16b56
Qt_Key_W                      =: 16b57
Qt_Key_X                      =: 16b58
Qt_Key_Y                      =: 16b59
Qt_Key_Z                      =: 16b5a
Qt_Key_BracketLeft            =: 16b5b
Qt_Key_Backslash              =: 16b5c
Qt_Key_BracketRight           =: 16b5d
Qt_Key_AsciiCircum            =: 16b5e
Qt_Key_Underscore             =: 16b5f
Qt_Key_QuoteLeft              =: 16b60
Qt_Key_BraceLeft              =: 16b7b
Qt_Key_Bar                    =: 16b7c
Qt_Key_BraceRight             =: 16b7d
Qt_Key_AsciiTilde             =: 16b7e
Qt_Key_nobreakspace           =: 16ba0
Qt_Key_exclamdown             =: 16ba1
Qt_Key_cent                   =: 16ba2
Qt_Key_sterling               =: 16ba3
Qt_Key_currency               =: 16ba4
Qt_Key_yen                    =: 16ba5
Qt_Key_brokenbar              =: 16ba6
Qt_Key_section                =: 16ba7
Qt_Key_diaeresis              =: 16ba8
Qt_Key_copyright              =: 16ba9
Qt_Key_ordfeminine            =: 16baa
Qt_Key_guillemotleft          =: 16bab
Qt_Key_notsign                =: 16bac
Qt_Key_hyphen                 =: 16bad
Qt_Key_registered             =: 16bae
Qt_Key_macron                 =: 16baf
Qt_Key_degree                 =: 16bb0
Qt_Key_plusminus              =: 16bb1
Qt_Key_twosuperior            =: 16bb2
Qt_Key_threesuperior          =: 16bb3
Qt_Key_acute                  =: 16bb4
Qt_Key_mu                     =: 16bb5
Qt_Key_paragraph              =: 16bb6
Qt_Key_periodcentered         =: 16bb7
Qt_Key_cedilla                =: 16bb8
Qt_Key_onesuperior            =: 16bb9
Qt_Key_masculine              =: 16bba
Qt_Key_guillemotright         =: 16bbb
Qt_Key_onequarter             =: 16bbc
Qt_Key_onehalf                =: 16bbd
Qt_Key_threequarters          =: 16bbe
Qt_Key_questiondown           =: 16bbf
Qt_Key_Agrave                 =: 16bc0
Qt_Key_Aacute                 =: 16bc1
Qt_Key_Acircumflex            =: 16bc2
Qt_Key_Atilde                 =: 16bc3
Qt_Key_Adiaeresis             =: 16bc4
Qt_Key_Aring                  =: 16bc5
Qt_Key_AE                     =: 16bc6
Qt_Key_Ccedilla               =: 16bc7
Qt_Key_Egrave                 =: 16bc8
Qt_Key_Eacute                 =: 16bc9
Qt_Key_Ecircumflex            =: 16bca
Qt_Key_Ediaeresis             =: 16bcb
Qt_Key_Igrave                 =: 16bcc
Qt_Key_Iacute                 =: 16bcd
Qt_Key_Icircumflex            =: 16bce
Qt_Key_Idiaeresis             =: 16bcf
Qt_Key_ETH                    =: 16bd0
Qt_Key_Ntilde                 =: 16bd1
Qt_Key_Ograve                 =: 16bd2
Qt_Key_Oacute                 =: 16bd3
Qt_Key_Ocircumflex            =: 16bd4
Qt_Key_Otilde                 =: 16bd5
Qt_Key_Odiaeresis             =: 16bd6
Qt_Key_multiply               =: 16bd7
Qt_Key_Ooblique               =: 16bd8
Qt_Key_Ugrave                 =: 16bd9
Qt_Key_Uacute                 =: 16bda
Qt_Key_Ucircumflex            =: 16bdb
Qt_Key_Udiaeresis             =: 16bdc
Qt_Key_Yacute                 =: 16bdd
Qt_Key_THORN                  =: 16bde
Qt_Key_ssharp                 =: 16bdf
Qt_Key_division               =: 16bf7
Qt_Key_ydiaeresis             =: 16bff
Qt_Key_Back                   =: 16b00f861
Qt_Key_Forward                =: 16b00f862
Qt_Key_Stop                   =: 16b00f863
Qt_Key_Refresh                =: 16b00f864
Qt_Key_VolumeDown             =: 16b00f870
Qt_Key_VolumeMute             =: 16b00f871
Qt_Key_VolumeUp               =: 16b00f872
Qt_Key_BassBoost              =: 16b00f873
Qt_Key_BassUp                 =: 16b00f874
Qt_Key_BassDown               =: 16b00f875
Qt_Key_TrebleUp               =: 16b00f876
Qt_Key_TrebleDown             =: 16b00f877
Qt_Key_MediaPlay              =: 16b00f880
Qt_Key_MediaStop              =: 16b00f881
Qt_Key_MediaPrevious          =: 16b00f882
Qt_Key_MediaNext              =: 16b00f883
Qt_Key_MediaRecord            =: 16b00f884
Qt_Key_MediaPause             =: 16b00f885
Qt_Key_MediaTogglePlayPause   =: 16b00f886
Qt_Key_HomePage               =: 16b00f890
Qt_Key_Favorites              =: 16b00f891
Qt_Key_Search                 =: 16b00f892
Qt_Key_Standby                =: 16b00f893
Qt_Key_OpenUrl                =: 16b00f894
Qt_Key_LaunchMail             =: 16b00f8a0
Qt_Key_LaunchMedia            =: 16b00f8a1
Qt_Key_Launch0                =: 16b00f8a2
Qt_Key_Launch1                =: 16b00f8a3
Qt_Key_Launch2                =: 16b00f8a4
Qt_Key_Launch3                =: 16b00f8a5
Qt_Key_Launch4                =: 16b00f8a6
Qt_Key_Launch5                =: 16b00f8a7
Qt_Key_Launch6                =: 16b00f8a8
Qt_Key_Launch7                =: 16b00f8a9
Qt_Key_Launch8                =: 16b00f8aa
Qt_Key_Launch9                =: 16b00f8ab
Qt_Key_LaunchA                =: 16b00f8ac
Qt_Key_LaunchB                =: 16b00f8ad
Qt_Key_LaunchC                =: 16b00f8ae
Qt_Key_LaunchD                =: 16b00f8af
Qt_Key_LaunchE                =: 16b00f8b0
Qt_Key_LaunchF                =: 16b00f8b1
Qt_Key_MonBrightnessUp        =: 16b00f8b2
Qt_Key_MonBrightnessDown      =: 16b00f8b3
Qt_Key_KeyboardLightOnOff     =: 16b00f8b4
Qt_Key_KeyboardBrightnessUp   =: 16b00f8b5
Qt_Key_KeyboardBrightnessDown =: 16b00f8b6
Qt_Key_PowerOff               =: 16b00f8b7
Qt_Key_WakeUp                 =: 16b00f8b8
Qt_Key_Eject                  =: 16b00f8b9
Qt_Key_ScreenSaver            =: 16b00f8ba
Qt_Key_WWW                    =: 16b00f8bb
Qt_Key_Memo                   =: 16b00f8bc
Qt_Key_LightBulb              =: 16b00f8bd
Qt_Key_Shop                   =: 16b00f8be
Qt_Key_History                =: 16b00f8bf
Qt_Key_AddFavorite            =: 16b00f8c0
Qt_Key_HotLinks               =: 16b00f8c1
Qt_Key_BrightnessAdjust       =: 16b00f8c2
Qt_Key_Finance                =: 16b00f8c3
Qt_Key_Community              =: 16b00f8c4
Qt_Key_AudioRewind            =: 16b00f8c5
Qt_Key_BackForward            =: 16b00f8c6
Qt_Key_ApplicationLeft        =: 16b00f8c7
Qt_Key_ApplicationRight       =: 16b00f8c8
Qt_Key_Book                   =: 16b00f8c9
Qt_Key_CD                     =: 16b00f8ca
Qt_Key_Calculator             =: 16b00f8cb
Qt_Key_ToDoList               =: 16b00f8cc
Qt_Key_ClearGrab              =: 16b00f8cd
Qt_Key_Close                  =: 16b00f8ce
Qt_Key_Copy                   =: 16b00f8cf
Qt_Key_Cut                    =: 16b00f8d0
Qt_Key_Display                =: 16b00f8d1
Qt_Key_DOS                    =: 16b00f8d2
Qt_Key_Documents              =: 16b00f8d3
Qt_Key_Excel                  =: 16b00f8d4
Qt_Key_Explorer               =: 16b00f8d5
Qt_Key_Game                   =: 16b00f8d6
Qt_Key_Go                     =: 16b00f8d7
Qt_Key_iTouch                 =: 16b00f8d8
Qt_Key_LogOff                 =: 16b00f8d9
Qt_Key_Market                 =: 16b00f8da
Qt_Key_Meeting                =: 16b00f8db
Qt_Key_MenuKB                 =: 16b00f8dc
Qt_Key_MenuPB                 =: 16b00f8dd
Qt_Key_MySites                =: 16b00f8de
Qt_Key_News                   =: 16b00f8df
Qt_Key_OfficeHome             =: 16b00f8e0
Qt_Key_Option                 =: 16b00f8e1
Qt_Key_Paste                  =: 16b00f8e2
Qt_Key_Phone                  =: 16b00f8e3
Qt_Key_Calendar               =: 16b00f8e4
Qt_Key_Reply                  =: 16b00f8e5
Qt_Key_Reload                 =: 16b00f8e6
Qt_Key_RotateWindows          =: 16b00f8e7
Qt_Key_RotationPB             =: 16b00f8e8
Qt_Key_RotationKB             =: 16b00f8e9
Qt_Key_Save                   =: 16b00f8ea
Qt_Key_Send                   =: 16b00f8eb
Qt_Key_Spell                  =: 16b00f8ec
Qt_Key_SplitScreen            =: 16b00f8ed
Qt_Key_Support                =: 16b00f8ee
Qt_Key_TaskPane               =: 16b00f8ef
Qt_Key_Terminal               =: 16b00f8f0
Qt_Key_Tools                  =: 16b00f8f1
Qt_Key_Travel                 =: 16b00f8f2
Qt_Key_Video                  =: 16b00f8f3
Qt_Key_Word                   =: 16b00f8f4
Qt_Key_Xfer                   =: 16b00f8f5
Qt_Key_ZoomIn                 =: 16b00f8f6
Qt_Key_ZoomOut                =: 16b00f8f7
Qt_Key_Away                   =: 16b00f8f8
Qt_Key_Messenger              =: 16b00f8f9
Qt_Key_WebCam                 =: 16b00f8fa
Qt_Key_MailForward            =: 16b00f8fb
Qt_Key_Pictures               =: 16b00f8fc
Qt_Key_Music                  =: 16b00f8fd
Qt_Key_Battery                =: 16b00f8fe
Qt_Key_Bluetooth              =: 16b00f8ff
coclass 'qtprinter'

NB gl2 on printer
rpcinfinity=: 3 : 0
<. 0 (I.(_=y)+.__=y)}y
)
glzarc=: ('"',libjqt,'" glzarc >',(IFWIN#'+'),' i *i') cd <
glzbrush=: ('"',libjqt,'" glzbrush >',(IFWIN#'+'),' i')&cd bind ''
glzbrushnull=: ('"',libjqt,'" glzbrushnull >',(IFWIN#'+'),' i')&cd bind ''
glzclear=: ('"',libjqt,'" glzclear >',(IFWIN#'+'),' i')&cd bind ''
glzclip=: ('"',libjqt,'" glzclip >',(IFWIN#'+'),' i *i') cd <
glzclipreset=: ('"',libjqt,'" glzclipreset >',(IFWIN#'+'),' i')&cd bind ''
glzcmds=: ('"',libjqt,'" glzcmds >',(IFWIN#'+'),' i *i i') cd (;#)@:rpcinfinity
glzellipse=: ('"',libjqt,'" glzellipse >',(IFWIN#'+'),' i *i') cd <@:<.
glzfont=: ('"',libjqt,'" glzfont >',(IFWIN#'+'),' i *c') cd <@,
glzfont2=: ('"',libjqt,'" glzfont2 >',(IFWIN#'+'),' i *i i') cd (;#)@:<.
glzfontangle=: ('"',libjqt,'" glzfontangle >',(IFWIN#'+'),' i i')&cd
glzlines=: ('"',libjqt,'" glzlines >',(IFWIN#'+'),' i *i i') cd (;#)
glznodblbuf=: ('"',libjqt,'" glznodblbuf >',(IFWIN#'+'),' i i') cd {.@(,&0)
glzpen=: ('"',libjqt,'" glzpen >',(IFWIN#'+'),' i *i') cd <@:(2&{.)
glzpie=: ('"',libjqt,'" glzpie >',(IFWIN#'+'),' i *i') cd <
glzpixel=: ('"',libjqt,'" glzpixel >',(IFWIN#'+'),' i *i') cd <
glzpixels=: ('"',libjqt,'" glzpixels >',(IFWIN#'+'),' i *i i') cd (;#)@:<.
glzpixelsx=: ('"',libjqt,'" glzpixelsx >',(IFWIN#'+'),' i *i') cd <@:<.
glzpolygon=: ('"',libjqt,'" glzpolygon >',(IFWIN#'+'),' i *i i') cd (;#)@:<.
glzrect=: ('"',libjqt,'" glzrect >',(IFWIN#'+'),' i *i') cd <@:rpcinfinity
glzrgb=: ('"',libjqt,'" glzrgb >',(IFWIN#'+'),' i *i') cd <@:<.
glzrgba=: ('"',libjqt,'" glzrgba >',(IFWIN#'+'),' i *i') cd <@:<.
glztext=: ('"',libjqt,'" glztext >',(IFWIN#'+'),' i *c') cd <@,
glztextcolor=: ('"',libjqt,'" glztextcolor >',(IFWIN#'+'),' i')&cd bind ''
glztextxy=: ('"',libjqt,'" glztextxy >',(IFWIN#'+'),' i *i') cd <@:<.
glzwindoworg=: ('"',libjqt,'" glzwindoworg >',(IFWIN#'+'),' i *i') cd <@:<.

glzqresolution=: ('"',libjqt,'" glzqresolution >',(IFWIN#'+'),' i')&cd bind ''
glzqcolormode=: ('"',libjqt,'" glzqcolormode >',(IFWIN#'+'),' i')&cd bind ''
glzqduplexmode=: ('"',libjqt,'" glzqduplexmode >',(IFWIN#'+'),' i')&cd bind ''
glzqorientation=: ('"',libjqt,'" glzqorientation >',(IFWIN#'+'),' i')&cd bind ''
glzqoutputformat=: ('"',libjqt,'" glzqoutputformat >',(IFWIN#'+'),' i')&cd bind ''
glzqpageorder=: ('"',libjqt,'" glzqpageorder >',(IFWIN#'+'),' i')&cd bind ''
glzqpapersize=: ('"',libjqt,'" glzqpapersize >',(IFWIN#'+'),' i')&cd bind ''
glzqpapersource=: ('"',libjqt,'" glzqpapersource >',(IFWIN#'+'),' i')&cd bind ''

glzresolution=: ('"',libjqt,'" glzresolution >',(IFWIN#'+'),' i i')&cd
glzcolormode=: ('"',libjqt,'" glzcolormode >',(IFWIN#'+'),' i i')&cd
glzduplexmode=: ('"',libjqt,'" glzduplexmode >',(IFWIN#'+'),' i i')&cd
glzorientation=: ('"',libjqt,'" glzorientation >',(IFWIN#'+'),' i i')&cd
glzoutputformat=: ('"',libjqt,'" glzoutputformat >',(IFWIN#'+'),' i i')&cd
glzpageorder=: ('"',libjqt,'" glzpageorder >',(IFWIN#'+'),' i i')&cd
glzpapersize=: ('"',libjqt,'" glzpapersize >',(IFWIN#'+'),' i i')&cd
glzpapersource=: ('"',libjqt,'" glzpapersource >',(IFWIN#'+'),' i i')&cd

glzscale=: ('"',libjqt,'" glzscale >',(IFWIN#'+'),' i *f') cd <

glzabortdoc=: ('"',libjqt,'" glzabortdoc >',(IFWIN#'+'),' i')&cd bind ''
glzenddoc=: ('"',libjqt,'" glzenddoc >',(IFWIN#'+'),' i')&cd bind ''
glznewpage=: ('"',libjqt,'" glznewpage >',(IFWIN#'+'),' i')&cd bind ''
glzprinter=: ('"',libjqt,'" glzprinter >',(IFWIN#'+'),' i *c') cd <@,
glzstartdoc=: ('"',libjqt,'" glzstartdoc >',(IFWIN#'+'),' i *c *c') cd 2: {. boxopen

glzinitprinter=: ('"',libjqt,'" glzinitprinter >',(IFWIN#'+'),' i')&cd bind ''
glzqwh=: 3 : 0"1
wh=. 2#1.1-1.1
('"',libjqt,'" glzqwh >',(IFWIN#'+'),' i *f i') cd wh;y
wh
)
glzqmargins=: 3 : 0"1
ltrb=. 4#1.1-1.1
('"',libjqt,'" glzqmargins >',(IFWIN#'+'),' i *f i') cd ltrb;y
ltrb
)
glzqextent=: 3 : 0"1
wh=. 2#2-2
('"',libjqt,'" glzqextent >',(IFWIN#'+'),' i *c *i') cd (,y);wh
wh
)
glzqextentw=: 3 : 0"1
y=. y,(LF~:{:y)#LF [ y=. ,y
w=. (+/LF=y)#2-2
('"',libjqt,'" glzqextentw >',(IFWIN#'+'),' i *c *i') cd y;w
w
)
glzqtextmetrics=: 3 : 0"1
tm=. 7#2-2
('"',libjqt,'" glzqtextmetrics >',(IFWIN#'+'),' i *i') cd <tm
tm
)
QPrinter_Color=: 1
QPrinter_GrayScale=: 0
QPrinter_DuplexNone=: 0
QPrinter_DuplexAuto=: 1
QPrinter_DuplexLongSide=: 2
QPrinter_DuplexShortSide=: 3
QPrinter_Portrait=: 0
QPrinter_Landscape=: 1
QPrinter_NativeFormat=: 0
QPrinter_PdfFormat=: 1
QPrinter_PostScriptFormat=: 2

QPrinter_FirstPageFirst=: 0
QPrinter_LastPageFirst=: 1
QPrinter_A0=: 5
QPrinter_A1=: 6
QPrinter_A2=: 7
QPrinter_A3=: 8
QPrinter_A4=: 0
QPrinter_A5=: 9
QPrinter_A6=: 10
QPrinter_A7=: 11
QPrinter_A8=: 12
QPrinter_A9=: 13
QPrinter_B0=: 14
QPrinter_B1=: 15
QPrinter_B2=: 17
QPrinter_B3=: 18
QPrinter_B4=: 19
QPrinter_B5=: 1
QPrinter_B6=: 20
QPrinter_B7=: 21
QPrinter_B8=: 22
QPrinter_B9=: 23
QPrinter_B10=: 16
QPrinter_C5E=: 24
QPrinter_Comm10E=: 25
QPrinter_DLE=: 26
QPrinter_Executive=: 4
QPrinter_Folio=: 27
QPrinter_Ledger=: 28
QPrinter_Legal=: 3
QPrinter_Letter=: 2
QPrinter_Tabloid=: 29
QPrinter_Custom=: 30
QPrinter_Auto=: 6
QPrinter_Cassette=: 11
QPrinter_Envelope=: 4
QPrinter_EnvelopeManual=: 5
QPrinter_FormSource=: 12
QPrinter_LargeCapacity=: 10
QPrinter_LargeFormat=: 9
QPrinter_Lower=: 1
QPrinter_MaxPageSource=: 13
QPrinter_Middle=: 2
QPrinter_Manual=: 3
QPrinter_OnlyOne=: 0
QPrinter_Tractor=: 7
QPrinter_SmallFormat=: 8
QPrinter_Millimeter=: 0
QPrinter_Point=: 1
QPrinter_Inch=: 2
QPrinter_Pica=: 3
QPrinter_Didot=: 4
QPrinter_Cicero=: 5
QPrinter_DevicePixel=: 6

glzinitprinter ::0:''
coclass 'jbaselibtag'
coinsert 'ctag'

absolutepath=: 0
Tags=: '~addons/ide/qt/baselibtags'
cleartags''

cocurrent 'base'
