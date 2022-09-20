//Functions to handle gameplay on each frame, extension of switch statement in main loop

global program_stage as integer = 0 //Determines which function in the main loop handles current frame
global program_substage as integer = 0 //Sub-stage to refine functions

function start_menu()
	select program_substage
		case 0:
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
		
		case 1:
			if GetVirtualButtonPressed(1)
				//To be done
			elseif GetVirtualButtonPressed(2)
				//To be done
			elseif GetVirtualButtonPressed(3)
				program_substage = 2 //Send main loop to settings menu
			endif
		endcase
		
		case 2:
			for i = 1 to 3 //Delete buttons from this stage
				DeleteVirtualButton(i)
			next i
			program_stage = 1
			program_substage = 0
		endcase
	
	endselect
endfunction



function settings_menu()
	//TBD
endfunction



function game()
	select program_substage
		case 0
