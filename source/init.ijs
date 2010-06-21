NB. viewmat init

require 'graphics/bmp'

coclass 'jviewmat'

IFJ7_z_=: 700 < 0 ". ({. ~i.&'/') }.9!:14''
3 : 0''
if. -.IFJ7 do.
  LF2_z_=: LF,LF [ IFWIN_z_=: IFWIN32 [ Debug_z_=: 0 [ EMPTY_z_=: i.0 0
  IFGTK_z_=: 0
end.
if. -.IFGTK do.
  'require'~'gui/gtk'
end.
''
)

coinsert 'jgtk'

NB. minimum and default initial child pixel sizes
MINWH=: 200 200
DEFWH=: 360 360

NB. =========================================================
destroy=: 3 : 0
cbfree''
codestroy''
)
