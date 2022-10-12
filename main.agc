
// Project: Pilot Cards 
// Created: 2022-09-13
//Refer to READ_ME.txt for further instructions/informaton

//Initializations & Constants (I'm leaning heavier towards constants bc active dev & many changes)
#insert "PlayerType.agc"
#include "KeyScanCodes.agc"
#include "PilotConstants.agc"
#insert "Setup.agc"
#include "FrameFunctions.agc"

global os as string 
os = GetDeviceBaseName() //Detect OS on device when running, for debugging purposes
//SetRandomSeed(GetSecondsFromUnix(GetUnixTime())) //Sets condition for random generator

LoadImage(BACKGROUND_IMAGE,"card_table.png")
CreateSprite(BACKGROUND, BACKGROUND_IMAGE)
SetSpriteSize(BACKGROUND, VIR_X + 200, VIR_Y + 100)
SetSpritePosition(BACKGROUND,-100,-50)
LoadImage(CARD_ATLAS,"card_atlas.png") //Using atlas so I only have to import 1 pic for all cards





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
	select input
		case "1":
			output = 1
			endcase
		case "2":
			output = 2
			endcase
		case "3":
			output = 3
			endcase
		case "4":
			output = 4
			endcase
		case "5":
			output = 5
			endcase
		case "6":
			output = 6
			endcase
		case "7":
			output = 7
			endcase
		case "8":
			output = 8
			endcase
		case "9":
			output = 9
			endcase
		case "A":
			output = 10
			endcase
		case "B":
			output = 11
			endcase
		case "C":
			output = 12
			endcase
		case "D":
			output = 13
			endcase
		case "E":
			output = 14
			endcase
		case "F":
			output = 15
			endcase
		case "G":
			output = 16
			endcase
		case "H":
			output = 17
			endcase
		case "I":
			output = 18
			endcase
		case "J":
			output = 19
			endcase
		case "K":
			output = 20
			endcase
		case "L":
			output = 21
			endcase
		case "M":
			output = 22
			endcase
		case "N":
			output = 23
			endcase
		case "O":
			output = 24
			endcase
		case "P":
			output = 25
			endcase
		case "Q":
			output = 26
			endcase
		case "R":
			output = 27
			endcase
		case "S":
			output = 28
			endcase
		case "T":
			output = 29
			endcase
		case "U":
			output = 30
			endcase
		case "V":
			output = 31
			endcase
	endselect
endfunction output
