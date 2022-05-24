NB. viewmat init

require 'graphics/bmp graphics/gl2 graphics/png'

coclass 'jviewmat'

coinsert 'jgl2 jni jaresu'

IFJNET=: (IFJNET"_)^:(0=4!:0<'IFJNET')0
IFPLAY=: (IFPLAY"_)^:(0=4!:0<'IFPLAY')0

NB. no gui for jhs or iOS
3 : 0''
if. 0~: 4!:0<'VIEWMATGUI' do.
  VIEWMATGUI=: (IFQT +. IFJA +. ((;:'jwin32 jjava')e.~<11!:0 ::0:'qwd')) > IFJHS +. IFIOS
end.
EMPTY
)

NB. minimum and default initial child pixel sizes
MINWH=: 200 200
DEFWH=: 360 360

VISIBLE=: 1   NB. auto display for non-GUI

3 : 0''
if. ('Android'-:UNAME) > IFJA do.
  android_getdisplaymetrics 0
  MINWH=: <. MINWH * DM_density_ja_
  if. IFQT+.IFJA+.VIEWMATGUI do.
    DEFWH=: ,~ <./ <. 2 3{ ". wd'qscreen'
  elseif. 3=4!:0<'getdisplaymetrics_ja_' do.
    DEFWH=: ,~ <./ <. 5 3{getdisplaymetrics_ja_ 0
  end.
elseif. IFIOS do.
  MINWH=: >IFIPAD{310 150;758 250
  DEFWH=: (>:IFRETINA)* MINWH
elseif. IFJA do.
  DM_density_ja_=: {. ". wd 'dm'
end.
EMPTY
)

create=: 0:

NB. JAndroid
onStart=: 3 : 0
vmwin mwh0
)

NB. =========================================================
destroy=: 3 : 0
codestroy''
)
