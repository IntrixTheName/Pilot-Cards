//Constants used for the game

//Universal Sprite & Image ID's
#constant BACKGROUND 100
#constant CARD_ATLAS 101
#constant BACKGROUND_IMAGE 102

//Universal Sizes (pixels)
#constant CARD_X 180
#constant CARD_Y 240
#constant VIR_X 1920 //Virtual resolution for dev purposes, adjusted to actual screen size at runtime
#constant VIR_Y 1080
#constant RES_X GetMaxDeviceWidth()
#constant RES_Y GetMaxDeviceHeight()

//Board Grid Locations
#constant BOARD_X[4] = [1194,1398,1602,1806]
#constant BOARD_Y[4] = [ 144, 408, 672, 936]
//Including Card Offset (x = BOARD_X - (CARD_X/2), y = BOARD_Y - (CARD_Y/2)
#constant BOARD_X_OFFSET[4] = [1104,1308,1612,1716]
#constant BOARD_Y_OFFSET[4] = [ 124, 288, 552, 816]
