# Rainbow Road

## Functions
A game where the objective is to ensure that a car stays on a rainbow colored road. 
The road segments constantly scroll vertically, while the horizontal positions of the segments are randomized relative to the horizontal position of the segments below them. 
The car is steered left and right using buttons L and R on the Basys3 board, with btnC as the start button. 
In addition, there are accompanying LED animations on the board’s LEDs for when the game starts and is in progress. 
There is also a score counter that is displayed on the 7 segment displays, which flashes when the car falls off the road and the game is over. 

## New Modules
1. "Car" 
2. "Car Crash Check" 
3. "Road segment" 
4. State Machine
5. General VGA Display Control 
6. VGA Display pixel selector 

## Features
1. Game ends when car drives off of road
2. The width of the road segments can be changed with flip switches mid-game to change difficulty.
3. LED animations for when the game starts, is being played, and on failure (car crash). 
4. Score counter on FPGA 7-segment display
5. Ability to steer car left and right using FPGA board buttons

## Challenges
1. Learning how to use VGA output
2. Building larger modules with many smaller submodules
3. Finding the submodule causing an issue for a larger module
4. Testing the many functions together
5. Fixing out-of-sync issues with animations
6. General Xilinx issues that were fixed by a restart
