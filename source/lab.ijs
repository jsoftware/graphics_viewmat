NB. lab
NB.
NB. these are the lab demos

require 'bmp png trig viewmat'

viewmat ?20 20$2
viewmat */~ i:3
(255 0 0,:0 128 0) viewmat ?20 20$2

load 'color16'
(". COLOR16) viewmat i. 16
(". COLOR16) viewmat (i. 4 4);'Primary Colors'
[z=: |. j.~/~ i:2j16
viewmat z
viewmat (^. z);'Log z'
viewmat (%z);'Reciprocal z'
viewmat (sin z);'Sine z'
NB. closeall_jviewmat_ ''

viewrgb readbmp jpath '~addons/graphics/bmp/toucan.bmp'

NB. The following definitions will be used to display Hilbert's Peano (space-filling) curve. This has a fine pattern that can be distorted by scaling.
WB=: 255,:0 0 255        NB. white/blue color triples
WR=: 256 #. 255,:255 0 0 NB. white/red color RGB integers
HP=: 0, 0 1 0 ,: 0       NB. initial curve
hp=: 3 : '(|.,]) 1 (0 _2 _2 ,&.> _2 _1 0 + #y) } (,.|:) y'

NB. Compare the normal (scaled) blue version with the unscaled red version:
WB viewmat hp ^:7 HP
viewrgb WR {~ hp ^:7 HP

NB. The scale definition below will scale up a bitmap accurately.
NB. This time the small version is unscaled, and the larger version
NB. is accurately scaled.
scale=: [ # #"1         NB. scale table y by integer x
MG=: 256 #. 128 0 128,:0 192 0
viewrgb MG {~ hp ^:6 HP
viewrgb 2 scale MG {~ hp ^:6 HP

viewbmp jpath '~addons/graphics/bmp/jbox.bmp'
