//Functions to handle gameplay on each frame, extension of switch statement in main loop

global program_stage as string = "" //Determines which function in the main loop handles current frame
global program_substage as string = "" //Sub-stage to refine functions
global temp as integer = 0 //Used to take a temporary value to remember a value in between frames
global game_stage as string = "" //Like substage counter,but for game specifically

function start_menu()
	//Button ID's for this section
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
				program_switch("settings_menu")
				
			elseif GetVirtualButtonReleased(tutorial_button)
				//Tutorial
				
			elseif GetVirtualButtonReleased(reference_button)
				//Reference page
				
			elseif GetVirtualButtonReleased(exit_button)
				program_switch("exit_app")
				
			elseif GetVirtualButtonReleased(new_button)
				game_stage = "new_game"
				program_switch("game")
				
			elseif GetVirtualButtonReleased(load_button)
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
	start_menu_button = 1
	control_toggle_button = 2
	sound_toggle_button = 3
	
	select program_substage
		case "":
			control_text as string
			sound_text as string
			if control_method = 1 then control_text = "Control Style: Drag & Drop"
			if control_method = 0 then control_text = "Control Style: Click Select"
			
			if sound_toggle = 1 then sound_text = "Sound: On"
			if sound_toggle = 0 then sound_text = "Sound: Off"
			
			create_button(start_menu_button,"Return to Main Menu",(VIR_X/2),(VIR_Y/4),1500,200,1)
			create_button(control_toggle_button,control_text,(VIR_X/2),(VIR_Y/2),1500,200,1)
			create_button(sound_toggle_button,sound_text,(VIR_X/2),(VIR_Y * 3/4),1500,200,1)
			
			program_substage = "check_select"
			endcase
			
		case "check_select":
			if GetVirtualButtonReleased(start_menu_button)
				program_switch("start_menu")
			elseif GetVirtualButtonReleased(control_toggle_button)
				control_method = not control_method
				if control_method = 1 then SetVirtualButtonText(control_toggle_button,"Control Style: Drag & Drop")
				if control_method = 0 then SetVirtualButtonText(control_toggle_button,"Control Style: Click Select")
			elseif GetVirtualButtonReleased(sound_toggle_button)
				sound_toggle = not sound_toggle
				if sound_toggle = 1 then SetVirtualButtonText(sound_toggle_button,"Sound: On")
				if sound_toggle = 0 then SetVirtualButtonText(sound_toggle_button,"Sound: Off")
			endif
		endcase		
	endselect
			
endfunction



function game()
	select game_stage
		case "load_save":
			//decode_save()
			//game_stage = "player_turn"
			endcase
		
		case "new_game":
			game_start_defaults()
			game_stage = "game_init"
			endcase
			
		case "game_init":
			draw_cards(pla) //Fill hands to capacity
			draw_cards(opp)
			
			for i = 1 to 4
				create_card_sprite(pla.hand[i])
				SetSpritePosition(pla.hand[i],50 + (187 * (i-1)),VIR_Y - 200)
				create_card_sprite(opp.hand[i])
				SetSpritePosition(opp.hand[i],50 + (187 * (i-1)),-40)
			next i
			game_stage = "pla_turn_start"
			endcase
			
		case "pla_turn_start":
			if GetPointerState() = 1
				for i = 1 to 4
					if GetSpriteHitTest(pla.hand[i],GetPointerX(),GetPointerY()) = 1
						temp = pla.hand[i]
						game_stage = "pla_card_inhand"
					endif
				next i
				if temp > 0 and temp <= 56
					game_stage = "pla_card_inhand"
				endif
			endif
			endcase
			
		case "pla_card_inhand":
			if GetPointerState()
				SetSpritePosition(temp,GetPointerX(),GetPointerY())
			else
				game_stage = "pla_turn_start"
			endif
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
