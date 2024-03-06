NB. event

NB. for use in labs...
viewmat_jctrl_fkey=: 3 : 'lab_jlab_ :: ] 0'

NB. save png
viewmat_sctrl_fkey=: 3 : 0
fl=. jpath '~temp/',TITLE,'.png'
wd 'psel viewmat'
(getbitmap'') writepng fl
)

NB. IFJA
viewmat_g_resize=: 3 : 0
if. needresize do.
  adjwh mwh0
  hcascade''
  hadd''
end.
needresize=: 0
)

NB. =========================================================
NB. paint
NB. SHOW is 0 = initial setting
NB.         1 = resize
viewmat_g_paint=: 3 : 0
try.
  mat=. finite MAT
  'rws cls'=. $mat
  gwh=. glqwh''
  if. ifRGB > SHOW do.
    glbrush glrgb 0 0 0
    glrect 0 0,gwh
    mwh=. cls,rws
  else.
    mwh=. gwh
  end.
  if. #ANG do. mwh vf_show mat return. end.
  mat=. , mwh fitvm mat
  glpixels (0 0, mwh), setalpha mat
  glpaintx^:IFJA ''  NB. asyncj
  SHOW=: 1
  EMPTY
catch.
  viewmat_close''
  echo 13!:12''
end.
)

NB. =========================================================
viewmat_close=: 3 : 0
hremove''
wd 'psel ',syshwndp,';pclose'
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
window_delete=: viewmat_cancel=: viewmat_close
