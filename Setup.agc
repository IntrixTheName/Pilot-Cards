//Boiler plate code for initialization

// show all errors
SetErrorMode(2)

// set window properties
SetWindowTitle("Pilot Card Game")
SetWindowSize(RES_X, RES_Y, 1) //1 sets fullscreen
SetWindowAllowResize(0) // allow the user to resize the window

// set display properties
SetVirtualResolution(VIR_X, VIR_Y) // Numbers of convenience, used in program to base positions wrt these measures
SetOrientationAllowed(0, 0, 1, 1) // allow only landscape on mobile devices
SetSyncRate(30, 0) // 30fps cap
SetScissor(0,0,0,0) // use the maximum available screen space, no black borders
UseNewDefaultFonts(1) // since version 2.0.22 we can use nicer default fonts
