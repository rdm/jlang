require 'gles'

cocurrent 'demoshader'
coinsert 'jgles'

mp=: +/ . *
sprog=: 0

A=: 0 : 0
pc a;
minwh 300 300;cc g opengl flush;
rem form end;
)

a_run=: 3 : 0
k=. 0{sysdata
STEPS=: 100
R=: 20 30 0
EYE=: 0 0 1
LR=: UD=: IO=: 0
UP=: 0 1 0
wd A
wd 'pshow'
)

a_g_initialize=: 3 : 0
if. p=. glGetString GL_VERSION do. smoutput 'GL_VERSION: ', memr 0 _1 2,~ p end.
if. 0=p do. smoutput 'cannot retrieve GL_VERSION' return. end.
if. p=. glGetString GL_VENDOR do. smoutput 'GL_VENDOR: ', memr 0 _1 2,~ p end.
if. p=. glGetString GL_RENDERER do. smoutput 'GL_RENDERER: ', memr 0 _1 2,~ p end.
if. p=. glGetString GL_SHADING_LANGUAGE_VERSION do. smoutput 'GL_SHADING_LANGUAGE_VERSION: ', memr 0 _1 2,~ p end.

wglPROC''
sprog=: 0
'err program'=. gl_makeprogram vsrc;fsrc
if. #err do. smoutput err return. end.

vertexAttr=: glGetAttribLocation program;'vertex'
assert. _1~: vertexAttr
colorAttr=: glGetAttribLocation program;'color'
assert. _1~: colorAttr
mvpUni=: glGetUniformLocation program;'mvp'
assert. _1~: mvpUni

glGenBuffers 2;vbo=: 2#_1
glBindBuffer GL_ARRAY_BUFFER; {.vbo
glBufferData GL_ARRAY_BUFFER; (#vertexData); (<symdat <'vertexData'); GL_STATIC_DRAW
glBindBuffer GL_ARRAY_BUFFER; {:vbo
glBufferData GL_ARRAY_BUFFER; (#colorData); (<symdat <'colorData'); GL_STATIC_DRAW
glBindBuffer GL_ARRAY_BUFFER; 0

sprog=: program

glClearColor 0; 0; 1; 0
)

a_g_char=: 3 : 0
if. 0=#sysdata do. return. end.
R=: 360 | R + 2 * 'xyz' = 0 { sysdata
k=. 0{sysdata
STEPS=: 200 <. STEPS + 's' = k
STEPS=: 3 >. STEPS - 'a' = k
LR=: LR + 0.01*'l'=k
LR=: LR - 0.01*'r'=k
gl_paintx''
)

a_g_paint=: 3 : 0
if. 0=sprog do. return. end.

wh=. gl_qwh''
glClearColor 0 0 0 0
glClear GL_COLOR_BUFFER_BIT + GL_DEPTH_BUFFER_BIT

glUseProgram sprog
glEnable GL_DEPTH_TEST
glEnable GL_CULL_FACE

NB. matrix convention: current matrix on the left
NB. note pre-multiplication

NB. model-view
mvp=: (gl_Rotate (0{R), 1 0 0 ) mp (gl_Rotate (1{R), 0 1 0) mp (gl_Rotate (2{R), 0 0 1) mp (gl_Scale STEPS%100) mp (gl_Translate 0 0 _8) mp glu_LookAt EYE,LR,UD,IO,UP

NB. projection
mvp=: mvp mp gl_Perspective 30, (%/wh),1 10

NB. note GL_FALSE, no transpose
glUniformMatrix4fv mvpUni; 1; GL_FALSE; mvp

glBindBuffer GL_ARRAY_BUFFER; {.vbo
glEnableVertexAttribArray vertexAttr
glVertexAttribPointer vertexAttr; 3; GL_FLOAT; 0; 0; <<0

glBindBuffer GL_ARRAY_BUFFER; {:vbo
glEnableVertexAttribArray colorAttr
glVertexAttribPointer colorAttr; 3; GL_FLOAT; 0; 0; <<0

glDrawArrays GL_TRIANGLES; 0; 36

glBindBuffer GL_ARRAY_BUFFER; 0
glDisableVertexAttribArray colorAttr
glDisableVertexAttribArray vertexAttr

glDisable GL_DEPTH_TEST
glDisable GL_CULL_FACE

glUseProgram 0

)

a_g_paintz=: 3 : 0
gl_clear ''
gl_rgb 255 255 255
gl_textcolor ''
gl_textxy 10 30
gl_text 'keys: x y z a s l r'
gl_textxy 10 50
gl_text 'scale: ',":STEPS%100
gl_textxy 10 70
gl_text 'angle: ',":R
gl_textxy 10 90
if. 0=sprog do. return. end.
gl_text 'matrix:'
for_i. i.4 do.
  gl_textxy 10, 105+i*15
  gl_text 6j2": i{mvp
end.
)

a_cancel=: a_close

a_close=: 3 : 0
glDeleteProgram ::0: sprog
wd 'pclose'
)

vertexData=: 1&fc , 0 1 2 2 1 3&{"2 ] 6 4 3$ , 0&".@(-.&',') ;._2 [ 0 : 0
_1 _1  1
 1 _1  1
_1  1  1
 1  1  1 ,
 1 _1  1
 1 _1 _1
 1  1  1
 1  1 _1 ,
 1 _1 _1
_1 _1 _1
 1  1 _1
_1  1 _1 ,
_1 _1 _1
_1 _1  1
_1  1 _1
_1  1  1 ,
_1 _1 _1
 1 _1 _1
_1 _1  1
 1 _1  1 ,
_1  1  1
 1  1  1
_1  1 _1
 1  1 _1 ,
)

NB. rgb for each vertex
colorData=: 1&fc , 0 1 1 1 1 0&{"2 ] 6 2 3$ , 0&". ;._2 [ 0 : 0
1 0 0
0 1 0
0 1 0
0 0 1
1 0 0
0 0 1
1 1 0
0 0 1
0 1 1
1 0 0
1 0 1
0 1 0
)

NB. =========================================================
vsrc=: 0 : 0
attribute highp vec3 vertex;
attribute lowp vec3 color;
varying lowp vec4 v_color;
uniform mat4 mvp;
void main(void)
{
  gl_Position = mvp * vec4(vertex,1.0);
  v_color = vec4(color,1.0);
}
)

fsrc=: 0 : 0
varying lowp vec4 v_color;
void main(void)
{
  gl_FragColor = v_color;
}
)

NB. =========================================================
a_run''
