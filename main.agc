
// Project: Pilot Cards 
// Created: 2022-09-13
//Refer to READ_ME.txt for further instructions/informaton

//Initializations & Constants (I'm leaning heavier towards constants bc active dev & many changes)
type Player //Used for keeping track of cards in deck, hand, and trash pile of players
	health as integer
	deck   as integer []
	hand   as integer []
	trash  as integer []
endtype
player as Player //Player object, black cards
opponent as Player //Opponent object, red cards

#include "KeyScanCodes.agc"
#include "PilotConstants.agc"
#insert "Setup.agc"
#include "FrameFunctions.agc"

global os as string //Detect OS on device when running, for debugging purposes
os = GetDeviceBaseName()

LoadImage(BACKGROUND_IMAGE,"card_table.png")
CreateSprite(BACKGROUND, BACKGROUND_IMAGE)
SetSpriteSize(BACKGROUND, VIR_X, VIR_Y)
LoadImage(CARD_ATLAS,"card_atlas.png") //Using atlas so I only have to import 1 pic for all cards

player.deck   = [ 1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12,13,   27,28,29,30,31,32,33,34,35,36,37,38,39]
opponent.deck = [14,15,16,17,18,19,20,21,22,23,24,25,26,   40,41,42,43,44,45,46,47,48,49,50,51,52]

board as integer [16] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]



//Main------------------------------------------------------------------------------------------------------------------

pointer_toggle = 0 //Acts as boolean

do
    //Handle events
    if GetRawKeyState(KEY_ESCAPE) then exit
    if GetPointerPressed()
		pointer_toggle = !pointer_toggle
	endif
    
    //Determines action of current frame
    select program_stage
		case 0:
			start_menu()
			endcase
		case 1:
			settings_menu()
			endcase
		case 2:
			game()
			endcase
	endselect
    
    print_info()
    Sync() //Update screen
loop



//Functions-------------------------------------------------------------------------------------------------------------

function print_info()
	Print( ScreenFPS() ) //Shows FPS on-screen
    Print("Program stage: " + str(program_stage) + ", Program Substage: " + str(program_substage))
    Print(os)
endfunction

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

function to_base_32(input as integer)
	output as string
	select input
		case 1:
			output = "1"
			endcase
		case 2:
			output = "2"
			endcase
		case 3:
			output = "3"
			endcase
		case 4:
			output = "4"
			endcase
		case 5:
			output = "5"
			endcase
		case 6:
			output = "6"
			endcase
		case 7:
			output = "7"
			endcase
		case 8:
			output = "8"
			endcase
		case 9:
			output = "9"
			endcase
		case 10:
			output = "A"
			endcase
		case 11:
			output = "B"
			endcase
		case 12:
			output = "C"
			endcase
		case 13:
			output = "D"
			endcase
		case 14:
			output = "E"
			endcase
		case 15:
			output = "F"
			endcase
		case 16:
			output = "G"
			endcase
		case 17:
			output = "H"
			endcase
		case 18:
			output = "I"
			endcase
		case 19:
			output = "J"
			endcase
		case 20:
			output = "K"
			endcase
		case 21:
			output = "L"
			endcase
		case 22:
			output = "M"
			endcase
		case 23:
			output = "N"
			endcase
		case 24:
			output = "O"
			endcase
		case 25:
			output = "P"
			endcase
		case 26:
			output = "Q"
			endcase
		case 27:
			output = "R"
			endcase
		case 28:
			output = "S"
			endcase
		case 29:
			output = "T"
			endcase
		case 30:
			output = "U"
			endcase
		case 31:
			output = "V"
			endcase
	endselect
endfunction output

function to_base_10(input as string)
	output as integer
	
endfunction output
