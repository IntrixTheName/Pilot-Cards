//Functions to handle gameplay on each frame, extension of switch statement in main loop

global program_stage as string = "" //Determines which function in the main loop handles current frame
global program_substage as string = "" //Sub-stage to refine functions
global game_stage as string = "" //Keeps track on where the game is, even if another function is active

function start_menu()
	select program_substage
		case "":
			play_button = 1
			AddVirtualButton(play_button,VIR_X/4,VIR_Y/2,1000)
			SetVirtualButtonSize(play_button,450,300)
			SetVirtualButtonText(play_button,"Play New")
			
			load_button = 2
			AddVirtualButton(load_button,VIR_X/2,VIR_Y/2,1000)
			SetVirtualButtonSize(load_button,450,300)
			SetVirtualButtonText(load_button,"Play Last - TBD")
			
			settings_button = 3
			AddVirtualButton(settings_button,(VIR_X*3.0)/4,VIR_Y/2,1000)
			SetVirtualButtonSize(settings_button,450,300)
			SetVirtualButtonText(settings_button,"Settings")
			inc program_substage, 1
		endcase
		
		case "check_select":
			if GetVirtualButtonPressed(1)
				//To be done
			elseif GetVirtualButtonPressed(2)
				//To be done
			elseif GetVirtualButtonPressed(3)
				program_substage = "clean_up" //Send main loop to settings menu
			endif
		endcase
		
		case "clean_up":
			for i = 1 to 3 //Delete buttons from this stage
				DeleteVirtualButton(i)
			next i
			program_stage = 1
			program_substage = ""
		endcase
	
	endselect
endfunction



function settings_menu()
	//TBD
endfunction



function game()
	select game_stage
		case "":
			//Tries to load previous save file if it exists
			if GetFileExists("last_session.sav")
		endcase
	endselect
endfunction
