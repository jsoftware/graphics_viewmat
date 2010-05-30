NB. viewmat init

require 'bmp'

coclass 'jviewmat'
coinsert 'jgtk'

NB. minimum and default initial child pixel sizes
MINWH=: 200 200 
DEFWH=: 360 360

NB. =========================================================
destroy=: 3 : 0
cbfree''
codestroy''
)
