NB. viewmat win

NB. =========================================================
vmrun=: 3 : 0
x=. xx [ y=. yy
if. 0 > nc <'VMH' do. setvmh '' end.
SHOW=: 0 NB. set to 1 after first show
ifRGB=: x -: 'rgb'
'DAT MAT ANG TITLE'=: x getvm y
if. 0 e. $MAT do. return. end.
mat=. finite MAT
'rws cls'=. $mat
mwh=. cls,rws
if. -. ifRGB do.
  mwh=. MINWH >. <. mwh * <./ DEFWH % cls,rws
end.
mwh0=: mwh
if. IFJA do.
  needresize=: 1
  wd 'activity ',(>coname'')
else.
  vmwin^:VIEWMATGUI mwh
  hcascade''
  hadd''
end.
)

NB. =========================================================
vmwin=: 3 : 0
if. IFQT do.
  wd 'pc viewmat;pn *',TITLE
  wd 'minwh ', ":mwh0
  wd 'cc g isigraph flush'
  wd 'pshow'
elseif. IFJA do.
  wd 'pc viewmat;pn *',TITLE
  wd 'wh _1 _1;cc g isigraph flush'
  wd 'pshow'
elseif. do.
  wd 'pc6j viewmat;pn *',TITLE
  wd 'xywh ', ":0 0, <.@(*&0.5) mwh0
  wd 'cc g isigraph'
  wd 'pshow'
end.
EMPTY
)

NB. =========================================================
adjwh=: 3 : 0
wh0=. y
'w h'=. 2}. ". wd 'qform'
if. (%/wh0) < w%h do.
NB. fit to h
  h1=. h [ w1=. h * (%/wh0)
else.
  w1=. w [ h1=. w % (%/wh0)
end.
if. IFQT do.
  wd 'set g wh ',":w1,h1
elseif. IFJA do.
  wd 'set g wh ',": <. (w1,h1) % DM_density_ja_
elseif. do.
  wd 'setxywhx g ',":0 0,w1,h1
end.
EMPTY
)

NB. =========================================================
isigraph_event=: 4 : 0
evt=. >@{.y
syshandler=. 'viewmat_handler'
sysevent=. 'viewmat_g_', evt
sysdefault=. 'viewmat_default'
wdd=. ;: 'syshandler sysevent sysdefault'
wdqdata=. (wdd ,. ".&.>wdd)
evthandler wdqdata
0
)

