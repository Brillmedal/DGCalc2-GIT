function scr_grid()

{

global.margin = 30 //margin perimeter around graph (Fraction, NOT pixels)
global.startx = (room_width/global.margin) //starting x position of graph
global.starty = room_height - (1*(room_width/global.margin)) //starting y position of graph
global.menu_width = room_width/6//width of right side menu
global.bar_depth = room_height/15 //depth of top bar
global.grid_width = room_width-((global.startx*2)+global.menu_width) //width in pixels
//global.grid_height = room_height - ((global.startx*2)+global.bar_depth)//height in pixels
global.gridsx = 96 //Number of grids wide
global.gridsy = 48//Number of grids tall
global.gridsize = (global.grid_width/global.gridsx) 

global.minis_x = global.startx
global.minis_y = (global.starty - (global.gridsy*global.gridsize)) - (global.margin)
global.minig_x = 48
global.minig_y = 4
global.minigridsize = (global.grid_width/global.minig_x) 
}