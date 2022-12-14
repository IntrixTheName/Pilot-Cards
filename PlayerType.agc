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
	
	//Empty player hand
	while pla.hand.length > 0
		pla.hand.remove(1)
	endwhile
	
	//Empty player trash
	while pla.trash.length > 0
		pla.trash.remove(1)
	endwhile
	
	//Deck to full cards
	pla.deck   = [ 1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12,13,   27,28,29,30,31,32,33,34,35,36,37,38,39] //Black cards
	
	//Health to full
	pla.health = 20
	
	
	
	//Empty opponent hand
	while opp.hand.length > 0
		opp.hand.remove(1)
	endwhile
	
	//Empty opponent trash
	while opp.trash.length > 0
		opp.trash.remove(1)
	endwhile
	
	opp.deck   = [14,15,16,17,18,19,20,21,22,23,24,25,26,   40,41,42,43,44,45,46,47,48,49,50,51,52] //Red cards
	
	opp.health = 20

	board = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
endfunction

function draw_cards(person ref as Player)
	while person.hand.length < 4
		index = Random(1,person.deck.length)
		person.hand.insert(person.deck[index])
		person.deck.remove(index)
	endwhile
	if person.deck.length < 4 then shuffle(person)
endfunction

function shuffle(person ref as Player)
	while person.trash.length > 0
		index = Random(1,person.trash.length)
		person.deck.insert(person.trash[index])
		person.trash.remove(index)
	endwhile
endfunction

function trash_card(card_id as integer)
	if card_id <= 13
		pla.trash.insert(card_id)
	elseif card_id <= 26
		opp.trash.insert(card_id)
	elseif card_id <= 39
		pla.trash.insert(card_id)
	else
		opp.trash.insert(card_id)
	endif
endfunction
