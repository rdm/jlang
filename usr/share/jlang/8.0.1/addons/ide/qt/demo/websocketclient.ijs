NB. websocket client
NB.

cocurrent 'z'

coclass 'qtdemo'

wscln_handler=: 3 : 0
'evt sk'=. y
if. evt = jws_onMessage do.
  wd 'psel ',hwndwsc
  wscbuffer=: LF,~ wscbuffer, wsc0_jrx_
  wd 'set m text *', wscbuffer
elseif. evt = jws_onOpen do.
  smoutput 'connected'
elseif. evt = jws_onClose do.
  smoutput 'disconnected'
elseif. evt = jws_onError do.
  smoutput wsc0_jrx_
end.
EMPTY
)

wsserver1=: wsserver2=: ''

NB. =========================================================
websocketclient=: 3 : 0
wd 'pc websocketclient'
wd 'bin v'
wd 'groupbox "Echo Server"'
wd 'bin vh'
wd 'cc ipaddr1 edit'
wd 'cc connect1 button'
wd 'cc disconnect1 button'
wd 'bin zh'
wd 'cc e1 edit'
wd 'cc send1 button'
wd 'bin zz'
wd 'groupboxend'
wd 'groupbox "J REPL"'
wd 'bin vh'
wd 'cc ipaddr2 edit'
wd 'cc connect2 button'
wd 'cc disconnect2 button'
wd 'bin zh'
wd 'cc e2 edit'
wd 'cc send2 button'
wd 'bin zz'
wd 'groupboxend'
wd 'bin h'
wd 'cc clear button'
wd 'bin sz'
wd 'cc m editm readonly'
wd 'bin z'
wd 'pshow'
hwndwsc=: wd 'qhwndp'
wscbuffer=: ''
wd 'set ipaddr1 text ws://echo.websocket.org 80'
wd 'set e1 text *hello world'
wd 'set ipaddr2 text ws://localhost 3000'
wd 'set e2 text *i.4 5'
)

NB. =========================================================
websocketclient_connect1_button=: 3 : 0
wd 'ws close ', wsserver1
wsserver1=: wd 'ws connect ', ipaddr1
)

websocketclient_disconnect1_button=: 3 : 0
wd 'ws close ', wsserver1
wsserver1=: ''
)

websocketclient_send1_button=: 3 : 0
r=. 0 ". wd 'ws send ',wsserver1, ' *',e1
assert. _1 ~: r
)

NB. =========================================================
websocketclient_connect2_button=: 3 : 0
wd 'ws close ', wsserver2
wsserver2=: wd 'ws connect ', ipaddr2
)

websocketclient_disconnect2_button=: 3 : 0
wd 'ws close ', wsserver2
wsserver2=: ''
)

websocketclient_send2_button=: 3 : 0
r=. 0 ". wd 'ws sendb ',wsserver2, ' *',e2  NB. both send or sendb should be ok
assert. _1 ~: r
)

NB. =========================================================
websocketclient_clear_button=: 3 : 0
wscbuffer=: ''
wd 'set m text *'
)

NB. =========================================================
websocketclient_e1_button=: websocketclient_send1_button
websocketclient_e2_button=: websocketclient_send2_button

NB. =========================================================
websocketclient_close=: 3 : 0
wd 'ws close ', wsserver1
wd 'ws close ', wsserver2
wsserver1=: wsserver2=: ''
wd 'pclose'
)

NB. =========================================================
smoutput 0 : 0
needs to start websocket demo
in order to use ws://localhost
)

wscln_handler_z_=: wscln_handler_qtdemo_

NB. =========================================================
websocketclient''
