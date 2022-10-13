//Functions to handle gameplay on each frame, extension of switch statement in main loop

global program_stage as string = "" //Determines which function in the main loop handles current frame
global program_substage as string = "" //Sub-stage to refine functions
global game_stage as string = "" //Like substage counter,but for game specifically

function start_menu()
	play_button = 1
	settings_button = 2
	tutorial_button = 3
	reference_button = 4
	exit_button = 5
	new_button = 6
	load_button = 7
	back_button = 8
	
	select program_substage
		case "":
			create_button(play_button,"Play",(VIR_X/3),(VIR_Y/2 - 200),450,300,1)
			create_button(settings_button,"Settings",(VIR_X/3),(VIR_Y/2 + 200),450,300,1)
			create_button(tutorial_button,"Tutorial",((VIR_X*2)/3),(VIR_Y/2 - 200),450,300,1)
			create_button(reference_button,"Reference",((VIR_X*2)/3),(VIR_Y/2 + 200),450,300,1)
			create_button(exit_button,"X",(VIR_X - 100),100,100,100,1)
			create_button(new_button,"Play New",(VIR_X/3),VIR_Y/2 - 200,450,300,0)
			create_button(load_button,"Load Saved",((VIR_X*2)/3),(VIR_Y/2 - 200),450,300,0)
			create_button(back_button,"< Back",(VIR_X/3),(VIR_Y/2 + 200),450,300,0)
			
			program_substage = "check_select"
		endcase
		
		case "check_select":
			if GetVirtualButtonReleased(play_button)
				//Play button, load secondary menu
				for i = 1 to 4 //Deactivates main buttons
					SetVirtualButtonActive(i,0)
					SetVirtualButtonVisible(i,0)
				next i
				for i = 6 to 8 //Activates secondary buttons
					SetVirtualButtonActive(i,1)
					SetVirtualButtonVisible(i,1)
				next i
				
			elseif GetVirtualButtonReleased(settings_button)
				//Settings
				program_switch("settings_menu")
				
			elseif GetVirtualButtonReleased(tutorial_button)
				//Tutorial
				
			elseif GetVirtualButtonReleased(reference_button)
				//Reference page
				
			elseif GetVirtualButtonReleased(exit_button)
				program_switch("exit_app")
				
			elseif GetVirtualButtonReleased(new_button)
				//New game
				game_stage = "new_game"
				program_switch("game")
				
			elseif GetVirtualButtonReleased(load_button)
				//Load save & switch to game
				game_stage = "load_save"
				program_switch("game")
					
			elseif GetVirtualButtonReleased(back_button)
				//From secondary menu back to main menu
				for i = 1 to 4 //Activates main buttons
					SetVirtualButtonActive(i,1)
					SetVirtualButtonVisible(i,1)
				next i
				for i = 6 to 8 //Deactivates secondary buttons
					SetVirtualButtonActive(i,0)
					SetVirtualButtonVisible(i,0)
				next i
			endif
		endcase
		
	endselect
endfunction



function ingame_menu()
	//TBD, in-game menu rather than start menu
endfunction



function settings_menu()
	select program_substage
		case "":
			CreateText(2,"Settings Menu, TBD")
			SetTextPosition(2, VIR_X/2, 200)
			SetTextSize(2,50)
			
			start_menu_button = 1
			AddVirtualButton(start_menu_button, VIR_X/2, VIR_Y/2, 1000)
			SetVirtualButtonSize(start_menu_button,800,300)
			SetVirtualButtonText(start_menu_button,"Return to Main Menu")
			
			CreateText(1,"Settings")
			SetTextPosition(1, VIR_X/2, VIR_Y/2)
			
			program_substage = "check_select"
			endcase
			
		case "check_select":
			if GetVirtualButtonReleased(1)
				program_switch("start_menu")
			endif
		endcase		
	endselect
			
endfunction



function game()
	select game_stage
		case "load_save":
			decode_save()
			game_stage = "player_turn"
			endcase
		
		case "new_game":
			game_start_defaults()
			game_stage = "game_init"
			endcase
			
		case "game_init":
			while pla.hand.length < 4
				//Choose random index, take said index from deck and add to hand, then remove from deck
				i = Random(1,pla.deck.length)
				pla.hand.insert(pla.deck[i])
				pla.deck.remove(i)
			endwhile
			
			while opp.hand.length < 4
				//Choose random index, take said index from deck and add to hand, then remove from deck
				i = Random(1,opp.deck.length)
				opp.hand.insert(opp.deck[i])
				opp.deck.remove(i)
			endwhile
			
			for i = 1 to 4
				create_card_sprite(pla.hand[i])
				SetSpritePosition(pla.hand[i],100 + (50 * i),VIR_Y - 100)
				create_card_sprite(opp.hand[i])
				SetSpritePosition(opp.hand[i],100 + (50 * i),100)
			next i
			
			endcase
	endselect
endfunction




function program_switch(next_stage as string)
	i = 1
	flag = 1
	while(flag)
		//Deletes items with id = i if they exist
		if GetVirtualButtonExists(i) //Deletes vir buttons
			DeleteVirtualButton(i)
			inc flag, 1
			endif
		if GetTextExists(i) //Deletes text
			DeleteText(i)
			inc flag, 1
			endif
		if GetSpriteExists(i)
			DeleteSprite(i)
			inc flag, 1
			endif
		if flag = 1
			flag = 0 //Exit loop
		else
			flag = 1
		endif
		
		inc i, 1
	endwhile
	
	program_stage = next_stage
	program_substage = ""
endfunction
