NB. build.ijs

writesourcex_jp_ '~Addons/graphics/viewmat/source/source';'~Addons/graphics/viewmat/viewmat.ijs'

f=. 3 : 0
(jpath '~addons/graphics/viewmat/',y) (fcopynew ::0:) jpath '~Addons/graphics/viewmat/',y
)

f 'viewmat.ijs'

f=. 3 : 0
(jpath '~Addons/graphics/viewmat/',y) fcopynew jpath '~Addons/graphics/viewmat/source/',y
)

f 'manifest.ijs'
f 'history.txt'
