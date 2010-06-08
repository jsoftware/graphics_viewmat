NB. viewmat methods

NB. =========================================================
NB.*closeall v close all viewmat windows
closeall=: 3 : 0
for_loc. setvmh VMH do.
  viewmat_close__loc''
end.
)

NB. =========================================================
NB. getsize
NB.
NB. get pixel size
getsize=: 3 : 0
fms=. hforms''
if. 0=#fms
do. mbinfo 'viewmat';'No viewmat forms.' return.
end.
wd 'psel ',(<0 1) pick fms
_2 {. 0 ". wd 'qchildxywhx ',GID
)

NB. =========================================================
NB.*readmat v read viewmat as bitmap
readmat=: 3 : 0
fms=. hforms''
if. 0=#fms do.
  mbinfo 'viewmat';'No viewmat forms.' return.
end.
wd 'psel ',(<0 1) pick fms
getbmp''
)

NB. =========================================================
NB.*savemat v save viewmat to .bmp file
savemat=: 3 : 0
fl=. y
if. 0 = #fl do.
  fl=. jpath '~temp/viewmat.bmp'
end.
fms=. hforms''
if. 0=#fms
do. mbinfo 'viewmat';'No viewmat forms.' return.
end.
wd 'psel ',(<0 1) pick fms
(getbmp'') writebmp fl
)

NB. =========================================================
NB. setsize
NB.
NB. y = new pixel size
setsize=: 3 : 0
fms=. hforms''
if. 0=#fms
do. mbinfo 'viewmat';'No viewmat forms.' return.
end.
loc=. (<0 2) { fms
wd 'psel ',(<0 1) pick fms
form=. 0 ". wd 'qformx'
xywh=. 0 ". wd 'qchildxywhx ',GID
dif=. 0 0, y - _2 {. xywh
wd 'pmovex ',":form + dif
)

NB. =========================================================
NB.*viewbmp v bitmap viewer
NB.
NB. x = [parentid [;parentname]]
NB. y = filename
NB.
NB. e.g.  viewbmp jpath '~system/examples/data/j.bmp'
viewbmp=: 3 : 0
'' viewbmp y
:
dat=. readbmp y
if. 2 = 3!:0 dat do. return. end.
'rgb' viewmat dat;x
)

NB. =========================================================
NB.*viewmat v view matrix in isigraph control
NB.
NB. [hue] viewmat mat [;title]
NB.
NB. mat may be one of:
NB.    boolean         (black/white)
NB.    other numeric   (color scale from 0 upwards)
NB.    other           (converted to numeric)
NB.
NB. hue is: 3 column table of R-G-B triplets
NB.     or: list of RGB values
NB.     or: 'rgb'  - mat is an matrix of RGB values
NB.
NB. if mat is boolean, x defaults to black/white
NB. otherwise hue defaults to red - purple spectrum
NB.
NB. e.g. viewmat (?50 50$2);'Random Boolean'
viewmat=: 3 : 0
'' viewmat y
:
a=. conew 'jviewmat'
empty x vmrun__a y
)

NB. =========================================================
NB.*viewmatcc v view matrix in given child control
NB.
NB. [hue] viewmatcc mat;cc
NB.
NB. hue and mat are as for viewmat
NB.
NB. cc is the id of the isigraph control.
viewmatcc=: 3 : 0
'' viewmatcc y
:
empty x vmcc y
)
