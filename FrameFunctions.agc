//Functions to handle gameplay on each frame, extension of switch statement in main loop

global program_stage as string = "" //Determines which function in the main loop handles current frame
global program_substage as string = "" //Sub-stage to refine functions
global game_stage as string = "" //Keeps track on where the game is, even if another function is active

function start_menu()
	select program_substage
		case "":
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
				
			back_button = 8
			AddVirtualButton(back_button, VIR_X/3, VIR_Y/2 + 200, 1000)
			SetVirtualButtonSize(back_button, 450, 300)
			SetVirtualButtonText(back_button,"< Back")
			SetVirtualButtonActive(back_button,0)
			SetVirtualButtonVisible(back_button,0)
			
			program_substage = "check_select"
		endcase
		
		case "check_select":
			if GetVirtualButtonReleased(1)
				for i = 1 to 4 //Deactivates main buttons
					SetVirtualButtonActive(i,0)
					SetVirtualButtonVisible(i,0)
				next i
				for i = 6 to 8 //Activates secondary buttons
					SetVirtualButtonActive(i,1)
					SetVirtualButtonVisible(i,1)
				next i
				
			elseif GetVirtualButtonReleased(2)
				program_switch("settings_menu")
				
			elseif GetVirtualButtonReleased(3)
				//TBD, switch to tutorial
				
			elseif GetVirtualButtonReleased(4)
				//TBD, switch to reference page
				
			elseif GetVirtualButtonReleased(5)
				program_switch("exit_app")
				
			elseif GetVirtualButtonReleased(6)
				//TBD, switch to new game
				
			elseif GetVirtualButtonReleased(7)
				//TBD, load save & switch to game
					
			elseif GetVirtualButtonReleased(8)
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
			Print("Settings Menu, tbd")
			
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
	//TBD
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
