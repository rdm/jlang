NB. parent styles demo

coclass 'qtdemo'

PSmsg=: 0 : 0
<p>Select one or more form styles, then create the form.</p>

<p>Normal forms show close, min and max buttons by default,<br>
and are resizable. The form close button triggers an event.<p>

<table>
<tr><td>dialog</td><td>display window decorations as a dialog</td></tr>
<tr><td>owner</td><td>the form is modal to a single window hierarchy</td></tr>
<tr><td>popup</td><td>a popup window with no window decorations</td></tr>
<tr><td>closeok</td><td>form close button closes the form with no event</td></tr>
<tr><td>escclose</td><td>pressing Esc closes the form</td></tr>
<tr><td>nosize</td><td>the form may not be resized</td></tr>
<tr><td>ptop</td><td>the form stays on top</td></tr>
<tr><td>closebutton</td><td>show form close button</td></tr>
<tr><td>minbutton</td><td>show form minimize button</td></tr>
<tr><td>maxbutton</td><td>show form maximize button</td></tr>
</table>
<p>
Styles <i>dialog</i> and <i>popup</i> are alternatives.<br/>
Others are independent.
)

NB. =========================================================
PSdemo=: 0 : 0
pc psdemo escclose nosize;
pn "Form Styles";
cc lab static;
bin p12hv;
cc dialog checkbox;
cc owner checkbox;
cc popup checkbox;
bin sz;
linev;
bin v;
cc closeok checkbox;
cc escclose checkbox;
bin sz;
linev;
bin v;
cc nosize checkbox;
cc ptop checkbox;
bin sz;
linev;
bin v;
cc closebutton checkbox;
cc minbutton checkbox;
cc maxbutton checkbox;
bin szv;
cc ok button;cn "Create Form";
bin sz;
)

NB. =========================================================
psdemo_run=: 3 : 0
wd PSdemo
wd 'set lab text ',PSmsg
wd 'pmove 50 50 0 0'
wd 'pshow'
)

NB. =========================================================
psdemo_close=: 3 : 0
wd 'pclose'
)

NB. =========================================================
psdemo_dialog_button=: 3 : 0
if. 0 ". dialog do.
  wd 'set popup value 0'
end.
)

NB. =========================================================
psdemo_ok_button=: 3 : 0
s=. 'closeok dialog owner escclose nosize popup ptop'
s=. s,' closebutton minbutton maxbutton'
s=. ;: s
r=. 'pc stylesdemo'
m=. (0 ". ".) &> s
r=. r,;' ',each m#s
wd r
wd 'cc ted editm'
wd 'set ted text *How grand to be a Toucan',LF,'Just think what Toucan do.'
wd 'cc close button;pmove 600 100 300 200;pshow'
)

NB. =========================================================
psdemo_popup_button=: 3 : 0
if. 0 ". popup do.
  wd 'set dialog value 0'
end.
)

NB. =========================================================
stylesdemo_close=: 3 : 0
smoutput 'stylesdemo_close called'
wd 'pclose'
)

NB. =========================================================
stylesdemo_close_button=: 3 : 0
smoutput 'stylesdemo_close_button called'
wd 'pclose'
)

NB. =========================================================
psdemo_run''
