
// Project: Pilot Cards 
// Created: 2022-09-13
//Refer to READ_ME.txt for further instructions/informaton

//Initializations & Constants (I'm leaning heavier towards constants bc active dev & many changes)
#include "KeyScanCodes.agc"
#insert "Setup.agc"

#constant BACKGROUND 100
#constant CARD_ATLAS 101
#constant CARD_X 180
#constant CARD_Y 240

CreateSprite(BACKGROUND, LoadImage("card_table.png"))
SetSpriteSize(BACKGROUND, RES_X, RES_Y)
LoadImage(CARD_ATLAS,"card_atlas.png") //Using atlas so I only have to import 1 pic for all cards





//Main------------------------------------------------------------------------------------------------------------------

do
    //Handles exiting application
    if GetRawKeyState(KEY_ESCAPE) then exit
    
    //Debug- adds ace of spades to screen at click location
    if GetPointerPressed() = 1
		create_card_sprite(1,"spades")
		SetSpritePosition(card_calc(1,"spades"), GetPointerX() - (CARD_X/2), GetPointerY() - (CARD_Y/2))
	endif

    //Print( ScreenFPS() ) //Shows FPS on-screen, not needed
	
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
	
