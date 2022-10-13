//Functions to handle gameplay on each frame, extension of switch statement in main loop

global program_stage as string = "" //Determines which function in the main loop handles current frame
global program_substage as string = "" //Sub-stage to refine functions
global game_stage as string = "" //Like substage counter,but for game specifically

function start_menu()
	select program_substage
		case "":
			info_int as integer [8,6]
			info_int [1] = [1,2,3,4,5,6,7,8] //Button id's
			info_int [2] = [(VIR_X/3),(VIR_X/3),((VIR_X*2)/3),((VIR_X*2)/3),(VIR_X - 100),(VIR_X/3),((VIR_X*2)/3),(VIR_X/3)] //X positions
			info_int [3] = [VIR_Y/2 - 200,VIR_Y/2 + 200,VIR_Y/2 - 200,VIR_Y/2 + 200,100,VIR_Y/2 - 200,VIR_Y/2 - 200,VIR_Y/2 + 200] //Y positions
			info_int [4] = [450,450,450,450,100,450,450,450] //Size X
			info_int [5] = [300,300,300,300,100,300,300,300] //Size y
			info_int [6] = [1,1,1,1,1,0,0,0] //Active or visible from start
			
			info_str [8] = ["Play","Settings","Tutorial Game","Reference","X","Play New","Load Saved","< Back"] //Text
			
			for i = 1 to 8
				AddVirtualButton(info_int[i,1],info_int[i,2],info_int[i,3],1000)
				SetVirtualButtonSize(info[i,1],info[i,4],info[i,5])
				SetVirtualButtonText(info[i,1],info_str[i])
				SetVirtualButtonActive(info[i,1],info[i,6])
				SetVirtualButtonVisible(info[i,1],info[i,6])
			next i
			
			remstart
			play_button = 1
			AddVirtualButton(play_button, VIR_X/3, VIR_Y/2 - 200, 1000)
			SetVirtualButtonSize(play_button,450,300)
			SetVirtualButtonText(play_button,"Play")
			
			settings_button = 2
			AddVirtualButton(settings_button, VIR_X/3, VIR_Y/2 + 200, 1000)
			SetVirtualButtonSize(settings_button,450,300)
			SetVirtualButtonText(settings_button,"Settings")
			
			tutorial_button = 3
			AddVirtualButton(tutorial_button,(VIR_X*2)/3, VIR_Y/2 - 200, 1000)
			SetVirtualButtonSize(tutorial_button,450,300)
			SetVirtualButtonText(tutorial_button,"Tutorial Game")
			
			reference_button = 4
			AddVirtualButton(reference_button,(VIR_X*2)/3, VIR_Y/2 + 200, 1000)
			SetVirtualButtonSize(reference_button,450,300)
			SetVirtualButtonText(reference_button,"Reference")
			
			exit_button = 5
			AddVirtualButton(exit_button, VIR_X - 100, 100, 1000)
			SetVirtualButtonSize(exit_button,100,100)
			SetVirtualButtonColor(exit_button,255,100,100)
			SetVirtualButtonText(exit_button,"X")
			
			new_button = 6
			AddVirtualButton(new_button, VIR_X/3, VIR_Y/2 - 200, 1000)
			SetVirtualButtonSize(new_button, 450, 300)
			SetVirtualButtonText(new_button,"Play New")
			SetVirtualButtonActive(new_button,0)
			SetVirtualButtonVisible(new_button,0)
				
			load_button = 7
			AddVirtualButton(load_button,(VIR_X*2)/3, VIR_Y/2 - 200, 1000)
			SetVirtualButtonSize(load_button, 450, 300)
			SetVirtualButtonText(load_button,"Load Saved")
			SetVirtualButtonActive(load_button,0)
			SetVirtualButtonVisible(load_button,0)
			SetVirtualButtonAlpha(load_button,50)
				
			back_button = 8
			AddVirtualButton(back_button, VIR_X/3, VIR_Y/2 + 200, 1000)
			SetVirtualButtonSize(back_button, 450, 300)
			SetVirtualButtonText(back_button,"< Back")
			SetVirtualButtonActive(back_button,0)
			SetVirtualButtonVisible(back_button,0)
			remend
			
			program_substage = "check_select"
		endcase
		
		case "check_select":
			if GetVirtualButtonReleased(1)
				//Play button, load secondary menu
				for i = 1 to 4 //Deactivates main buttons
					SetVirtualButtonActive(i,0)
					SetVirtualButtonVisible(i,0)
				next i
				for i = 6 to 8 //Activates secondary buttons
					SetVirtualButtonActive(i,1)
					SetVirtualButtonVisible(i,1)
				next i
				
			elseif GetVirtualButtonReleased(2)
				//Settings
				program_switch("settings_menu")
				
			elseif GetVirtualButtonReleased(3)
				//Tutorial
				
			elseif GetVirtualButtonReleased(4)
				//Reference page
				
			elseif GetVirtualButtonReleased(5)
				program_switch("exit_app")
				
			elseif GetVirtualButtonReleased(6)
				//New game
				game_stage = "new_game"
				program_switch("game")
				
			elseif GetVirtualButtonReleased(7)
				//Load save & switch to game
				game_stage = "load_save"
				program_switch("game")
					
			elseif GetVirtualButtonReleased(8)
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
