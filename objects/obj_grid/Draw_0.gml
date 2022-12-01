/// @description 

gs = global.gridsize //shorten grid size
mgs = global.minigridsize
var xx = global.startx //starting position of graph
var yy = global.starty
var mx = global.minis_x
var my = global.minis_y


//Calculate colour from stats

for(var ii=0; ii<global.gridsx; ii += 1) //set grid along X axis
	{		
		for(var i=0; i<global.gridsy; i += 1) //set grid along y axis
			{	
				col_array = ds[# ii,i]
				R = col_array[3] //psych stats (RED)
				G = col_array[4] //stim stats (GREEN)
				B = col_array[5] //diss stats (BLUE)
				//cnt = col_array[6] //Count of drugs
				R_b = min((lerp(0,255,R/base)),255) //let colour = percentage of way to base number
				G_b = min((lerp(0,255,G/base)),255)
				B_b = min((lerp(0,255,B/base)),255)
				col_array[0] = R_b
				col_array[1] = G_b
				col_array[2] = B_b
			} 
	}				
				
	
for(var ii=0; ii<global.gridsx; ii += 1) //draw grid along X axis
	{		
		for(var i=0; i<global.gridsy; i += 1) //draw grid along y axis
			{				
				col_array = ds[# ii,i]
				c1 = col_array[0]
				c2 = col_array[1]
				c3 = col_array[2]
				gsd = gs/4 //magrgin around small cells
				if i < global.gridsy-1 then //if not at top of grid
				
					{				
						col_array1 = ds[# ii,i+1] //set second array to grid above
						cc1 = col_array1[0]
						cc2 = col_array1[1]
						cc3 = col_array1[2]
						c1 = mean(c1,cc1) 
						c2 = mean(c2,cc2) 
						c3 = mean(c3,cc3) 
					}
				
				
				//begin to draw total grid
				av = sum[ii][6]
				ct1 = (sum[ii][0]/av)
				ct2 = (sum[ii][1]/av)
				ct3 = (sum[ii][2]/av)
				
				col = make_color_rgb(ct1,ct2,ct3)
				draw_set_colour(col)	
				if i < (av-1)
					{
						//draw_circle(xx+((gs*ii)+gsd),(yy-(gs*i))-gsd,3,0) 
						draw_rectangle(xx+((gs*ii)+gsd),(yy-(gs*i))-gsd,xx+(gs+(gs*ii))-gsd,yy-(gs*(i+1)),0) 
						//draw_rectangle(xx+((gs*ii)),(yy-(gs*i)),xx+(gs+(gs*ii)),yy-(gs*(i+1)),0) 
					}
				
				
				//begin to draw small cells
				col = make_color_rgb(c1,c2,c3)
				draw_set_colour(col)
		
				if col_array[6] !=0
					{
					//draw_circle(xx+((gs*ii)+gsd),(yy-(gs*i))-gsd,5,0)
					//draw_rectangle(xx+((gs*ii)+gsd),(yy-(gs*i))-gsd,xx+(gs+(gs*ii))-gsd,yy-(gs*(i+1)),0) //draw squares colours ofset
					draw_rectangle(xx+(gs*ii),yy-(gs*i)+2,xx+gs+(gs*ii),yy-(gs*(i+1)),0) //draw squares colours
					}

				draw_set_colour(c_grey)
				draw_set_alpha(0.05)
				draw_rectangle(xx+(gs*ii),yy-(gs*i),xx+gs+(gs*ii),yy-(gs*(i+1)),1) //draw squares outlines
				draw_set_alpha(1)
			} 
	}
scr_sum()
	

//DRAW GRAPH AXIS

//var xx = global.startx //starting position of graph
//var yy = global.starty 
var gsx = global.gridsx //How many grids wide
var gsy = global.gridsy //How many grids high
var mgx = global.minig_x //How many min grids wide
var mgy = global.minig_y //How many min grids high

draw_set_color(c_black)
draw_line_width(xx,yy,xx+(gsx*gs),yy,7) //Draw horizontal line
draw_line_width(xx,yy,xx,yy-(gsy*gs),7) //Draw vertical line
draw_set_color(c_grey)
draw_set_alpha(0.4)
draw_line_width(xx,yy,xx+(gsx*gs),yy,7) //Draw horizontal line
draw_line_width(xx,yy,xx,yy-(gsy*gs),7) //Draw vertical line

//DRAW MINI GRID
for(var ii=0; ii<global.minig_x; ii += 1) //draw grid along X axis
	{		
		for(var i=0; i<global.minig_y; i += 1) //draw grid along y axis
			{	
				/////? take total and group in pairs, find average, and then run coloured squares for
				/////? as many squares as total has divided by minig_y squares, to make equivalent height
				/////? and colour using total averages
				av = mean(sum[ii*2][6] + sum[ii*2+1][6]) //cells containing colour
				c1 = mean((sum[2*ii][0]) + (sum[(ii*2)+1][0]))/global.gridsy //average of red
				c2 = mean((sum[2*ii][1]) + (sum[(ii*2)+1][1]))/global.gridsy //green
				c3 = mean((sum[2*ii][2]) + (sum[(ii*2)+1][2]))/global.gridsy //blue
				c1 = clamp(c1,0,255)
				c2 = clamp(c2,0,255)
				c3 = clamp(c3,0,255)
				a1 = c1/global.mini_base
				a2 = c2/global.mini_base //how close is colour to 255 (for alpha)
				a3 = c3/global.mini_base
				//a123 = mean(a1 + a2 + a3)
				a123 = max(a1,a2,a3)
				
				col = make_color_rgb(c1,c2,c3)
				draw_set_colour(col)
				draw_set_alpha(a123)
				draw_rectangle(mx+(mgs*ii)+1,my-(mgs*i)+1,mx+mgs+(mgs*ii),my-(mgs*(i+1)),0) //draw squares colours			
				draw_set_colour(c_grey)
				draw_set_alpha(0.4)
			//	draw_rectangle(mx+(mgs*ii),my-(mgs*i)+2,mx+mgs+(mgs*ii),my-(mgs*(i+1)),1) //draw squares outline 					
				draw_set_alpha(1)
			}
	}

//MINI GRID AXIS

draw_set_color(c_black)
draw_line_width(mx,my,mx+(mgx*mgs),my,7) //Draw horizontal line
draw_line_width(mx,my,mx,my-(mgy*mgs),7) //Draw vertical line
draw_set_alpha(0.4)
draw_set_color(c_grey)
draw_line_width(mx,my,mx+(mgx*mgs),my,7) //Draw horizontal line
draw_line_width(mx,my,mx,my-(mgy*mgs),7) //Draw vertical line
draw_set_alpha(1)


//DRAW MENU BOXES
draw_set_color(c_grey)
draw_set_alpha(0.2)
draw_rectangle(room_width-global.menu_width,0,room_width,room_height,0) //DRAW SIDE MENU
draw_rectangle(0,0,room_width-(global.menu_width+1),global.bar_depth,0) //DRAW TOP MENU
draw_set_alpha(1)

draw_text(1200,420,lerp(1,1,255))