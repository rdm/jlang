require 'gl3'
coinsert 'jgl3'

coclass 'qtdemo'

A=: 0 : 0
pc a;
minwh 300 300;cc g opengl compatibility flush;
rem form end;
)

a_run=: 3 : 0
wd A
SPHERE=: 2
wd 'pshow'
)

a_g_initialize=: 3 : 0
if. p=. >@{. glGetString GL_VERSION do. smoutput 'GL_VERSION: ', memr 0 _1 2,~ p end.
if. 0=p do. smoutput 'cannot retrieve GL_VERSION' return. end.
if. p=. >@{. glGetString GL_VENDOR do. smoutput 'GL_VENDOR: ', memr 0 _1 2,~ p end.
if. p=. >@{. glGetString GL_RENDERER do. smoutput 'GL_RENDERER: ', memr 0 _1 2,~ p end.
if. p=. >@{. glGetString 16b8b8c do. smoutput 'GL_SHADING_LANGUAGE_VERSION: ', memr 0 _1 2,~ p end.
)

a_g_paint=: 3 : 0
wh=. gl_qwh''
glViewport 0 0,wh
try.
  glMatrixMode GL_PROJECTION
catch.
  smoutput 'not supported' return.
end.
glLoadIdentity''
gluPerspective 30, (%/wh),1 10
glClearColor 0 0 0 0
glClear GL_COLOR_BUFFER_BIT + GL_DEPTH_BUFFER_BIT
glEnable GL_DEPTH_TEST
glMatrixMode GL_MODELVIEW
glLoadIdentity''
glTranslate 0 0 _8
light''
sphere''
glFlush''
)

sphere=: 3 : 0
obj=. {.>gluNewQuadric''
gluQuadricNormals obj,GLU_SMOOTH
gluQuadricDrawStyle obj,GLU_FILL
gluSphere obj,1.5 32 32
gluDeleteQuadric obj
)

light=: 3 : 0
glaLight GL_LIGHT0, GL_AMBIENT, 0.1 0.1 0.1 1
glaLight GL_LIGHT0, GL_DIFFUSE, 0.7 0.7 0.7 1
glaLight GL_LIGHT0,GL_SPECULAR, 0.0 0.0 0.0 1
glEnable GL_LIGHTING
glEnable GL_LIGHT0
glaMaterial GL_FRONT,GL_AMBIENT_AND_DIFFUSE, 1 0 0 1
)

a_close=: 3 : 0
wd 'pclose'
)

a_cancel=: a_close

a_run''
