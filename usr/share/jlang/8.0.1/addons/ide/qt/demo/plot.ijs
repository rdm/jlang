
require 'plot numeric trig'

coclass 'qtdemo'

pd 'reset'
pd 'title sin(exp) vs cos(exp)'
pd 'color red,green'
pd 'ycaption This is the y axis'
pd 'key sin(exp),cos(exp)'
x=. steps _1 2 100
pd x;sin ^x
pd x;cos ^x
pd 'show'
