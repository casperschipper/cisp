(# tab2
	(fillf 44100 -1 1))

(# tab1
	(collect
		(seq (steno "  Maarten van der Weijden zwemt in hoog tempo door de Friese wateren. Hij startte zijn Elfstedenzwemtocht vrijdagmiddag in Leeuwarden. Inmiddels heeft hij negen stempels binnen (Sneek, IJlst, Sloten, Stavoren, Hindeloopen, Workum, Bolsward, Harlingen en Franeker).  Als alles goed gaat is Maarten naar verwachting op maandagavond rond 19.00 uur, na 196 kilometer zwemmen, weer terug in Leeuwarden.  Bekijk hierboven de livestream. Onder de kaart staan de laatste video's en updates van de tocht. Hoe staat het ervoor?  Van der Weijden gaat nog steeds als een speer en ligt voor op schema. Hij heeft afgelopen nacht een paar uur geslapen en is nu al meer dan anderhalf etmaal onderweg en heeft al ruim 125 kilometer gezwommen. Hij gaat nu van Franeker naar Dokkum, het stuk dat hij de 'Hel van het Noorden' noemt. Franeker is bereikt: 128 kilometer gehad NOS 13.15 uur: dit was Franeker  Van der Weijden is Franeker inmiddels voorbij. Kijk hier terug hoe Maarten onder luid applaus van het publiek zijn negende stempel bemachtigde: Video afspelen 00:55 Maarten van der Weijden passeert Franeker en krijgt stempel 12.45: stempel nummer 9 is binnen.  En ja hoor: de negende stempel is binnen. Naast Sneek, IJlst, Sloten, Stavoren, Hindeloopen, Workum, Bolsward en Harlingen heeft Maarten nu ook in Franeker een stempel gekregen. Nog 2 stempels te  Van der Weijden ligt nog steeds voor op schema en was eerder dan gepland in Franeker. Volgens het oorspronkelijke schema zou hij daar rond 13.30 uur pas zijn.  Het is overvol in Franeker, en de stad is in feeststemming. Publiek langs de kant en op de bruggen zingen en juichen de zwemmer toe. ")) 1370))

(print tab1)

(~ writer 
	(write tab2 (ch -1 1) (count 44100)))

(schedule
	(~ writer)
	(st 0.01))

(step-gen	 	
(index tab2 (+ (count2 1204) (* (seq tab1) 100)))
(st 1))