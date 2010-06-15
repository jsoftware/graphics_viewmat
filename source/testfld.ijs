NB. test viewmat field view

require 'trig graphics/viewmat'

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

viewmat |. lvp_jviewmat _0j7 + 2j0.125 *&.+. jjota 40 40
)

0!:100 OTS

