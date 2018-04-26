NB. cc

NB. =========================================================
vmcc=: 4 : 0
ifRGB=: x -: 'rgb'
'mat gid'=. y
'DAT MAT ANG TITLE'=: x getvm mat
if. 0 e. $MAT do. return. end.
mat=. finite MAT
'rws cls'=. $mat
glsel ":gid
glnodblbuf 0
mwh=. glqwh''
if. #ANG do. mwh vf_show mat return. end.
mat=. , mwh fitvm mat
glpixels (0 0, mwh), mat (27 b.) 16bffffff
)
