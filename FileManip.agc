//Dealing with saving & loading files for game state

//Encode & decode data
function encode_save()
	//Takes current game state and encodes it to the save format
	savedata as string = ""
	//Finds each card id 1-52 and stores it's state as a character w/ pipe as delimiter
	for i = 1 to 52
		if board.find(i) > -1
			savedata = savedata + to_base32(board.find(i))
		elseif pla.deck.find(i) > -1
			savedata = savedata + to_base32(17) + "|"
		elseif pla.hand.find(i) > -1
			savedata = savedata + to_base32(18) + "|"
		elseif pla.trash.find(i) > -1
			savedata = savedata + to_base32(19) + "|"
		elseif opp.deck.find(i) > -1
			savedata = savedata + to_base32(20) + "|"
		elseif opp.hand.find(i) > -1
			savedata = savedata + to_base32(21) + "|"
		elseif opp.trash.find(i) > -1
			savedata = savedata + to_base32(22) + "|"
		endif
	next i
	//Store player health at the end
	savedata = savedata + to_base32(pla.health) + "|" + to_base32(opp.health)
	//Return the string to store in file
endfunction savedata

function decode_save()
	//Tests if there is a file to retrieve data from, then sets game state to save
	if GetFileExists("last_session.sav")
		savefile = OpenToRead("last_session.sav")
		savedata as string
		savedata = ReadString(savefile)
	else
		game_start_defaults()
	endif
endfunction


//Encoders & decoders
function to_base32(base10_input as integer)
	output as string
	select base10_input
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

function to_base10(base32_input as string)
	output as integer
	select base32_input
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
