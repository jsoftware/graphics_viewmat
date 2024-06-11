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
do. sminfo 'viewmat';'No viewmat forms.' return.
end.
wd 'psel ',(<0 1) pick fms
_2 {. wdqchildxywh 'g'
)

NB. =========================================================
NB.*readmat v read viewmat as bitmap
readmat=: 3 : 0
fms=. hforms''
if. 0=#fms do.
  sminfo 'viewmat';'No viewmat forms.' return.
end.
loc=. (<0 2) { fms
setalpha no_gui_bitmap__loc ''
)

NB. =========================================================
NB.*savemat v save viewmat to .png file
savemat=: 3 : 0
fl=. y
if. 0 = #fl do.
  fl=. jpath '~temp/viewmat.png'
end.
fms=. hforms''
if. 0=#fms
do. sminfo 'viewmat';'No viewmat forms.' return.
end.
loc=. (<0 2) { fms
(setalpha no_gui_bitmap__loc '') writepng fl
)

NB. =========================================================
NB. setsize
NB.
NB. y = new pixel size
setsize=: 3 : 0
fms=. hforms''
if. 0=#fms
do. sminfo 'viewmat';'No viewmat forms.' return.
end.
loc=. (<0 2) { fms
wd 'psel ',(<0 1) pick fms
form=. wdqform''
xywh=. wdqchildxywh 'g'
dif=. 0 0, y - _2 {. xywh
wd 'pmove ',":form + dif
)

NB. =========================================================
NB.*viewbmp v bitmap viewer
NB.
NB. x = [parentid [;parentname]]
NB. y = filename
NB.
NB. e.g.  viewbmp jpath '~addons/graphics/bmp/toucan.bmp'
viewbmp=: 3 : 0
'' viewbmp y
:
dat=. readbmp y
if. 2 = 3!:0 dat do. return. end.
'rgb' viewmat dat;x
)

NB. =========================================================
NB.*viewpng v bitmap viewer
NB.
NB. x = [parentid [;parentname]]
NB. y = filename
NB.
NB. e.g.  viewpng jpath '~addons/graphics/png/toucan.png'
viewpng=: 3 : 0
'' viewpng y
:
dat=. readpng y
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
a=. '' conew 'jviewmat'
xx__a=: x [ yy__a=: y
if. IFPLAY do. x viewmat_play y return. end.
if. VIEWMATGUI do.
  empty vmrun__a ''
else.
  empty vmrun__a ''
  (setalpha no_gui_bitmap__a'') writepng jpath '~temp/',TITLE__a,'.png'
  TITLE=. TITLE__a
  destroy__a ''
  if. VISIBLE do.
    if. IFJHS do.
      r=. '~temp/',TITLE,'_',(}.jhsuqs''),'.png'
      (jpath r) frename jpath '~temp/',TITLE,'.png'
      jhspng r
    elseif. IFIOS do.
NB. somewhat unique query string - avoid cache - not quaranteed to be unique!
      uqs=. '?',((":6!:0'')rplc' ';'_';'.';'_')
      r=. '~temp/',TITLE,'_',(}.uqs),'.png'
      (iospath@jpath r) frename iospath@jpath '~temp/',TITLE,'.png'
      t=. '<img src="',(iospath@jpath r),uqs,'"></img>'
      jh t
    elseif. UNAME-:'Android' do.
      android_exec_host 'android.intent.action.VIEW';('file://',jpath '~temp/',TITLE,'.png');'image/png';0
    elseif. do.
      viewimage_j_ jpath '~temp/',TITLE,'.png'
    end.
  end.
end.
)

NB. =========================================================
jhspng=: 3 : 0
d=. fread y
w=. 256#.a.i.4{.16}.d
h=. 256#.a.i.4{.20}.d
t=. '<img width=<WIDTH>px height=<HEIGHT>px src="<FILE><UQS>" ></img>'
jhtml t hrplc_jhs_ 'WIDTH HEIGHT FILE UQS';w;h;y;jhsuqs''
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

NB. =========================================================
NB. viewmat for playground
viewmat_play=: 4 : 0
a=. '' conew 'jviewmat'
xx__a=: x [ yy__a=: y
empty vmrun__a ''
NB. (setalpha no_gui_bitmap__a'') writepng jpath '~temp/viewmat.png'
(setalpha no_gui_bitmap__a'') writepng '/viewmat.png'
destroy__a ''
d=. tobase64_base_ fread '/viewmat.png'
playhtml_j_=: '8',d
(2!:0) getJS_j_
)
