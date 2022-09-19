
// Project: Pilot Cards 
// Created: 2022-09-13
//Refer to READ_ME.txt for further instructions/informaton

//Initializations & Constants (I'm leaning heavier towards constants bc active dev & many changes)
#include "KeyScanCodes.agc"
#include "PilotConstants.agc"
#insert "Setup.agc"
#include "FrameFunctions.agc"

os as string //Detect OS on device when running, for debugging purposes
os = GetDeviceBaseName()

CreateSprite(BACKGROUND, LoadImage("card_table.png"))
SetSpriteSize(BACKGROUND, VIR_X, VIR_Y)
LoadImage(CARD_ATLAS,"card_atlas.png") //Using atlas so I only have to import 1 pic for all cards

type Player //Used for keeping track of cards in deck, hand, and trash pile of players
	deck as integer []
	hand as integer []
	trash as integer []
endtype

pla as Player //Player object, black cards
pla.deck = [ 1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12,13,   27,28,29,30,31,32,33,34,35,36,37,38,39]
opp as Player //Opponent object, red cards
opp.deck = [14,15,16,17,18,19,20,21,22,23,24,25,26,   40,41,42,43,44,45,46,47,48,49,50,51,52]

board as integer [16] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]



//Main------------------------------------------------------------------------------------------------------------------

program_stage as integer = 0 //Determines which function in the main loop handles current frame
pointer_toggle = 0 //Acts as boolean

do
    //Handle events
    if GetRawKeyState(KEY_ESCAPE) then exit
    if GetPointerPressed()
		pointer_toggle = !pointer_toggle
	endif
    
    //Determines action of current frame
    remstart select program_stage
		case 0:
			start_menu()
			endcase
		case 1:
			begin_turn()
			endcase
		case 2:
			player_turn()
			endcase
		case 3:
			card_in_hand()
			endcase
		case 4:
			opponent_turn()
			endcase
		case 5:
			end_game()
			endcase
	endselect remend
    
    //Debug- adds ace of spades to screen at click location
    if not pointer_toggle = 0
		create_card_sprite(1,"spades")
		SetSpritePosition(card_calc(1,"spades"), GetPointerX() - (CARD_X/2), GetPointerY() - (CARD_Y/2))
	endif

    Print( ScreenFPS() ) //Shows FPS on-screen
    Print(os)
	
    Sync() //Update screen
loop



//Functions-------------------------------------------------------------------------------------------------------------

function card_calc(value as integer, suit as string)
	//Initialize to 0
	id_value = 0
	
	//Add for column
	id_value = id_value + value
	
	//Offset for row
	if suit = "spades"
		id_value = id_value + 0
	elseif suit = "hearts"
		id_value = id_value + 13
	elseif suit = "clubs"
		id_value = id_value + 26
	else //suit = diamonds
		id_value = id_value + 39
	endif
	
	//Return id_value
endfunction id_value

function create_card_sprite(value as integer, suit as string)
	//Determine ID value for sprite
	sprite_id = card_calc(value, suit)
	
	//Deletes current version of sprite, if it exists
	if GetSpriteExists(sprite_id) then DeleteSprite(sprite_id)
	
	//Create subimage based on acquired info
	ident as string
	ident = str(value) + suit
	
	//Create sprite
	CreateSprite(sprite_id, LoadSubImage(CARD_ATLAS, ident))
endfunction
	
