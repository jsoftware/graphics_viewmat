NB. Run in Edit window.
load 'trig viewmat png'

count_unique=: #@~.@,

NB. =========================================================
NB. Basic test suite
BTS=: 3 : 0
closeall_jviewmat_ ''
assert. EMPTY -: hforms_jviewmat_ ''
viewmat (i. 2 2) ; 'A'
viewmat (i. 3 3) ; 'B'
setsize_jviewmat_ 500 500
assert. 500 500 -: getsize_jviewmat_ ''
assert. 9 -: count_unique readmat_jviewmat_ ''
assert. 2 -: # hforms_jviewmat_ ''
closeall_jviewmat_ ''
assert. EMPTY -: hforms_jviewmat_ ''
viewmat i. 4 4
savemat_jviewmat_ ''
mat=: readpng jpath '~temp/viewmat.png'
assert. mat -: readmat_jviewmat_ ''
closeall_jviewmat_ ''
assert. EMPTY -: hforms_jviewmat_ ''
)

NB.*jjota v complex i.
NB.   jjota 3 4
jjota_z_=: |:@:(j./&i./)@|.     NB. complex i.

NB.*jiota v complex i:
NB.   jiota 3 4
jiota_z_=: |:@:(j./&i:/)@|.     NB. complex i:

NB. =========================================================
NB. Oleg's test suite
OTS=: 0 : 0
viewmat |. jiota 12 12
viewmat |. %jiota 12 12
viewmat |. sin (jiota 15 15)%15
viewmat |. sin 1:^:(_&=@|)"0% (jiota 15 15)%5
viewmat |. %sin (jiota 20 20)%20

viewmat |. cos (jiota 15 15)%15
viewmat |. cos 1:^:(_&=@|)"0% (jiota 15 15)%5
viewmat |. %cos (jiota 20 20)%20

viewmat |. *: (jiota 20 20)%10
viewmat |. *: %(jiota 20 20)%10
viewmat |. %: (jiota 20 20)%10
viewmat |. (jiota 20 20)%10
viewmat |. ^(jiota 20 20)%10
viewmat |. ^.(jiota 20 20)%10

jjota 3 4
viewmat |. jjota 3 4
jiota 2 2
viewmat |. jiota 20 20
)

BTS ''
0!:100 OTS
