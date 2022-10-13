//Class object for player and opponent
type Player //Used for keeping track of cards in deck, hand, and trash pile of players
	health as integer
	deck   as integer []
	hand   as integer []
	trash  as integer []
endtype

global pla as Player //Player object, black cards
global opp as Player //Opponent object, red cards

function game_start_defaults()
	//Set standard values for starting a new game
	
	//Deck to full cards
	pla.deck   = [ 1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12,13,   27,28,29,30,31,32,33,34,35,36,37,38,39] //Black cards
	
	//Empty player hand
	while pla.hand.length > 0
		pla.hand.remove(1)
	endwhile
	
	//Empty player trash
	while pla.trash.length > 0
		pla.trash.remove(1)
	endwhile
	
	//Health to full
	pla.health = 20
	
	opp.deck   = [14,15,16,17,18,19,20,21,22,23,24,25,26,   40,41,42,43,44,45,46,47,48,49,50,51,52] //Red cards
	//Empty opponent hand
	while opp.hand.length > 0
		opp.hand.remove(1)
	endwhile
	
	//Empty opponent trash
	while opp.trash.length > 0
		opp.trash.remove(1)
	endwhile
	
	opp.health = 20

	board = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
endfunction
