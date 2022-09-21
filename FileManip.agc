//Creating and saving game when app is closed

function encode_save()
	//Takes current game state and encodes it to the save format
	savedata as string = ""
	//Finds each card id 1-52 and stores it's state as a character w/ pipe as delimiter
	for i = 1 to 52
		if board.find(i) > -1
			savedata = savedata + to_base_32(board.find(i))
		elseif player.deck.find(i) > -1
			savedata = savedata + to_base_32(17) + "|"
		elseif player.hand.find(i) > -1
			savedata = savedata + to_base_32(18) + "|"
		elseif player.trash.find(i) > -1
			savedata = savedata + to_base_32(19) + "|"
		elseif opponent.deck.find(i) > -1
			savedata = savedata + to_base_32(20) + "|"
		elseif opponent.hand.find(i) > -1
			savedata = savedata + to_base_32(21) + "|"
		elseif opponent.trash.find(i) > -1
			savedata = savedata + to_base_32(22) + "|"
	next i
	//Store player health at the end
	savedata = savedata + to_base_32(player.health) + "|" + to_base_32(opponent.health)
	//Return the string to store in file
endfunction savedata

function decode_save()
	//Tests if there is a file to retrieve data from
	if GetFileExists("last_session.sav")
		//Load data & process
	else
		//Return hard-coded value in lieu of savedata
	endif
endfunction
