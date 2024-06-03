NB. viewmat util

finite=: x: ^: _1
intersect=: e. # [
citemize=: ,: ^: (2: > #@$)
rndint=: <.@:+&0.5
tomatrix=: (_2 {. 1 1 , $) $ ,

NB. =========================================================
fitvm=: 4 : 0
'w h'=. x
mat=. y
'r c'=. $ mat
exp=. (- 0: , }:) <. 0.5 + +/\ r $ h % r
mat=. exp # mat
exp=. (- 0: , }:) <. 0.5 + +/\ c $ w % c
exp #"1 mat
)

NB. =========================================================
delinf=: 3 : 0
if. +:/ _ __ e. ,y do. y return. end.
sc=. 0.1
a=. (,y) -. _ __
max=. >./a
min=. <./a
ext=. sc * max - min
(min-ext) >. y <. max+ext
)

NB. =========================================================
NB. getbitmap v get graphics window as bitmap
getbitmap=: 3 : 0
glsel'g'
box=. 0 0,glqwh''
res=. glqpixels box
(3 2 { box) $ res
)

NB. =========================================================
NB.*gethue v generate color from color set
NB. x is color set
NB. y is values from 0 to 1, selecting color
gethue=: 4 : 0
y=. y*<:#x
b=. x {~ <.y
t=. x {~ >.y
k=. y-<.y
(t*k) + b*-.k
)

NB. =========================================================
NB. getvm
NB.
NB. form: hue getvm data [;title]
NB.
NB. hue may be empty, in which case a default is used
NB. hue may be a N by 3 matrix of colors or a vector
NB.     of RGB integers.
NB.
NB. returns:
NB.   original data
NB.   scaled data matrix
NB.   angle (if any)
NB.   title
getvm=: 4 : 0
'dat tit'=. 2 {. boxopen y
tit=. ": tit
tit=. tit, (0=#tit) # 'viewmat'
if. ifRGB do.
  mat=. dat
  ang=. ''
else.
  'mat ang'=. x getvm1 dat
end.
if. 2<#$mat do.
  sminfo 'Data rank not supported in viewmat: ',":#$mat
  mat=. ''
end.
dat ; mat ; ang ; tit
)

NB. =========================================================
getvm1=: 4 : 0
hue=. x
mat=. y
ang=. ''

NB. ---------------------------------------------------------
if. 2 > #$hue do.
  hue=. |."1 [ 256 256 256 #: ,hue
end.

NB. ---------------------------------------------------------
select. 3!:0 mat
case. 2;32 do.
  mat=. (, i. ]) mat
case. 16 do.
  ang=. * mat
  mat=. delinf | mat
case. do.
  mat=. finite mat
end.

NB. ---------------------------------------------------------
select. #$mat
case. 0 do.
  mat=. 1 1$mat
case. 1 do.
  mat=. citemize mat
case. 2 do.
case. do.
  mat;'' return.
end.

NB. ---------------------------------------------------------
if. */ (,mat) e. 0 1 do.
  if. #hue do.
    h=. <. 0 _1 { hue
  else.
    h=. 0 ,: 255 255 255
  end.
  mat=. mat { h
else.
  if. #hue do.
    h=. hue
  else.
    h=. 255 * #: 7 | 3^i.6
  end.
  val=. ,mat
  max=. >./ val
  min=. <./ val
  mat=. <. h gethue (mat - min) % max - min
end.

mat=. mat +/ .* 65536 256 1

mat ; ang

)

NB. =========================================================
hadd=: 3 : 0
setvmh VMH,~coname''
)

NB. =========================================================
NB. cascade new form
hcascade=: 3 : 0
''
)

NB. =========================================================
NB. hforms
NB.
NB. returns viewmat forms, in order of recent activity
hforms=: 3 : 0
fms=. <;._2 &> <;._2 wdqpx''
if. 0=#fms do. empty '' return. end.
fms=. fms #~ (2{"1 fms) e. VMH
if. 0=#fms do. empty '' return. end.
fms \: 0 ". &> 4{"1 fms
)

NB. =========================================================
hremove=: 3 : 0
setvmh VMH -. coname''
)

NB. =========================================================
setvmh=: 3 : 0
VMH_jviewmat_=: (~.y) intersect conl 1
)

NB. =========================================================
NB. RGB triple to RGB number
rgb1=: 256&(#. flipwritergb_jbmp_)

NB. =========================================================
NB. write bitmap without gtk
no_gui_bitmap=: 3 : 0
mat=. finite MAT
'rws cls'=. $mat
mwh=. cls,rws
if. -. ifRGB do.
  mwh=. MINWH >. <. mwh * <./ DEFWH % cls,rws
end.
mat=. mwh fitvm mat
)
