NB. viewmat win

NB. =========================================================
vmrun=: 4 : 0
if. 0 > nc <'VMH' do. setvmh '' end.
SHOW=: 0 NB. set to 1 after first show
ifRGB=: x -: 'rgb'
'DAT MAT ANG TITLE'=: x getvm y
mat=. finite MAT
'rws cls'=. $mat
mwh=. cls,rws
if. -. ifRGB do.
  mwh=. MINWH >. <. mwh * <./ DEFWH % cls,rws
end.
vmwin mwh
hcascade''
hadd''
)

NB. =========================================================
vmwin=: 3 : 0
newwindow TITLE
gtk_window_set_position window,GTK_WIN_POS_CENTER_ALWAYS
consig3 window;'key-press-event';'viewmat_key_press'
consig3 window;'focus-in-event';'viewmat_focus_in'
locGB=: y conew 'jgtkgraph'
coinsert__locGB coname''
gtk_container_add window,gtkbox__locGB
windowfinish''
)
