function scr_colour(argument0)
{
if colour = 1 then { red = 100; green = 0; blue = 0 } //RED
if colour = 2 then { red = 67; green = 33; blue = 0 } //ORANGE
if colour = 3 then { red = 50; green = 50; blue = 0 } //YELLOW
if colour = 4 then { red = 33; green = 67; blue = 0 } //LIME
if colour = 5 then { red = 0; green = 100; blue = 0 } //GREEN
if colour = 6 then { red = 0; green = 67; blue = 33 } //TEAL
if colour = 7 then { red = 0; green = 0; blue = 100 } //BLUE
if colour = 8 then { red = 50; green = 33; blue = 67 } //AZURE 
if colour = 9 then { red = 33; green = 0; blue = 67 } //INDIGO
if colour = 10 then { red = 50; green = 0; blue = 50 } //VIOLET
if colour = 11 then { red = 67; green = 0; blue = 33 } //PINK

red = red*global.m  //Multiply by constant
green = green*global.m
blue = blue*global.m
}