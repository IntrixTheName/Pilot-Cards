
// Project: Pilot Cards 
// Created: 2022-09-13
//Refer to READ_ME.txt for further instructions/informaton

//Initializations & Constants (I'm leaning heavier towards constants bc active dev & many changes)
#insert "Setup.agc"
#insert "PlayerType.agc"
#include "KeyScanCodes.agc"
#include "PilotConstants.agc"
#include "FrameFunctions.agc"
#include "FileManip.agc"

global os as string 
os = GetDeviceBaseName() //Detect OS on device when running, for debugging purposes
SetRandomSeed(GetSecondsFromUnix(GetUnixTime())) //Sets condition for random generator

LoadImage(BACKGROUND_IMAGE,"card_table.png")
CreateSprite(BACKGROUND, BACKGROUND_IMAGE)
SetSpriteSize(BACKGROUND, VIR_X + 200, VIR_Y + 100)
SetSpritePosition(BACKGROUND,-100,-50)
LoadImage(CARD_ATLAS,"card_atlas.png") //Using atlas so I only have to import 1 pic for all cards

global board as integer [16] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]





//Main------------------------------------------------------------------------------------------------------------------

do
    //Handle keys
    if GetRawKeyState(KEY_ESCAPE) then exit
    
    //Determines action of current frame
    select program_stage
		case "": //First action on app start
			program_stage = "start_menu"
			start_menu()
			endcase
		
		case "start_menu":
			start_menu()
			endcase
			
		case "ingame_menu":
			ingame_menu()
			endcase
			
		case "settings_menu":
			settings_menu()
			endcase
			
		case "reference":
			//reference()
			endcase
			
		case "game":
			game()
			endcase
			
		case "exit_app":
			exit
			endcase
			
	endselect
    
    print_info()
    Sync() //Update screen
loop



//Functions-------------------------------------------------------------------------------------------------------------

function print_info()
    Print("Stage: " + program_stage + ", Substage: " + program_substage)
    Print( str(val(str(ScreenFPS() + 0.5))) + ", " + os ) //Shows FPS on-screen, rounded
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

function draw_card(person as string)
	if person = "player"
	
	endif
endfunction

function create_card_sprite(card_id as integer)
	//Deletes current version of sprite if it exists, safeguard
	if GetSpriteExists(card_id) then DeleteSprite(card_id)
	
	//Identifies subimage from card
	ident as string
	ident = ident + str(mod((card_id + 1),13))
	
	if card_id <= 13
		ident = ident + "spades"
	elseif card_id <= 26
		ident = ident + "hearts"
	elseif card_id <= 39
		ident = ident + "clubs"
	else
		ident = ident + "diamonds"
	endif
	
	//Create sprite with information
	CreateSprite(card_id, LoadSubImage(CARD_ATLAS, ident))
endfunction

