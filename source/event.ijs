NB. event

NB. =========================================================
NB. paint
NB. SHOW is 0 = initial setting
NB.         1 = resize
paint=: 3 : 0
mat=. finite MAT
'rws cls'=. $mat
gwh=. gtkwh
if. ifRGB > SHOW do.
  glbrush glrgb 0 0 0
  glrect 0 0,gwh
  mwh=. cls,rws
else.
  mwh=. gwh
end.
if. #ANG do. mwh vf_show mat return. end.
mat=. , mwh fitvm mat
glpixels (0 0, mwh), mat
SHOW=: 1
)

NB. =========================================================
viewmat_close=: 3 : 0
hremove''
gtk_widget_destroy window
destroy''
1
)

NB. =========================================================
viewmat_focus_in=: hadd

NB. =========================================================
viewmat_key_press=: 3 : 0
if. isesckey y do. viewmat_close'' else. 0 end.
)

NB. =========================================================
window_delete=: viewmat_close
