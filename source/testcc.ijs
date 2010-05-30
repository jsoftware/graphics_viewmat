NB. testcc
NB.
NB. test viewmat included on a form
NB.
NB. not yet updated for j7

NB. cocurrent 'base'
NB.
NB. dbg 1
NB. dbstop''
NB.
NB. require 'viewmat'
NB.
NB. NB. =========================================================
NB. test_gg_paint=: 3 : 0
NB. hue viewmatcc__a dat;'gg'
NB. )
NB.
NB. NB. =========================================================
NB. wdpclose 'test'
NB. wd 'pc test closeok;'
NB. wd 'xywh 50 50 100 100'
NB. wd 'cc gg isigraph rightmove bottommove'
NB. wd 'pas 20 20'
NB. hue=: 255 0 0,0 255 0,:0 0 255
NB. dat=: 3 | i.25 25
NB. a=: conew 'jviewmat'
NB. test_gg_paint''
NB. wd 'pshow'
NB.
NB.
