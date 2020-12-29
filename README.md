a. Project Name: FPGA Pseudo Terminal 

b. Team Members: Jon Ngo, Sophia Delia, Ian Chadwick, Jack Locke - Team Name: Full Points Grade Association (FPGA)

c. Link to your Project Demo Video: 
https://drive.google.com/drive/u/1/folders/1Z5vSULijlYG23RdGWeG2i28b-j7xyidU
https://drive.google.com/drive/u/1/folders/0ALV-2H-bFHoDUk9PVA

d. Overview of the Project:The FPGA Pseudo Terminal is intended to replicate every day computer actions. A PuTTY terminal is used to display input, while keyboard commands are interpreted by the FPGA to manipulate RGB LEDs, do calculations via an ALU, trigger a stopwatch, and start a reaction test mini-game. 

e. How to run your project: Generate a bitstream from the Pseudo_Terminal module, and push to the VGA!

f. Overview of the code structure (what code does what): 

Pseudo_Terminal: Top module to instantiate concatenator, text IO, and logic module.

Concatenator: Converts five 8-bit signals to one 40-bit signal.

Text IO: Keyboard and UART modules, handles keyboard input to UART transmission.

Logic: Contains decoder, ascii ALU, and seven segment display.

Decoder: Takes in UART commands, translates that to inputs for the ALU.

ALU: VGA and RGB light outputs, passes 40 bits to 7-segment display. Also handles mathematical calculations.

8-bit Top: Contains an 8-bit ALU to complete addition, subtraction, multiplication, and division. Also converts to a 40 bit signal that can be interpreted by the 7-segment display.

Greetings Top: Takes in a greetings input, outputs blinking "Arggg" on the 7-segment display.

Stopwatch: Counts in hundredths of a second up to an hour. Outputs 40 bits. 

RGB Show: State machine that controls the RGB LEDs on the FPGA.

Reaction Game: Controls the "fight" mini-game where a player must save their friend from becoming a scurvy pirate! Outputs 40 bits for the 7-segment display, and VGA signals for onscreen graphics. 

Graphics: Displays graphics for the "fight" mini-game, including a smile, a pirate, and multi-colored squares to denote victory. Also can display a red, green, and blue screen.

Display Signals: "Sets the stage" for the VGA display. Establishes X and Y positions, as well as horizontal sync, vertical sync, and the "valid" boolean value, which denotes where graphics can be displayed. 

Seven Segment Display: Takes in 40 bits, outputs mathematical values from the ALU as well as a short message when triggered. 

g. Anything else you feel is relevant: 

Commands:

Commands are each 5 characters long, and manipulate different aspects of the terminal.

Underscores are used to denote the space character in commands.

To display "Arggg"

how_ _

hey_ _

sup_ _

pirat

what_

arggg

i_nee

To trigger the RGB LEDs:

lazer

To trigger the mini-game:

fight

To stop the mini-game:

stop_

To start the stopwatch:

start

To reset the stopwatch or the mini-game:

reset

Mathematical Commands:

To add:

##+##, where hashes represent numbers. Leading zeroes for one digit numbers, "+" must be from the extended keyboard (right numerical keypad)

To subtract:

##-##, where hashes represent numbers. Leading zeroes for one digit numbers.

To divide:

##/##, where hashes represent numbers. Leading zeroes for one digit numbers, "/" must be from main keyboard (next to the right shift key)

To multiply:

##x## or ##ASTERISK##, where hashes represent numbers. Leading zeroes for one digit numbers, "ASTERISK" must be from the extended keyboard (right numerical keypad)


