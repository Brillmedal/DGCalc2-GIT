var xx = global.startx //starting position of graph
var yy = global.starty 
var mx = global.minis_x
var my = global.minis_y


//DRAW GRAPH AXIS

//var xx = global.startx //starting position of graph
//var yy = global.starty 
var gsx = global.gridsx //How many grids wide
var gsy = global.gridsy //How many grids high
var mgx = gridsx_store/2 //How many min grids wide
var mgy = global.minig_y //How many min grids high
global.minigridsize = (global.grid_width/mgx) 
mgs = global.minigridsize
 //minigrid size y adjusted
if global.hr24 = 0 then mgsy = global.minigridsize/2 else mgsy = global.minigridsize

draw_set_color(c_black)
draw_line_width(xx+3,yy,xx+(gsx*gs),yy,7) //Draw horizontal line
draw_line_width(xx,yy+4,xx,yy-(gsy*gs)-4,7) //Draw vertical line
draw_set_color(c_grey)
draw_set_alpha(0.4)
draw_line_width(xx+3,yy,xx+(gsx*gs),yy,7) //Draw horizontal line
draw_line_width(xx,yy+4,xx,yy-(gsy*gs)-4,7) //Draw vertical line

//MINI GRID AXIS

draw_set_alpha(1)
draw_set_color(c_black)
draw_line_width(mx+3,my,mx+(mgx*mgs),my,7) //Draw horizontal line
draw_line_width(mx,my+3,mx,my-(mgy*mgsy),7) //Draw vertical line
draw_set_alpha(0.4)
draw_set_color(c_grey)
draw_line_width(mx+3,my,mx+(mgx*mgs),my,7) //Draw horizontal line
draw_line_width(mx,my+3,mx,my-(mgy*mgsy),7) //Draw vertical line
draw_set_alpha(1)

if global.edit = 1 then

{
	
//grid
draw_set_color(c_black)
draw_line_width(xx+3,yy-(gsy*gs),xx+(gsx*gs)-4,yy-(gsy*gs),7) //Draw horizontal line	
draw_line_width(xx+(gsx*gs),yy+4,xx+(gsx*gs),yy-(gsy*gs)-4,7) //Draw vertical line
draw_set_color(c_grey)
draw_set_alpha(0.4)
draw_line_width(xx+3,yy-(gsy*gs),xx+(gsx*gs)-4,yy-(gsy*gs),7) //Draw horizontal line	
draw_line_width(xx+(gsx*gs),yy+4,xx+(gsx*gs),yy-(gsy*gs)-4,7) //Draw vertical line

//mini grid

draw_set_alpha(1)
draw_set_color(c_black)
draw_line_width(mx+3,my-(mgy*mgsy)-4,mx+(mgx*mgs)-4,my-(mgy*mgsy)-4,7) //Draw horizontal line
draw_line_width(mx+(mgx*mgs),my+3,mx+(mgx*mgs),my-(mgy*mgsy),7) //Draw vertical line
draw_set_color(c_grey)
draw_set_alpha(0.4)
draw_line_width(mx+3,my-(mgy*mgsy)+4,mx+(mgx*mgs)-4,my-(mgy*mgsy)+4,7) //Draw horizontal line
draw_line_width(mx+(mgx*mgs),my+3,mx+(mgx*mgs),my-(mgy*mgsy),7) //Draw vertical line

	
}

