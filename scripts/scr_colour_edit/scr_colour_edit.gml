function scr_colour_edit(argument0)
{
a = argument0

if a = 1 then { r_ed = 100; g_ed = 0; bl_ed = 0 } //RED
if a = 2  then { r_ed = 67; g_ed = 33; bl_ed = 0 } //ORANGE
if a = 3  then { r_ed = 50; g_ed = 50; bl_ed = 0 } //YELLOW
if a = 4 then { r_ed = 33; g_ed = 67; bl_ed = 0 } //LIME
if a = 5  then { r_ed = 0; g_ed = 100; bl_ed = 0 } //GREEN
if a = 6  then { r_ed = 0; g_ed = 67; bl_ed = 33 } //TEAL
if a = 7  then { r_ed = 0; g_ed = 0; bl_ed = 100 } //BLUE
if a = 8  then { r_ed = 50; g_ed = 33; bl_ed = 67 } //AZURE 
if a = 9  then { r_ed = 33; g_ed = 0; bl_ed = 67 } //INDIGO
if a = 10  then { r_ed = 50; g_ed = 0; bl_ed = 50 } //VIOLET
if a = 11  then { r_ed = 67; g_ed = 0; bl_ed = 33 } //PINK

r_ed = r_ed*global.m  //Multiply by constant
g_ed = g_ed*global.m
bl_ed = bl_ed*global.m
}