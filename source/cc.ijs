NB. cc

NB. =========================================================
vmcc=: 4 : 0
ifRGB=: x -: 'rgb'
'mat gid'=. y
'DAT MAT ANG TITLE'=: x getvm mat
mat=. finite MAT
'rws cls'=. $mat
mwh=. gtkwh
if. #ANG do. mwh vf_show mat return. end.
mat=. , mwh fitvm mat
glpixels (0 0, mwh), mat
)
