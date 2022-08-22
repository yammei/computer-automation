; Welcome to the Whirligiger source code ! Please read the READ ME.txt file before continuing !
; This code is designed to scan within the user's given constraints for a Whirligig's specific pixel color and automatically click on it.
; Contact me via may#1234 on Discord for any questions or suggestions.

global xTopLeft
global yTopLeft
global xBotRight
global yBotRight
global xCharacter
global yCharacter

gui, add, edit, r1 vxCharacter w150, Character Position X-Value
gui, add, edit, r1 vyCharacter w150, Character Position Y-Value
gui, add, edit, r1 vxTopLeft w150, Top Left X-Value
gui, add, edit, r1 vyTopLeft w150, Top Left Y-Value
gui, add, edit, r1 vxBotRight w150, Bottom Right X-Value
gui, add, edit, r1 vyBotRight w150, Bottom Right Y-Value
gui, add, button, default, Submit
gui, add, button, default w80 gStart, Start Scanning
gui, add, text, w150, Hold the \ key to stop.
gui, add, text, x300 y3 w500, Example Picture Coordinates: Character (960,470) Top Left (600,520) Bottom Right (1300,790)
gui, add, picture, x180 y20 w668 h391, C:\Users\meila\OneDrive\Documents\Whirligiger\instructions.png ; ########################## CHANGE FILE DIRECTORY
gui show, xcenter ycenter w860 h420, Whirligiger
return

ButtonSubmit: 
gui, submit
gui, add, text, x57 y174 w110, Coordinates Inputed !
gui show, xcenter ycenter w860 h420, Whirligiger

Start(){
    gui hide
    click %xCharacter% %yCharacter%
		loop{			
            where()
			if(getKeyState("\", "P") = 1){
				msgbox Script Has Been Stopped
				break
			} ; Break condition to end loop
		} ; Loop
} ; Start function

where(){
    ImageSearch, xc, yc, xTopLeft, yTopLeft, xBotRight, yBotRight, *2 C:\Users\meila\OneDrive\Documents\Whirligiger\catchWhirligig2.png ; ########################## CHANGE FILE DIRECTORY
        if(errorlevel = 0) {
            setmousedelay -1	
            click %xc% %yc%
            setmousedelay 50
            click %xCharacter% %yCharacter% 
            sleep 3000
        } ; object found
        if(errorlevel = 1) {
            return
        } ; object not found
        if(errorlevel = 2) {
            msgbox "(Error Level = 2) Please ensure the image file directory is correct."
            sleep 5000
            gui destroy
        } ; unable to process
} ; where function | scans the area and determines action based off results