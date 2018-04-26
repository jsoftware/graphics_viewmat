NB. run.ijs

load 'graphics/viewmat'

viewmat (] +./ .*. |:) 3&#. inverse i.243
NB. savemat_jviewmat_ ''

NB. viewmat ? 25 25$2
NB. (255 0 0,0 255 0,:0 0 255) viewmat 3 | i.25 25
NB. viewrgb readbmp jpath '~addons/graphics/bmp/toucan.bmp'
NB. viewrgb readpng jpath '~addons/graphics/png/toucan.png'
NB. viewrgb 16bff* 2| !/~i.32
