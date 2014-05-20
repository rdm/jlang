require 'jzgrid'

coclass 'jdebug'

3 : 0''
if. 0~: 4!:0 <'PROFONT_z_' do. PROFONT=: (('Linux';'Darwin';'Android';'Win') i. <UNAME){:: 'Sans 10' ; '"Lucida Grande" 10' ; (IFQT{::'Sans 10';'"Droid Sans" 10') ; 'Tahoma 10' else. PROFONT=: PROFONT_z_ end.
if. 0~: 4!:0 <'FIXFONT_z_' do. FIXFONT=: (('Linux';'Darwin';'Android';'Win') i. <UNAME){:: 'mono 10' ; 'Monaco 10' ; (IFQT{::'monospace 10';'"Droid Sans Mono" 10') ; '"Lucida Console" 10' else. FIXFONT=: FIXFONT_z_ end.
''
)

wdmove=: 0:
jdb_dlb=: }.~ =&' ' i. 0:
jdb_dtb=: #~ ([: +./\. ' '&~:)
jdb_isexplicit=: (<,':')"_ -: {.@>@(5!:1)@<
jdb_issparse=: 512&[ < 3!:0
jdb_splitind=: ('__'&E. i. 1:) ({. ; 2: }. }.) ]
jdb_takeafter=: [: ] (#@[ + E. i. 1:) }. ]
jdb_taketo=: [: ] (E. i. 1:) {. ]
jdb_tolist=: }.@;@:((10{a.)&,@,@":&.>)
jdb_toDEL=: [: ; ' "'&, @ (,&'"') &.>

jdb_boxopen=: boxopen f.
jdb_boxxopen=: boxxopen f.
jdb_empty=: empty f.
jdb_expand=: expand f.
jdb_isparent=: wdisparent f.
jdb_datatype=: datatype f.
jdb_smoutput=: 0 0&$@(1!:2&2)
jdb_wd=: wd f.
jdb_dbs=: 13!:1
jdb_dbsq=: 13!:2
jdb_dbss=: 13!:3
jdb_dbsig=: 13!:8
jdb_dberm=: 13!:12
jdb_dbstk=: 13!:13
jdb_dbtrace=: 13!:16

jdb_imxq=: 9!:26
jdb_imxs=: 9!:27
jdb_imxsq=: 9!:28
jdb_imxss=: 9!:29
NAMECHRS=: '_',a.{~(,(i.10)+a.i.'0'),,(i.26) +/ a.i.'Aa'
jdb_getleftsepndx=: 0: i.~ e. & NAMECHRS
jdb_getrightsepndx=: 0: i.~ e. & (NAMECHRS,'.:')
jdb_codelines=: [: I. ('NB.'&-: @ (3&{.) +: [: *./ ' '&=)&>
jdb_cutopen=: 3 : 0
y jdb_cutopen~ (' ',LF) {~ LF e. ,y
:
if. L. y do. y return. end.
if. 1 < #$y do. <"_1 y return. end.
(<'') -.~ (y e.x) <;._2 y=. y,1{.x
)
jdb_edit=: 3 : 0
jdb_lxsoff''
jdb_stopread''
jdb_dbss''
if. 0 -: jdb_open :: 0: y do.
  jdb_info 'Unable to open definition of ',":>y
end.
jdb_stopwrite''
jdb_lxson''
)
jdb_flatten=: 3 : 0
dat=. ": y
select. # $ dat
case. 1 do.
case. 2 do.
  }. , LF ,. dat
case. do.
  dat=. 1 1}. _1 _1}. ": < dat
  }: (,|."1 [ 1,.-. *./\"1 |."1 dat=' ')#,dat,.LF
end.
)
jdb_fullname=: 3 : 0
LOCALE jdb_fullname y
:
if. 2=#jdb_boxopen y do. y return. end.

x=. > x
y=. > y

if. '_' = {: y do.
  ndx=. (}:y) i: '_'
  j=. (ndx+1) }. }: y
  loc=. j, (0=#j) # 'base'
  (ndx {. y) ; loc
else.
  y ; x
end.
)
jdb_getcursorline=: 3 : '+/ LF = ({. 0 ". lines_select) {. lines'
jdb_getdefs=: (#~ _2: < 4!:0) @ ;:
jdb_getdefs=: 3 : 0
y=. ;: y
if. 1 e. msk=. (1: e. '__'&E.) &> y do.
  bal=. (-.msk) # y
  msk=. (_2 < 4!:0 bal) (I. -.msk)} msk
  msk # y
else.
  y #~ _2 < 4!:0 y
end.
)
jdb_getfontsize=: 13 : '{.1{._1 -.~ _1 ". y'
jdb_getlogpixelsy=: 3 : 0
5 { 0 ". wd 'qscreen'
)
jdb_getnameat=: 4 : 0

txt=. y
sel=. x

'px py'=. sel

rtx=. |. px{.txt
rnd=. jdb_getleftsepndx rtx
beg=. |. rnd {. rtx
bps=. px - rnd
mid=. (py-px) {. px }. txt
etx=. py }. txt

end=. jdb_getrightsepndx etx
bit=. beg, mid, end {. etx

if. 0=#bit-.' ' do.
  name=. ''
else.
  wds=. ;:bit
  len=. # &> }:wds
  ndx=. 0 i.~ (#beg) >: +/\ len
  name=. ndx >@{ wds
  off=. +/ ; ndx {. len
  fnd=. 1 i.~ name E. off }. bit
  sel=. bps+off+fnd
end.

name=. jdb_validname name

if. #name do.
  hit=. {.sel
  ndx=. hit + 0, #name
  ndx;name
else.
  '';''
end.
)
jdb_getnamesat=: 4 : 0
'bgn end'=. x
txt=. bgn }. end {. y
nms=. jdb_getdefs txt
nms=. nms -. MNUVXY
if. #nms do.
  bgn=. bgn + 2 + txt i. ']'
  (bgn,end) ; < nms
else.
  '';''
end.
)
jdb_getnoneheight=: 3 : 0
h=. {: 0 ". jdb_wd 'pc getnone;pas 0 0;qform'
jdb_wd 'pclose'
h + 20
)
jdb_getsmfont=: 3 : 0
if. 0 = 4!:0 <'SMFONT' do.
  SMFONT
else.
  FIXFONT
end.
)
jdb_firsterr=: }.~ 0: i.~ 0: = [: > 1: {"1 ]
jdb_getstack=: jdb_firsterr f. @ (13!:13)
jdb_getwincolor=: 3 : 0
0 0 0
)
jdb_indices=: '['"_ , ": , '] '"_
jdb_indexit=: ([: jdb_indices &.> [: i. #) ,&.> ]
jdb_info=: 3 : 0
'a b'=. _2 {. jdb_boxopen y
if. 0 = #a do. a=. 'Debug' end.
if. 2=#$b=. ":b do. b=. }.,LF,.b end.
f=. DEL&, @ (,&DEL) @ -.&(0 127{a.)
empty jdb_wd 'mb info ',(f a),' ',(f b)
)
jdb_listboxed=: }. @; @: (LF&, &.>)
jdb_listmatrix=: [: }. [: , LF&,.
jdb_lxsoff=: 13!:15 @ (''"_)
jdb_lxson=: 3 : 0
13!:15 'jdb_debug_jdebug_ coname$0'
if. 0 = 13!:17'' do. 13!:0 [ 1 end.
)
jdb_minsize=: 3 : 0
a=. 0 ". jdb_wd 'qform'
a=. a >. 0 0,MINWIDTH,MINHEIGHT
jdb_wd 'pmove ', ": a
)
jdb_pack=: [: /:~ [: (, ,&< ".) &> ;: ::]
jdb_nextline=: 3 : 0
if. 0 e. #CODELINES do. 0 return. end.
if. y=0 do.
  ((i.<./) |CODELINES - MOVELINE) { CODELINES
else.
  ndx=. CODELINES i. MOVELINE
  ndx=. 0 >. (_1 + #CODELINES) <. ndx + y
  ndx { CODELINES
end.
)
jdb_ppget=: 3 : 0
h=. 0 ". jdb_wd :: ] 'qhwndp'
jdb_empty HWNDPX=: {. (h -. HWNDP) , 0
)
jdb_ppset=: 3 : 0
if. HWNDPX do. jdb_wd :: jdb_empty 'psel ', ":HWNDPX end.
)
jdb_query=: 3 : 0
0 3 wdquery y
:
msg=. ' mb_'&,&.> res=. ;:'ok cancel yes no save discard'
t=. x [ 'a b'=. _2{. boxopen y
if. 2=#$b=. ":b do. b=. }.,LF,.b end.
f=. 8 u: DEL&, @ (,&DEL) @ -.&(0 127{a.)
m=. 'mb query', (;t{msg), ' ', (f a),' ',(f b)
res i. <jdb_wd m
)
jdb_selstack=: 3 : 0
a=. 2 }. jdb_dbstk''
if. 0=#a do. return. end.
b=. ({."1 a) i. jdb_boxopen y
if. b=#a do. return. end.
b { a
)
jdb_shiver=: 3 : 0
a=. jdb_wd 'qform'
jdb_wd 'pmove ', ": 0 0 1 0 + 0 ". a
jdb_wd 'pmove ', a
)
jdb_shortname=: 3 : 0
if. '_' = {: y do.
  y {.~ (}:y) i: '_'
else.
  y
end.
)
jdb_validname=: 3 : 0
if. 0=#y do. '' return. end.
if. 1 e. b=. '__' E. }: y do.
  if. 1 ~: +/b do.
    '' return.
  else.
    ndx=. I. b
  end.
  if. _2 e. 4!:0 (ndx{.y);(ndx+2)}.y do.
    ''
  else.
    y
  end.
else.
  if. _2 = 4!:0 <y do.
    ''
  else.
    y
  end.
end.
)
jdb_open=: 3 : 0
y=. jdb_cutopen y
if. 0=#y do. empty'' return. end.
if. 1=#y do.
  if. _1 = s=. 4!:4 y do.
    1[ open y return. end.
  y=. y,<s{4!:3 ''
end.
jdb_open1 y
1
)
jdb_open1=: 3 : 0
'n s'=. y
file=. {.,getscripts_j_ s
dat=. 1!:1 :: _1: file
if. dat -: _1 do.
  0[ 'file read error: ',,>file return.
end.
dat=. toJ dat
dat=. < @ (;: :: <) ;._2 dat,LF
ndx=. I. (1: e. (n;'=:')&E.) &> dat
if. 0 = #ndx do.
  m=. }:(2<:+/\.n='_')#n
  ndx=. I. (1: e. (m;'=:')&E.) &> dat
end.
if. 0 = #ndx do.
  0[ jdb_info 'not found: ',":n return.
end.
open file
1
)
clrback=. jdb_getwincolor 5
clrtext=. jdb_getwincolor 8
COLORS=: ": clrtext,clrback,clrback
ERM_j_=: ''

ERRORS=: '';(9!:8''),<'Unknown Error'
ERRORCODES=: (i.#ERRORS) -. 0 18

HWNDP=: 0
MINWIDTH=: 500
MINHEIGHT=: 300
NONEHEIGHT=: 30

MNUV=: ;: 'm n u v m. n. u. v.'
MNUVXY=: ;: 'm n u v x y m. n. u. v. x. y.'
NVX=: ;: 'n v x n. v. x.'

PTOP=: 1

SMFONT=: jdb_getsmfont''
SMFONTSIZE=: jdb_getfontsize SMFONT

NULL=: $0

PPP=: 72 % jdb_getlogpixelsy ''
RPP=: PPP % SMFONTSIZE

STACKPOS=: 0

SMBOTH=: 0
STOPNONE=: '';0;0;NULL;NULL
SHOWWID=: 80
jdb_vSHOWWID=: SHOWWID"_

TYPES=: 'acv'

STOPNONE=: '';0;0;NULL;NULL
TYPES=: 'acv'
jdb_debuginit=: 3 : 0
STOPS=: i.0 5
STOPLAST=: ''
jdb_debugreset''
)
jdb_debugreset=: 3 : 0
CODELINES=: ''
CURRENTLINE=: 0
ERRMSG=: ''
ERRNUM=: 0
GDEFS=: ''
HWNDPX=: 0
LDEFS=: ''
LOCALE=: <'base'
LOCALNAMES=: ''
LOCALVALS=: ''
LXS=: ''
MOVELINE=: 0
NAME=: ''
NUMLINES=: 0
SCROLL=: 0
STACK=: i.0 8
SMNAMES=: i.0 2
SMLOCALE=: ''
SSTACKS=: ''
SSNAMES=: ''
STACKLOCALS=: ''
STATE=: 0
STOPLAST=: ''
WATCH=: ''
)
jdebug_browse=: 3 : 0
j=. STACKPOS + y
STACKPOS=: 0 >. j <. <: #STACK
jdb_lexwin1 ''
)
jdb_restore=: 3 : 0
jdb_ppset''
jdb_lxson ''
jdb_imxs 'jdb_imxhandler_jdebug_ 1'
jdb_imxss 1
)
jdb_imxhandler=: 3 : 0
if. 1 >: # 13!:13'' do. jdb_clear'' end.
empty''
)
jdb_inactive=: 3 : '0 e. #NAME'
jdb_selact=: smact
jdb_clear=: 3 : 0
hx=. HWNDPX
jdb_debugreset''
if. jdb_isparent <'jdebug' do.
  jdb_wd 'psel jdebug'
  jdb_swap 'jdbnone'
end.
if. hx do.
  jdb_wd :: jdb_selact 'psel ', ":hx
else.
  jdb_selact ''
end.
13!:0 [ 1
jdb_lxson''
)
jdb_close=: 3 : 0
r=. jdb_wd :: 0: 'psel ',": HWNDP
if. -. r -: 0 do.
  pos=. 0 ". jdb_wd 'qform'
  if. TABCURRENT -: 'jdbnone' do.
    pos=. (3 {. pos), {: FORMX
  end.
  pos=. pos >. 0 0, MINWIDTH,MINHEIGHT
  jdb_wd 'pclose'
end.
jdb_lxsoff ''
jdb_imxss 0
jdb_imxs ''
jdb_debuginit''
13!:0 [ 0
)
jdb_open=: 3 : 0
jdb_debuginit''
ERM_j_=: ''
if. #jdb_getstack'' do.
  jdb_debug ''
else.
  jdb_ppget 0
  jdebug_run 0
  jdb_restore''
end.
)
j=. 0 : 0
Enter             !single step over
F5~~~~~~~~        !run
Ctrl+Shift+F5     !run from next sentence
F6~~~~~~~~        !single step into
F7~~~~~~~~        !single step over
F8~~~~~~~~        !step out of current definition
F9~~~~~~~~        !toggle stop on cursor line
Ctrl+F9           !toggle stops on current definition
Ctrl+Shift+F9     !remove all stops
Ctrl+T            !toggle topmost attribute
Ctrl+W            !write current line to session
)

SHORTCUTS=: ' ' (I. j='~') } TAB (I. j='!')} j
jdbscut_run=: 3 : 0
jdb_info 'Debug Shortcuts';SHORTCUTS
)
jdb_f5_fkey=: jdebug_run_button
jdb_f5ctrlshift_fkey=: jdebug_runjdb_next
jdb_f6_fkey=: jdebug_stepinto_button
jdb_f7_fkey=: jdebug_stepover_button
jdb_f8_fkey=: jdebug_stepout_button
jdb_f9_fkey=: jdbmain_stopatline_button
jdb_f9ctrlshift_fkey=: jdebug_clearstops
jdb_f12_fkey=: jdebug_browse @ 1:
jdb_f12shift_fkey=: jdebug_browse @ _1:

jdb_swapfkey=: 3 : 0
if. TABCURRENT -: 'jdbmain' do.
  jdebug_f5_fkey=: jdb_f5_fkey
  jdebug_f6_fkey=: jdb_f6_fkey
  jdebug_f7_fkey=: jdb_f7_fkey
  jdebug_f8_fkey=: jdb_f8_fkey
  jdebug_f9_fkey=: jdb_f9_fkey
  jdebug_f5ctrlshift_fkey=: jdb_f5ctrlshift_fkey
  jdebug_f9ctrlshift_fkey=: jdb_f9ctrlshift_fkey

  jdebug_f12_fkey=: jdb_f12_fkey
  jdebug_f12shift_fkey=: jdb_f12shift_fkey
else.
  jdebug_f5_fkey=: ]
  jdebug_f6_fkey=: ]
  jdebug_f7_fkey=: ]
  jdebug_f8_fkey=: ]
  jdebug_f9_fkey=: ]
  jdebug_f5ctrlshift_fkey=: ]
  jdebug_f9ctrlshift_fkey=: ]
end.
0
)
jdb_debug=: 3 : 0

jdb_lxsoff''

stack=. jdb_getstack''
if. 0 e. #stack do.
  jdb_lxson'' return.
end.
stack=. {. stack

jdb_ppget 0

if. #y do.
  LOCALE=: y
else.
  LOCALE=: <'base'
end.
ERM_j_=: jdb_dberm''
'NAME ERRNUM CURRENTLINE'=: 3 {. stack
MOVELINE=: CURRENTLINE
MOVELINES=: ,MOVELINE
ERRMSG=: (ERRNUM <. <:#ERRORS) >@{ ERRORS
jdb_lexwin ''
jdb_restore ''
)
jdb_lexwin=: 3 : 0
if. 0 e. #NAME do. '' return. end.

jdb_stopread''
STACK=: jdb_getstack''
jdb_lexwin1 ''
)
jdb_lexwin1=: 3 : 0

j=. (MOVELINE ; ERRMSG) jdb_stackrep STACK

if. 0 = L. j do. return. end.

'lines stack values'=. j

mrg=. '>' CURRENTLINE} NUMLINES # ' '

if. MOVELINE ~: CURRENTLINE do.
  mrg=. ('-+' {~ MOVELINE > CURRENTLINE) MOVELINE} mrg
end.

stp=. jdb_stopget''
lines=. (<"1 stp,.mrg) ,&.> lines
lines=. jdb_dtb &.> lines

jdebug_run 1

rws=. <. RPP * _6 + 3 { 0 ". jdb_wd 'qchildxywh lines'
max=. 0 >. NUMLINES - rws
SCROLL=: 0 >. max <. MOVELINE - 3

1 jdb_writelines lines
jdb_wd 'set stack text *',jdb_listboxed stack
jdb_wd 'set value text *',jdb_listboxed values
jdb_minsize''
jdb_wd 'pactive'

)
EX2=: '1234' ;&,&> ':'
EX0=: EX2 ,. < ,'0'
EX1=: EX2 ,. < ,'('
jdb_boxrep=: 4 : 0

'tac nmc'=. x
if. tac do.
  rep=. SUBTC (I.y=LF) } y
  nmc;2$<<rep return.
end.
hdr=. ;: LF jdb_taketo y
if. 1 e. , b=. EX0 E."1 hdr do.
  cls=. >: (+./"1 b) i. 1
  rep=. }. }: <;._2 y,LF
elseif. 1 e. , b=. EX1 E."1 hdr do.
  cls=. >: (+./"1 b) i. 1
  bgn=. 3 + 1 i.~ +./ b
  hdr=. bgn }. hdr
  hdr=. ; (hdr i. <,')') {. hdr
  try.
    rep=. ". hdr
  catch.
    rep=. hdr
  end.
elseif. 1 e. , b=. EX2 E."1 hdr do.
  cls=. >: (+./"1 b) i. 1
  ndx=. 2 + 1 i.~ +./ b
  try.
    rep=. ". ndx >@{ hdr
  catch.
    rep=. }. }: ndx >@{ hdr
  end.
elseif. do.
  cls=. _1
  rep=. y
end.
rep=. jdb_boxxopen rep
ind=. rep i. < ,':'
if. ind < #rep do.
  cls ; (ind {. rep) ; < (1+ind) }. rep
else.
  cls ; rep ; < rep
end.
)
j=. SHOWWID & {.
jdb_curtail=: ]`(j f.) @. (jdb_vSHOWWID < #)
j=. (SHOWWID-3) & {. , '...'"_
jdb_curtailed=: ]`(j f.) @. (jdb_vSHOWWID < #)
jdb_getdrep=: 3 : 0
'name loc'=. y

if. 0 e. $name do. '' return. end.

bloc=. <loc

if. 1 e. '__' E. }: name do.
  j=. jdb_splitind name
  if. 2 ~: #j do. '' return. end.
  'a b'=. j
  if. 0 ~: nc <b do. '' return. end.
  c=. (b,'_',loc,'_')~
  if. 1 ~: L. c do. '' return. end.
  18!:4 c
  nc=. 4!:0 :: _2: <a
  18!:4 <'jdebug'
  if. -. nc e. 1 2 3 do. '' return. end.
else.
  18!:4 bloc
  nc=. 4!:0 :: _2: <name
  18!:4 <'jdebug'
  if. -. nc e. 1 2 3 do. '' return. end.
end.

18!:4 bloc
def=. 5!:5 <name
18!:4 <'jdebug'

def
)
jdb_fixdef=: 4 : 0
type=. 'acvu' {~ 1 2 3 i. x
type,' ',jdb_subchars y
)
jdb_fixnoun=: 3 : 0

shape=. $y
len=. */shape

if. 0 = L. y do.
  y=. jdb_fixopen y

else.

  if. 1 = L. y do.
    if. 1 = len do.
      y=. '<',jdb_fixopen >{.y
    else.
      y=. jdb_curtail ,y
      ben=. */ @ $ S: 0 y
      if. 1000 < +/ ben do.
        y=. '{boxed}'
      else.
        y=. }. ; (',(<'&, @ (,&')')) &.> jdb_fixopen &.> y
      end.
    end.
  else.
    y=. '{boxed}'
  end.
  y=. (jdb_repshape shape), y

end.

r=. jdb_curtailed 'n ',jdb_subchars y

)
jdb_fixopen=: 3 : 0

shape=. $y
len=. */shape
rsh=. jdb_repshape shape

if. jdb_issparse y do.
  if. 1000 < len do.
    rsh, '{sparse}' return.
  else.
    t=. $. ^:_1 y
  end.
else.
  t=. y
end.

if. 0=#shape do.
  ":t
else.
  t=. jdb_curtail ,t
  jdb_curtailed rsh,jdb_quoteme t
end.
)
jdb_leaves=: ([: ; <@":@, S: 0) ^: (L. > 0:)
a=. ''''
jdb_quote=: (a&,@(,&a))@ (#~ >:@(=&a))
jdb_quoteme=: ":`jdb_quote @. (2&=@(3!:0))
jdb_repshape=: (0: < #) # ": , '$'"_
SUBTC=: 1{a.
jdb_subtc=: SUBTC & (I. @ (e.&(9 10 12 13{a.)) @] })
jdb_remzero=: -. & ({.a.)
jdb_subchars=: jdb_remzero @: jdb_subtc
jdb_viewname=: 4 : 0
max=. 50000
shape=. $y
scalar=. 0=#shape
type=. jdb_datatype y

dat=. jdb_flatten y
if. max < #dat do.
  dat=. (max {. dat),LF,'...'
end.

tag=. type
tag=. tag, scalar >@{ (' shape ',":shape);' scalar'

if. type -: 'boxed' do.
  tag=. tag, ' depth ',":L. y
end.

dat=. x,LF,LF,tag,LF,LF,dat

jdbview_run dat
)
TIDS=: ' ' ,. 'nacvd' ,. ' '
jdb_addlocale=: 4 : 0
if. ('_' ~: _1 {. y) > 1 e. '__' E. y do.
  if. '_' ~: _1 {. x do.
    t=. '_',(>x),'_'
  else.
    t=. x
  end.
  y,t
else.
  y
end.
)
jdb_showglobals=: 4 : 0
if. 0 e. $y do. '' return. end.

ind=. (1: e. '__'&E.) @: }: &> y
18!:4 x
nmc=. 4!:0 :: _2: "0 y
18!:4 <'jdebug'
nmc=. nmc - ind *. nmc=_1

msk=. nmc = 0
val=. msk # y
med=. nmc > 0
def=. med # y
GDEFS=: GDEFS, def

18!:4 x
if. #val do. val=. ". &.> val end.
if. #def do. def=. <@(5!:5) "0 def end.
18!:4 <'jdebug'

val=. jdb_fixnoun &.> val
def=. (med # nmc) jdb_fixdef &.> def

res=. (#msk) # <'{undefined}'
res=. (<'{unknown}') (I. nmc=_2)} res
res=. val (I. msk)} res
res=. def (I. med)} res
)
jdb_stackrep=: 3 : 0
'' jdb_stackrep y
:

if. 0 = #y do. y=. jdb_getstack'' end.
if. 0 = #y do. '' return. end.
LOCALVALS=: 7 {"1 y
y=. 7 {."1 y

STACKLOCALS=: {."1 &.> LOCALVALS
LOCALVALS=: {:"1 > {. LOCALVALS
LOCALNAMES=: > {. STACKLOCALS

'NAME ERRNUM CURRENTLINE'=: 3 {. {. y
if. 0 e. #NAME do. '' return. end.

LDEFS=. GDEFS=. ''
if. #x do.
  'linenum errmsg'=. x
else.
  linenum=. CURRENTLINE
  errmsg=. (ERRNUM <. <:#ERRORS) >@{ ERRORS
end.
nms=. 0{"1 y
lns=. linenum , }. ; 2{"1 y
nmc=. ; 3{"1 y
rps=. 4{"1 y
arglen=. # &> 6{"1 y
val=. (#nmc) # _1
if. 1 e. b=. nmc=3 do.
  val=. (<: b # arglen) (I. b)} val
end.
if. 1 e. b=. (nmc~:3) *. (1: e. MNUV&e.) &> STACKLOCALS do.
  sel=. (<'x')&e. &> b # STACKLOCALS
  val=. sel (I. b)} val
end.
nmc=. nmc + (nmc=3) *. val=1
tac=. 0 = # &> STACKLOCALS
brp=. (>: 0 >. val) >@{ &.> (<"1 tac,.nmc) jdb_boxrep &.> rps
bln=. # &> brp

if. 0=#brp do.
  jdb_info 'Unable to display Debug stack'
  '' return.
end.

if. 0={.bln do.
  jdb_info 'Unable to display top of stack'
  '' return.
end.

if. 0 e. bln do.
  brp=. (<'display not available') (I. bln)} brp
end.
'nam lnm typ'=. (<0;0 2 3) { y
dep=. 0 >@{ brp
LINES=: jdb_dtb &.> dep

dax=. jdb_indices &.> i.#dep
lines=. dax ,&.> dep

NUMLINES=: #lines
CODELINES=: jdb_codelines dep
VALENCE=: {. val
NMC=: {.nmc
lns=. lns <. bln
exl=. ;lns ({ ,& (<'{unknown}')) &.> brp
ind=. jdb_indices &.> lns
stack=. nms ,&.> ind ,&.> exl

st0=. errmsg
if. ERRNUM e. ERRORCODES do.
  erm=. <;._2 ERM_j_
  if. (3=#erm) *. linenum=CURRENTLINE do.
    st0=. st0,LF,NAME,'[',(":linenum),'] ',jdb_dlb }.1 >@{ erm
    stack=. }.stack
  end.
end.

stack=. st0 ; stack
wat=. jdb_cutopen WATCH
dfs=. jdb_getdefs 0 >@{ exl
dfs=. dfs -. MNUVXY
dfs=. ~. wat, ((MNUVXY e. LOCALNAMES)#MNUVXY), dfs
ndx=. LOCALNAMES i. dfs
msk=. ndx = #LOCALNAMES
lcs=. jdb_fixnoun &.> ((-.msk)#ndx) { LOCALVALS
glb=. LOCALE jdb_showglobals msk#dfs
vls=. (/:/:msk) { lcs,glb
values=. dfs ,&.> ' ' ,&.> vls
lines;stack;<values
)
a=. , ';'"_ -. {:
b=. i.&':' ({. ; }.@}.) ]
c=. i.&' ' ({. ; b @ }.@}.) ]
d=. c @ jdb_dlb
jdb_stopcut=: ([: d ;._2 a) f.
jdb_stopget=: 3 : 0
jdb_stopgetone NAME;'';VALENCE;NUMLINES;CODELINES
)
jdb_stopgetone=: 3 : 0
'name dummy valence numlines codelines'=. y
'astop ustop'=. jdb_stopson name;valence;codelines
astop=. (astop < numlines) # astop
ustop=. (ustop < numlines) # ustop
'*' ustop} '|' astop} numlines # ' '
)
jdb_stopread=: 3 : 0
sq=. 13!:2 ''
if. sq -: STOPLAST do. STOPS return. end.
if. 0 = #sq do.
  STOPS=: i.0 5
  return.
end.
stp=. /:~ jdb_stopcut sq
nms=. ~. {."1 stp
res=. nms ,"0 1 }. STOPNONE
for_i. 1 2 do.
  col=. i {"1 stp
  msk=. col = <,'*'
  if. 1 e. msk do.
    ndx=. ~. nms i. msk # nms
    res=. (<1) (<ndx;i) } res
  end.
  if. 0 e. msk do.
    mon=. 0 ". each (-.msk) # col
    bal=. (-.msk) # nms
    ndx=. nms i. ~.bal
    res=. (bal <@; /. mon) (<ndx;i+2) } res
  end.
end.
STOPS=: res
)
jdb_stoponall=: 4 : 0
nam=. {. jdb_boxxopen y
jdb_stopread ''
sel=. x
if. sel=2 do.
  sel=. -. (nam,1;1) e. 3 {."1 STOPS
end.
STOPS=: STOPS #~ nam ~: {."1 STOPS
if. sel do.
  STOPS=: STOPS, nam,1;1;'';''
end.
jdb_stopwrite ''
)
jdb_stopset=: 3 : '13!:3 STOPLAST=: y'
jdb_stopsetline=: 3 : 0
'' jdb_stopsetline y
:
x jdb_stopsetone NAME;VALENCE;y
jdb_stopwrite ''
)
jdb_stopsetone=: 3 : 0
'' jdb_stopsetone y
:
'name val line'=. y
if. (name;1;1) e. 3 {."1 STOPS do. return. end.

msk=. ({."1 STOPS) = <name
stp=. msk # STOPS
bal=. (-.msk) # STOPS
if. SMBOTH do. val=. 0 1 end.
if. 0 = #stp do.
  if. -. x -: 0 do.
    stp=. name;0;0;(0 1 e. val) {'';line
  end.
else.
  stp=. {. stp
  for_v. val do.
    'all sel'=. (val + 1 3) { stp
    select. x
    case. 0 do.
      if. all do.
        sel=. i.NUMLINES
        all=. 0
      end.
      sel=. sel -. line
    case. 1 do.
      if. -. all do.
        sel=. ~. line, sel
      end.
    case. do.
      if. line e. sel do.
        if. all do.
          sel=. i.NUMLINES
          all=. 0
        end.
        sel=. sel -. line
      else.
        sel=. line, sel
      end.
    end.
    stp=. (all;sel) (val + 1 3) } stp
  end.
end.

STOPS=: stp, bal
)
jdb_stopson=: 3 : 0
'name valence codelines'=. y
val=. 2 | valence
nms=. {."1 STOPS
x=. (nms i. <,name) { STOPS, STOPNONE
'all line'=. (val + 1 3) { x
as=. (1 e. all) # codelines
ls=. /:~ ~. line
as ; ls
)
jdb_stopwrite=: 3 : 0
if. 0 e. #STOPS do. jdb_stopset '' return. end.
STOPS=: (-. (}.STOPNONE) (-:}.)"1 STOPS) # STOPS
if. 0 e. #STOPS do. jdb_stopset '' return. end.
STOPS=: /:~ ~. STOPS
nms=. {."1 STOPS
mon=. ": each 3 {"1 STOPS
mon=. (<'*') (I. ;1 {"1 STOPS) } mon
dyd=. ": each 4 {"1 STOPS
dyd=. (<'*') (I. ;2 {"1 STOPS) } dyd
jdb_stopset ; (nms,.mon,.dyd) ,each "1 ' :;'
)
jdb_swap=: 3 : 0
'' jdb_swap y
:

jdb_lxsoff''

new=. y
old=. TABCURRENT

if. new -: old do. return. end.

cmd=. ''

if. #old do.
  (old,'_dun')~ 0
end.

cmd=. cmd, ';set tabs active ', ":TABGROUPS i. <new

if. old -: 'jdbnone' do.
  fx=. 0 ". jdb_wd 'qform'
  cmd=. cmd, ';pmove ',": (3 {. fx), {: FORMX
end.

if. new -: 'jdbnone' do.
  wd 'setshow tabs 0'
  FORMX=: 0 ". jdb_wd 'qform'
  cmd=. cmd, ';pmove ',": (3 {.FORMX), NONEHEIGHT
else.
  wd 'setshow tabs 1'
end.

TABCURRENT=: new

(new,'_ini')~ x
jdb_wd LASTCMD=: cmd
jdb_wd 'setshow tabs ', ":new-.@-:'jdbnone'
jdb_shiver''
jdb_tbenable''
jdb_swapfkey''
)
TABGROUPS=: ;: 'jdbnone jdbmain jdbstop jdbwatch'
JDEBUG=: 0 : 0
pc jdebug;pn "Debug";
cc tbar toolbar;
set tbar add run "Run" "DEBUGPATH/system-run.png";
set tbar addsep;
set tbar add stepinto "Step into" "DEBUGPATH/go-down.png";
set tbar add stepover "Step over" "DEBUGPATH/media-seek-forward.png";
set tbar add stepout "Step out" "DEBUGPATH/go-up.png";
set tbar addsep;
set tbar add runcursor "Run to cursor" "DEBUGPATH/jump-to.png";
set tbar add cutback "Cut back" "DEBUGPATH/go-top.png";
set tbar addsep;
set tbar add back "Back" "DEBUGPATH/go-previous.png";
set tbar add refresh "Refresh" "DEBUGPATH/refresh.png";
set tbar add forward "Forward" "DEBUGPATH/go-next.png";
set tbar addsep;
set tbar add stopname "Stop name at cursor" "DEBUGPATH/media-playback-pause.png";
set tbar add stopwin "Stop Manager" "DEBUGPATH/process-stop.png";
set tbar add watchwin "Watch Manager" "DEBUGPATH/zoom-in.png";
set tbar add editdef "Edit definition" "DEBUGPATH/open.png";
set tbar addsep;
set tbar add stack "View stack" "DEBUGPATH/spreadsheet.png";
set tbar addsep;
set tbar add clear "Clear" "DEBUGPATH/clear.png";
minwh 530 1;cc tabs tab nobar;
pas 0 0;pcenter;
rem form end;
)
jdebug_run=: 3 : 0

name=. (y-:1) >@{ 'jdbnone';'jdbmain'

if. jdb_isparent 'jdebug' do.
  jdb_wd 'psel jdebug;pactive'
  jdb_swap name

else.
  TABLOADED=: ''
  TABCURRENT=: ''

  jdb=. JDEBUG rplc 'DEBUGPATH';jpath '~addons/ide/qt/images'
  jdb_wd jdb
  for_i. TABGROUPS do.
    new=. >i
    (new,'_run')~ 0
    TABLOADED=: TABLOADED,<new
  end.

  HWNDP=: 0 ". jdb_wd 'qhwndp'

  if. y-:1 do.
    jdb_wd 'setshow tabs 1'
    jdb_wd 'pmove 0 0 ', ": (MINWIDTH,0) >. _2{. 0 ". jdb_wd 'qform'
  else.
    jdb_wd 'setshow tabs 0'
    jdb_wd 'pmove 0 0 530 30'
  end.
  FORMX=: 0 ". jdb_wd 'qform'

  jdb_swap name
  jdb_wd 'pshow'

end.

jdb_wd 'ptop ',":PTOP
)
jdebug_clearstops=: 3 : 0
jdb_lxsoff''
jdb_dbss''
jdb_lexwin''
jdb_lxson''
)
jdebug_runnext=: 3 : 0
jdb_restore''
if. MOVELINE=CURRENTLINE do.
  13!:5 ''
else.
  13!:7 MOVELINE
end.
)
jdebug_hctrl_fkey=: 3 : 0
if. jdb_isparent 'jdbscut' do.
  jdb_wd 'psel jdbscut;pactive'
else.
  jdbscut_run''
end.
)
jdebug_wctrl_fkey=: 3 : 0
jdb_lxsoff''
smprompt_jijs_ '   ',jdb_dlb MOVELINE >@{ LINES
smact''
jdb_lxson''
)
jdebug_tctrl_fkey=: 3 : 0
jdb_lxsoff''
PTOP=: -. PTOP
jdb_wd 'psel jdebug;ptop ',":PTOP
jdb_lxson''
)
jdebug_tabs_select=: 3 : 0
new=. (0". tabs_select){::TABGROUPS
select. new
case. 'jdbmain' do. jdebug_winmain''
case. 'jdbstop' do. jdebug_stopwin_button''
case. 'jdbwatch' do. jdebug_watchwin_button''
end.
)
jdebug_cancel=: jdebug_close=: jdb_close
jdebug_tctrlshift_fkey=: jdb_stopsview

jdebug_enter=: ]
JDBMAIN=: 0 : 0
tabnew jdbmain;
cc lines editm readonly;
cc stack editm readonly;
cc value editm readonly;
)
jdbmain_dun=: ]
jdbmain_ini=: ]
jdbmain_run=: 3 : 0
jdb_wd JDBMAIN
jdb_wd 'setfont lines ',SMFONT
jdb_wd 'setfont stack ',SMFONT
jdb_wd 'setfont value ',SMFONT
)
jdbmain_editdef_button=: 3 : 0
if. -.jdb_istabenable 'editdef' do. return. end.
jdb_lxsoff''

sf=. <'lines'
sf=. (sf e. 'lines';'stack';'value') # sf

if. 0=#sf do.
  jdb_info 'No name selected' return.
else.
  sf=. >{. sf
end.

name=. 1 >@{ (0 ". (sf,'_select')~) jdb_getnameat sf~

if. 0 e. #name do.
  jdb_edit LOCALE jdb_addlocale NAME
else.
  if. (<name) e. LOCALNAMES do.
    name jdb_viewname > (LOCALNAMES i. <name) { LOCALVALS
  else.
    nameloc=. LOCALE jdb_addlocale name
    select. 4!:0 <nameloc
    case. 1;2;3 do.
      jdb_edit nameloc
    case. 0 do.
      name jdb_viewname ".nameloc
    case. do.
      jdb_info 'Unable to view: ',name
    end.
  end.
end.

jdb_lxson''
)
jdbmain_stopatline_button=: 3 : 0
if. NUMLINES=1 do.
  jdebug_stopall_button''
else.
  jdb_lxsoff''

  bgn=. {. 0 ". lines_select
  line=. +/ LF = bgn {. lines
  opt=. (line e. CODELINES) >@{ 0;''
  opt jdb_stopsetline line
  jdb_lxson''
end.
)
jdbmain_stopname_button=: 3 : 0
if. -.jdb_istabenable 'stopname' do. return. end.
jdb_lxsoff''
'ndx name'=. jdbmain_getname''
if. #name do.
  1 jdb_stoponall name
  jdb_wd 'setselect lines ',":ndx
end.
jdb_lxson''
)
jdbmain_stopwin_button=: 3 : 0
if. -.jdb_istabenable 'stopwin' do. return. end.
jdb_lxsoff''
'ndx name'=. jdbmain_getname''
name jdb_swap 'jdbstop'
jdb_lxson''
)
jdebug_lines_button=: jdebug_stepover_button
jdebug_stack_button=: jdebug_stepover_button
jdebug_value_button=: jdebug_stepover_button
jdbmain_getname=: 3 : 0
sel=. 0 ". lines_select
end=. I. LF=lines,LF
bgn=. 0, 1+}:end
if. sel e. bgn ,. end do.
  'ndx name'=. sel jdb_getnamesat lines
else.
  'ndx name'=. sel jdb_getnameat lines
end.
)

jdb_writelines=: 4 : 0
len=. 0, +/\ 1 + # &> y
jdb_wd 'set lines text *', jdb_listboxed y
jdb_wd 'setscroll lines ',":SCROLL
jdb_wd 'setfocus lines'
if. x do.
  jdb_wd 'setselect lines ',": 0 _1 + (MOVELINE+0 1){len
end.
jdb_minsize''
)
JDBNONE=: 0 : 0
tabnew jdbnone;
)
jdbnone_dun=: ]
jdbnone_ini=: ]
jdbnone_run=: 3 : 0
jdb_wd JDBNONE
)
jdbnone_stopwin_button=: 3 : 0
if. -.jdb_istabenable 'stopwin' do. return. end.
'' jdb_swap 'jdbstop'
jdb_lxson''
)

jdbnone_editdef_button=: empty
jdbnone_stopname_button=: empty
JDBSTOP=: 0 : 0
tabnew jdbstop;
bin v;
bin h;
cc stopline button;cn "Stop Line";
cc stopall button;cn "Stop All";
bin s;
cc close1 button;cn "Close";
bin z;
bin h;
bin v;
cc s0 static;cn "Name:";
cc name combobox;
bin z;
bin v;
cc s1 static;cn "In:";
cc locs combobox;
bin z;
bin z;
cc slines editm readonly;
bin z;
)
CX=: <'Current execution'
jdbstop_dun=: ]
jdbstop_ini=: 3 : 0

lc=. (18!:1[0), 18!:1[1
hd=. ;: 'base z'
lc=. hd, lc -. hd

if. jdb_inactive'' do.
  SMLOC=: <'base'
  SMLOCS=: SMLOC,lc -. SMLOC,<'jdebug'
  STNAMES=: i.0 2
  jdb_wd 'set locs items ',jdb_toDEL SMLOCS
  jdb_stoplocaleset SMLOC
else.
  SMLOC=: CX
  j=. SMLOC, ~. LOCALE, <'base'
  SMLOCS=: j, lc -. j
  jdb_wd 'set locs items ',jdb_toDEL SMLOCS
  nms=. {."1 STACK
  nms=. ~. (jdb_boxxopen y), nms
  r=. ([:{.(_2&{.@I.@('_'=])))&.>nms
  p=. ;('_'={:)&.>nms
  nms1=. (r+&.>(-.p)*&.>#&.>nms){.&.>nms
  SMNAMES=: nms1 ,. LOCALE(I. -.;p)} ([:}.(}:))&.>r}.&.> nms
  STNAMES=: SMNAMES
  0 jdb_stopswritedef SMNAMES
end.
jdb_wd 'setselect locs 0'

)
jdbstop_run=: 3 : 0
jdb_wd JDBSTOP
jdb_wd 'setfont slines ',SMFONT
)
jdbstop_editdef_button=: 3 : 0
if. -.jdb_istabenable 'editdef' do. return. end.
'nam loc'=. jdbstop_getcurrentname''
jdb_edit loc jdb_addlocale nam
jdb_lxson''
)
jdebug_stopall_button=: 3 : 0
jdb_lxsoff''
ndx=. {. _1,~ 0 ". name_select
if. _1=ndx do. jdb_lxson'' return. end.
nam=. {. ndx { SMNAMES
2 jdb_stoponall nam
jdb_stoprefresh {: 0 ". slines_select
jdb_lxson''
)
jdebug_stopline_button=: 3 : 0
jdb_lxsoff''
if. -. LF e. slines do.
  jdebug_stopall_button''
else.
  'bgn end'=. 2{._1 _1,~ 0 ". slines_select
  num=. +/ LF = bgn {. slines
  val=. num > {. SMCOUNT
  line=. num - val * 1 + {.SMCOUNT
  nam=. {. SMNDX { SMNAMES
  jdb_stopsetone nam,val;line
  jdb_stopwrite''
  jdb_stoprefresh end
end.
jdb_lxson''
)
jdbstop_stopname_button=: 3 : 0
if. -.jdb_istabenable 'stopname' do. return. end.

jdb_lxsoff''
if. 0 e. $j=. jdbstop_getnameat'' do. jdb_lxson'' return. end.
'pos name fullid'=. j

if. fullid -: jdbstop_getcurrentname'' do.
  jdebug_stopall_button''
else.
  1 jdb_stoponall name
  jdb_wd 'setselect slines ',":pos
  if. SMLOC-:CX do.
    SMNAMES=: ~. SMNAMES, fullid
    jdb_wd 'set name items ',jdb_listboxed {."1 SMNAMES
  end.
end.
jdb_lxson''
)
jdbstop_stopwin_button=: 3 : 0
if. -.jdb_istabenable 'stopwin' do. return. end.
jdb_lxsoff''
if. 0 e. $j=. jdbstop_getnameat'' do. jdb_lxson'' return. end.

'pos name fullid'=. j
if. fullid -: SMNDX { SMNAMES do. jdb_lxson'' return. end.

'rep both count'=. jdb_stoprep fullid
if. 0=#rep do.
  jdb_info 'No definition for name:',LF,LF,name
  jdb_lxson'' return.
end.

if. fullid e. SMNAMES do.
  nms=. SMNAMES
  ndx=. SMNAMES i. fullid
else.
  nms=. ~. fullid, SMNAMES
  ndx=. 0
end.

jdb_stopswritedefone rep;both;count;ndx;<nms
jdb_lxson''
)
jdebug_name_select=: 3 : 0
jdb_lxsoff''
ndx=. {. _1,~ 0 ". name_select
if. _1=ndx do. jdb_lxson'' return. end.
if. ndx ~: SMNDX do.
  name=. ndx { SMNAMES
  'rep both count'=. jdb_stoprep name
  if. 0=#rep do.
    j=. 'Unable to get representation of:', LF, LF
    jdb_info j, 0 >@{ ndx { SMNAMES
    SMNAMES=: (<<<ndx) { SMNAMES
    SMNDX=: SMNDX - SMNDX > ndx
    jdb_wd 'set name items ',jdb_listboxed {."1 SMNAMES
    jdb_wd 'setselect name ', ": SMNDX
  else.
    jdb_wd 'set slines text *',jdb_listboxed rep
    SMNDX=: ndx
    NMC=: 4!:0 name
    SMBOTH=: both
    SMCOUNT=: count
  end.
end.
jdb_lxson''
)
jdebug_locs_select=: 3 : 0
jdb_lxsoff''
jdb_stoplocaleset locs
jdb_lxson''
)
jdbstop_getcurrentname=: 3 : 0
ndx=. 0 ". name_select
ndx { SMNAMES
)
jdbstop_getnameat=: 3 : 0

'pos name'=. (0 ". slines_select) jdb_getnameat slines

if. 0 = #name do. '' return. end.
loc=. {: SMNDX { SMNAMES
fullid=. loc jdb_fullname name
pos;name;<fullid
)
jdb_stoplocaleset=: 3 : 0
bloc=. jdb_boxopen y
ndx=. SMLOCS i. bloc
idx=. 0

if. bloc -: CX do.
  idx jdb_stopswritedef STNAMES
else.
  18!:4 bloc
  ids=. 4!:1 [ 1 2 3
  18!:4 <'jdebug'
  idx jdb_stopswritedef ids ,. bloc
end.

jdb_wd 'setselect locs ',": ndx
SMLOC=: bloc
)
jdb_stopname=: 3 : 0
if. 0 = #y do. 0 return. end.
jdb_wd 'set locs items;setenable locs 0'
y=. jdb_fullname y
nms=. ~. y,SMNAMES,NAME;LOCALE
if. 0 jdb_stopswritedef nms do.
  STNAMES=: ~. y, SMNAMES
  1
else.
  0
end.
)
jdb_stoprefresh=: 3 : 0
'nam loc'=. jdbstop_getcurrentname''
'rep both count'=. jdb_stoprep nam;loc
srep=. jdb_listboxed rep
jdb_wd 'set slines text *', srep
if. #y do.
  sel=. 2 $ y
  jdb_wd 'setselect slines ',":sel, 0
end.
jdb_wd 'setfocus slines'
SMBOTH=: both
SMCOUNT=: count
)
jdb_stoprep=: 3 : 0

name=. jdb_boxopen y
rep=. jdb_getdrep name
lname=. ; name ,each '_'
both=. 0

if. 0=#rep do. '';0;0 0 return. end.

tac=. -. jdb_isexplicit lname
cls=. 4!:0 <lname
'cls rep0 rep1'=. (tac,cls) jdb_boxrep rep

if. rep0 -: rep1 do.
  if. cls=4 do.
    rep0=. ''
  else.
    both=. 1
    rep1=. ''
  end.
end.

cod0=. jdb_codelines rep0
cod1=. jdb_codelines rep1
num0=. #rep0
num1=. #rep1

if. num0 do.
  stp0=. jdb_stopgetone name,0;num0;cod0
  r=. stp0 ,&.> jdb_indexit rep0
else.
  r=. ''
end.

if. num1 do.
  stp1=. jdb_stopgetone name,1;num1;cod1
  r=. r, <' [:] ',40#'-'
  r=. r, stp1 ,&.> jdb_indexit rep1
end.

r; both ; num0, num1

)
jdb_stopswritedef=: 4 : 0
if. 0 e. #y do.
  jdb_stopswritedefone ''
else.
  'rep both count'=. jdb_stoprep x { y
  jdb_stopswritedefone rep;both;count;x;<y
end.
)
jdb_stopswritedefone=: 3 : 0
if. 0 e. #y do.
  jdb_wd 'set name items;set slines text'
  SMNAMES=: i.0 2
  SMNDX=: 0
  SMCOUNT=: 0 0
  0
else.
  'rep both count ndx nms'=. y
  jdb_wd 'set name items ',jdb_listboxed {."1 nms
  jdb_wd 'setselect name ',": ndx
  jdb_wd 'set slines text *', jdb_listboxed rep
  jdb_wd 'setenable name 1;setenable slines 1'
  SMNAMES=: nms
  SMNDX=: ndx
  SMBOTH=: both
  SMCOUNT=: count
  *#rep
end.
)

jdebug_close1_button=: jdebug_mainwin
j=. 0 : 0
run       0 1 0 0
stepinto  0 1 0 0
stepover  0 1 0 0
stepout   0 1 0 0
runcursor 0 1 0 0
cutback   0 1 0 0
back      0 1 0 0
refresh   0 1 0 0
forward   0 1 0 0
stopname  0 1 1 0
stopwin   1 1 1 1
watchwin  1 1 1 0
editdef   0 1 1 0
stack     0 1 1 1
clear     0 1 1 1
)
f=. (1: + i.&' ') ({.;".@}.) ]
j=. f ;._2 j
nms=. ';setenable '&, &.> {."1 j
nms1=. deb&.> {."1 j
vls=. >{:"1 j

a=. }.;nms (,":) &.> 0 {"1 vls
b=. }.;nms (,":) &.> 1 {"1 vls
c=. }.;nms (,":) &.> 2 {"1 vls
d=. }.;nms (,":) &.> 3 {"1 vls
TBENABLE=: a;b;c;d

a=. <nms1 ,. <("0) 0 {"1 vls
b=. <nms1 ,. <("0) 1 {"1 vls
c=. <nms1 ,. <("0) 2 {"1 vls
d=. <nms1 ,. <("0) 3 {"1 vls
TBENABLE1=: a,b,c,d
jdb_tabcurrent=: 3 : 'TABGROUPS i. <TABCURRENT'
jdb_tbenable=: 3 : 0
jdb_wd 'set tabs active ', ":(jdb_tabcurrent'')
)
jdb_istabenable=: 3 : 0
nms=. {."1 a=. (jdb_tabcurrent'') >@{ TBENABLE1
vls=. >{:"1 a
(nms i. boxopen y){vls
)
jdebug_back_button=: 3 : 0
if. -.jdb_istabenable 'back' do. return. end.
MOVELINE=: jdb_nextline _1
jdb_lexwin''
)
jdebug_clear_button=: 3 : 0
if. -.jdb_istabenable 'clear' do. return. end.
jdb_clear''
)
jdebug_cutback_run=: 3 : 0
if. -.jdb_istabenable 'cutback' do. return. end.
jdb_restore''
13!:19 ''
)
jdebug_forward_button=: 3 : 0
if. -.jdb_istabenable 'forward' do. return. end.
MOVELINE=: jdb_nextline 1
jdb_lexwin''
)
jdebug_help_button=: 3 : 0
jdb_lxsoff''
jdb_stopread''
jdb_dbss''
if. 0 -: htmlhelp_j_ :: 0: 'user/debugs.htm' do.
  jdb_info 'Unable to access debug help'
end.
jdb_stopwrite''
jdb_lxson''
)
jdebug_stack_button=: 3 : 0
if. -.jdb_istabenable 'stack' do. return. end.
require '~addons/ide/qt/dbview.ijs'
jdbview_jdbview_ STACK
)
jdebug_refresh_button=: 3 : 0
if. -.jdb_istabenable 'refresh' do. return. end.
MOVELINE=: CURRENTLINE
jdb_lexwin''
)
jdebug_run_run=: 3 : 0
if. -.jdb_istabenable 'run' do. return. end.
jdb_restore''
if. MOVELINE=CURRENTLINE do.
  13!:4 ''
else.
  13!:7 MOVELINE
end.
)
jdebug_runcursor_run=: 3 : 0
if. -.jdb_istabenable 'runcursor' do. return. end.
line=. jdb_getcursorline''
if. line <: CURRENTLINE do.
  jdb_info 'Line selected should be after current line' return.
elseif. line > >./ CODELINES do.
  jdb_info 'Cannot stop on selected line' return.
end.
jdb_restore''
names=. {."1 STACK
CUTNAMES=: LOCALE jdb_addlocale &.> names
CUTLINES=: ; 2 {"1 STACK
0 jdb_stopsetline CURRENTLINE + i. line - CURRENTLINE
1 jdb_stopsetline line
jdb_restore''
13!:4''
)
jdebug_stepout_run=: 3 : 0
if. -.jdb_istabenable 'stepout' do. return. end.
jdb_restore''
if. MOVELINE=CURRENTLINE do.
  13!:22 ''
else.
  MOVELINE 13!:22 ''
end.
)
jdebug_stepover_run=: 3 : 0
if. -.jdb_istabenable 'stepover' do. return. end.
jdb_restore''
if. MOVELINE=CURRENTLINE do.
  13!:20 ''
else.
  MOVELINE 13!:20 ''
end.
)
jdebug_stepinto_run=: 3 : 0
if. -.jdb_istabenable 'stepinto' do. return. end.
jdb_restore''
if. MOVELINE=CURRENTLINE do.
  13!:21 ''
else.
  MOVELINE 13!:21 ''
end.
)
jdebug_main=: 3 : 0
if. jdb_inactive'' do.
  jdb_swap 'jdbnone'
else.
  jdb_swap 'jdbmain'
  if. #jdb_getstack'' do.
    jdb_lexwin''
  end.
end.
jdb_lxson''
)
jdebug_watchwin_button=: 3 : 0
if. -.jdb_istabenable 'watchwin' do. return. end.
jdb_lxsoff''
jdb_swap 'jdbwatch'
jdb_lxson''
)
jdebug_mainwin=: 3 : 0
if. jdb_inactive'' do.
  jdb_swap 'jdbnone'
else.
  jdb_swap 'jdbmain'
  if. #jdb_getstack'' do.
    jdb_lexwin''
  end.
end.
jdb_lxson''
)
jdebug_editdef_button=: 3 : '(TABCURRENT,''_editdef_button'')~0'
jdebug_stopname_button=: 3 : '(TABCURRENT,''_stopname_button'')~0'
jdebug_stopwin_button=: 3 : '(TABCURRENT,''_stopwin_button'')~0'
jdebug_stepover_button=: immexj bind 'jdebug_stepover_run_jdebug_$0'
jdebug_stepinto_button=: immexj bind 'jdebug_stepinto_run_jdebug_$0'
jdebug_stepout_button=: immexj bind 'jdebug_stepout_run_jdebug_$0'
jdebug_cutback_button=: immexj bind 'jdebug_cutback_run_jdebug_$0'
jdebug_runcursor_button=: immexj bind 'jdebug_runcursor_run_jdebug_$0'
jdebug_run_button=: immexj bind 'jdebug_run_run_jdebug_$0'
JDBVIEW=: 0 : 0
pc jdbview closeok owner;cn "View";
minwh 470 300;cc e0 editm readonly;
pas 0 0;pcenter;
rem form end;
)
VIEWFONT=: FIXFONT
jdbview_run=: 3 : 0
jdb_wd JDBVIEW
jdb_wd 'setfont e0 ',VIEWFONT
jdb_wd 'set e0 text *',y
jdb_wd 'pshow'
)
jdbview_close=: 3 : 'jdb_wd ''pclose'''
jdbview_cancel=: jdbview_close
JDBWATCH=: 0 : 0
tabnew jdbwatch;
bin hv;
groupbox "Enter Watch Names";
cc wlist editm;
groupboxend;
bin zv;
cc watchclear button;cn "Clear";
cc close2 button;cn "Close";
bin szz;
)
jdbwatch_dun=: 3 : 0
if. 0 ~: 4!:0 <'wlist' do. return. end.

txt=. ' ' (I. wlist=LF)} wlist
nms=. jdb_cutopen txt
nmc=. (4!:0 :: _2:)"0 nms
if. _2 e. nmc do.
  bad=. nmc = _2
  t=. ;: ^:_1 bad # nms
  jdb_info 'Invalid watch name',((1<+/bad)#'s'),': ',t
  return.
end.
WATCH=: nms
)
jdbwatch_ini=: 3 : 0
txt=. jdb_tolist jdb_cutopen WATCH
jdb_wd 'set wlist text *',txt
jdb_wd 'setfocus wlist'
)

jdbwatch_run=: 3 : 0
jdb_wd JDBWATCH
jdb_wd 'setfont wlist ',SMFONT
)
jdebug_watchclear_button=: 3 : 0
jdb_wd 'set wlist text'
jdb_lxson''
)
jdbwatch_stopwin_button=: 3 : 0
if. -.jdb_istabenable 'stopwin' do. return. end.
'' jdb_swap 'jdbstop'
jdb_lxson''
)

jdbwatch_editdef_button=: empty
jdbwatch_stopname_button=: empty
jdebug_close2_button=: jdebug_mainwin
