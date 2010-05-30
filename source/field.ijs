NB. field

NB. =========================================================
NB. fit view field
NB.
NB. the fit linearly interpolates across both dimensions.
NB.
NB. this is crude and can result in border lines being
NB. shown in the final image
NB.
NB. also probably better to interpolate color indices, rather
NB. than colors, to reduce time taken in the float to integer
NB. conversion of the RGB color array

fitvf=: 4 : 0

hw=. |. x

'h w'=. hw

mat=. y
'r c'=. s=. $ mat

mat=. ({."1 mat),.mat,.{:"1 mat
mat=. ({.mat),mat,{:mat

mat=. 256 256 256 #: mat

'r2 c2'=. s + 2
'h2 w2'=. <. hw * (r2,c2) % r,c

x=. (c2-1) * (i.w2+1) % w2
k=. x - <. x
b=. (<.x) {"2 mat
t=. (>.x) {"2 mat
mat=. (t *"2 k) + b *"2 -.k

x=. (r2-1) * (i.h2+1) % h2
k=. x - <. x
b=. (<.x) { mat
t=. (>.x) { mat
mat=. (t * k) + b * -.k

NB. most time is taken by the conversion to integer
NB. this has to be done prior to the 256 #.
mat=. 256 #. >. mat

'xr xc'=. <. -: ($mat) - hw
hw {. xc }."1 xr }. mat
)

NB. =========================================================
NB. vf_show
NB.
NB. show matrix as field
NB.
NB. y is 0 = initial setting
NB.       1 = resize
vf_show=: 4 : 0

mwh=. x
mat=. y
'rws cls'=. $mat
mat=. , mwh fitvf mat

glrgb 0 0 0
glpen 1 0
glbrush''

glpixels (0 0, mwh), mat

NB. len is the number of pixels in the shortest direction
len=. <. <./ 'scls srws'=. mwh % cls,rws

NB. midpoints:
x=. (-:scls) + scls * i. cls
y=. (-:srws) + srws * i. rws
mid=. x j."1 0 y

if. len < 3 do.
elseif. len e. 3 4 do.
  pixel=. _1 + i.len
  glpixel _2 [\ , rndint +."1 mid + + ANG */ pixel
elseif. len < 20 do.
  ext=. -: len * 0.75
  lines=. ext ,. (-ext), ext - ext * 0.7 * 1j0.8
  gllines _4 [\ , rndint +."1 mid + + ANG */ lines
elseif. do.
  ext=. -: len * 0.75
  lines=. ext , -ext
  gllines _4 [\ , rndint +."1 mid + + ANG */ lines
  poly=. ext - 0,(10 <. len*0.2) * 1j0.6,0.6,1j_0.6
  glpolygon _8 [\ , rndint +."1 mid + + ANG */ poly
end.

)
