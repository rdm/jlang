NB. websocket
NB.
cocurrent 'z'

coclass 'qtdemo'

wssvr_handler=: 3 : 0
'evt sk'=. y
if. evt = jws_onMessage do.
  try.
    r_jrx_=: ". wss0_jrx_
    r_jrx_=: , LF&, "1 ": r_jrx_
  catch.
    r_jrx_=: LF, 13!:12 ''
  end.
  r=. 0 ". wd 'ws send ',(":sk),' *', r_jrx_
  assert. _1 ~: r
elseif. evt = jws_onOpen do.
  smoutput 'connected'
elseif. evt = jws_onClose do.
  smoutput 'disconnected'
elseif. evt = jws_onError do.
  smoutput wss0_jrx_
end.
EMPTY
)

wssvr_handler_z_=: wssvr_handler_qtdemo_

NB. =========================================================
smoutput 0 : 0
also try type in J Term
  wd 'ws send 0 hello'
  wd 'ws send 1 "i.2 2"'
)

NB. start websocket server
wd 'ws listen 3000'

browse_j_ file2url jpath '~addons/ide/qt/demo/websocket.htm'
