var mar = global.menu_width/15 //size of menu margin
var y_deep = room_height/40
var px_mar = y_deep*0.2


if global.back = 1 then

{
	if (global.page > 0) then {global.page -= 1}
	global.back = 0
}

if global.next = 1 then
{
	if (global.page < 2) then {global.page += 1}
	global.next = 0
}




//DRAW BACK+NEXT BUTTON

var xx = (room_width-global.menu_width)+mar
var yy = mar/2
var x_wide = ((global.menu_width-(mar*2))/4) //size
var y_deep = room_height/40

	//BACK BUTTON
	
	draw_set_colour(c_white)
	var hover = point_in_rectangle(mouse_x,mouse_y,xx,yy,xx+x_wide,yy+y_deep)
	if hover then { draw_set_alpha(0.5); hover=1 } else { draw_set_alpha(1); } //If mouse detcted, set alpha + hover
	if hover && mouse_check_button_pressed(mb_left) then { global.back = 1 } //if clicked then tell variable
	draw_rectangle(xx,yy,xx+x_wide,yy+y_deep,0)
	draw_set_alpha(1) //reset colour + alpha
	draw_set_colour(c_black)
	draw_text(xx+1,yy,string("BACK"))
	
	//NEXT BUTTON

var xx = (room_width-mar)-x_wide //starting position
	
	draw_set_colour(c_white)
	var hover = point_in_rectangle(mouse_x,mouse_y,xx,yy,xx+x_wide,yy+y_deep)
	if hover then { draw_set_alpha(0.5); hover=1 } else { draw_set_alpha(1); } //If mouse detcted, set alpha + hover
	if hover && mouse_check_button_pressed(mb_left) then { global.next = 1 } //if clicked then tell variable
	draw_rectangle(xx,yy,xx+x_wide,yy+y_deep,0)
	draw_set_alpha(1) //reset colour + alpha
	draw_set_colour(c_black)
	draw_text(xx,yy,string("NEXT"))
	
if global.page = 0 //DRAW DRUG LIST

{
	var y_deep = room_height/40
	var xx = (room_width-global.menu_width)+mar //starting position of selection boxes
	var x_wide = global.menu_width-(mar*2) //size
	var yy = global.bar_depth + (y_deep*2.5)

	for(var i=0; i<global.drugs_max; i += 1) //create list
	{
		draw_set_colour(c_white)
		var hover = point_in_rectangle(mouse_x,mouse_y,xx,yy+(i*y_deep),xx+x_wide,yy+(i*y_deep)+y_deep)
		if hover then { draw_set_alpha(0.5); hover=1 } else { draw_set_alpha(1); } //If mouse detcted, set alpha + hover
		if hover && mouse_check_button_pressed(mb_left) then { global.drug = i+1; global.select = 1 } //if clicked then tell variable
		if global.drug = i+1 then { draw_set_alpha(0.5) }
		draw_rectangle(xx,yy+(i*y_deep),xx+x_wide,yy+(i*y_deep)+y_deep,0)
		draw_set_alpha(1) //reset colour + alpha
		draw_set_colour(c_black)
	
		if file_exists("list.txt") //if file exists
		{
			file = file_text_open_read(working_directory + "list.txt"); //Open file to read
			file_text_readln(file);//skip first 5 lines
			file_text_readln(file);
			file_text_readln(file);
			file_text_readln(file);
			file_text_readln(file);
			file_text_readln(file);
			file_text_readln(file);

			for (var ii = 0; ii < (7*i); ii += 1;) //skip to relevant name
				{
					file_text_readln(file);
				}
			var drg = file_text_read_string(file)
			draw_text_transformed(xx,yy+(i*y_deep),string(drg),1,1,0) //draw name of drug
			file_text_close(file); //close file to be read elsewhere	
		}
		draw_rectangle(xx,yy+(i*y_deep),xx+x_wide,yy+(i*y_deep)+y_deep,1) //draw outline box

	}
draw_set_color(c_white)
draw_text(xx,yy-(y_deep*2.5), "COMPOUND")

}

//CLEAR BUTTON

var xx = mar*1
var yy = mar*1
var x_wide = ((mar*4)) //size
var y_deep = (room_height/40) 


draw_set_colour(c_white)
var hover = point_in_rectangle(mouse_x,mouse_y,xx,yy,xx+x_wide,yy+y_deep)
if hover then { draw_set_alpha(0.5); hover=1 } else { draw_set_alpha(1); } //If mouse detcted, set alpha + hover
if hover && mouse_check_button_pressed(mb_left) then { global.clear = 1; } //if clicked then tell variable
draw_rectangle(xx,yy,xx+x_wide,yy+y_deep,0)
draw_set_alpha(1) //reset colour + alpha
draw_set_colour(c_black)
draw_text(xx,yy,string("CLEAR"))
	

if global.clear = 1 //RESET INSTANCES
	
		{
			instance_destroy(obj_drug)
			//global.select = 1
			inst = scr_drug(global.drugs_max,0,0,1,0)
			global.clear = 0
			alarm[1] = 2 //recalculate select
			
			//scr_save(global.preset)
		}
		
//shift hours over left

var xx = mar*6
var yy = mar*1
var x_wide = ((mar*1.4)) //size
var y_deep = (room_height/40) 

draw_set_colour(c_white)
var hover = point_in_rectangle(mouse_x,mouse_y,xx,yy,xx+x_wide,yy+y_deep)
if hover then { draw_set_alpha(0.5); hover=1 } else { draw_set_alpha(1); } //If mouse detcted, set alpha + hover
if hover && mouse_check_button_pressed(mb_left)
then 
	{
		if global.hr24
		then
			{ global.h_zero -= 1;}
		else 
			{ global.zoom_hr -= 1 }
	} 
draw_rectangle(xx,yy,xx+x_wide,yy+y_deep,0)
draw_set_alpha(1) //reset colour + alpha
draw_set_colour(c_black)
draw_text(xx,yy,string("<<<"))

//shift hours over right

var xx = mar*11.5
var yy = mar*1
var x_wide = ((mar*1.4)) //size
var y_deep = (room_height/40) 

draw_set_colour(c_white)
var hover = point_in_rectangle(mouse_x,mouse_y,xx,yy,xx+x_wide,yy+y_deep)
if hover then { draw_set_alpha(0.5); hover=1 } else { draw_set_alpha(1); } //If mouse detcted, set alpha + hover
if hover && mouse_check_button_pressed(mb_left)
then //if clicked then tell variable
	{
		if global.hr24
		then
			{ global.h_zero += 1; }
		else
		{ global.zoom_hr += 1 }
	} 
draw_rectangle(xx,yy,xx+x_wide,yy+y_deep,0)
draw_set_alpha(1) //reset colour + alpha
draw_set_colour(c_black)
draw_text(xx,yy,string(">>>"))

//recalc actual hours

if global.h_zero > 23 then global.h_zero = 0 
if global.h_zero < 0 then global.h_zero = 23 
if global.zoom_hr > 12 then global.zoom_hr = 12
if global.zoom_hr < 0 then global.zoom_hr = 0 

//lock hours to 24 or 12 format

var xx = mar*8
var yy = mar*1
var x_wide = ((mar*3)) //size
var y_deep = (room_height/40) 

draw_set_colour(c_white)
var hover = point_in_rectangle(mouse_x,mouse_y,xx,yy,xx+x_wide,yy+y_deep)
if hover then { draw_set_alpha(0.5); hover=1 } else { draw_set_alpha(1); } //If mouse detcted, set alpha + hover
if hover && mouse_check_button_pressed(mb_left) then {if global.hr24 = 0 then global.hr24 = 1 else global.hr24 = 0 } //if clicked then tell variable
if !global.hr24 then { draw_set_alpha(0.5) }
draw_rectangle(xx,yy,xx+x_wide,yy+y_deep,0)
draw_set_alpha(1) //reset colour + alpha
draw_set_colour(c_black)
draw_text(xx,yy,string("ZOOM"))

//EFFECT BUTTON

var xx = mar*14
var yy = mar*1
var x_wide = ((mar*3.5)) //size
var y_deep = (room_height/40) 

draw_set_colour(c_white)
var hover = point_in_rectangle(mouse_x,mouse_y,xx,yy,xx+x_wide,yy+y_deep)
if hover then { draw_set_alpha(0.5); hover=1 } else { draw_set_alpha(1); } //If mouse detcted, set alpha + hover
if hover && mouse_check_button_pressed(mb_left) then {alarm[2] = 2 ; global.select = 1; if global.effect = 0 then global.effect = 1 else global.effect = 0 } //if clicked then tell variable
if global.effect then { draw_set_alpha(0.5) }
draw_rectangle(xx,yy,xx+x_wide,yy+y_deep,0)
draw_set_alpha(1) //reset colour + alpha
draw_set_colour(c_black)
draw_text(xx,yy,string("EFFECT"))



if global.page = 1

{
	//ENTER BUTTON
	
	
	
	var xx = (room_width-global.menu_width)+mar
	var yy = global.bar_depth + (y_deep*2.5)
	var x_wide = ((global.menu_width-(mar*2))/4) //size
	var y_deep = room_height/40
	draw_set_colour(c_white)
	var hover = point_in_rectangle(mouse_x,mouse_y,xx,yy+(y_deep),xx+x_wide,yy+(y_deep)+y_deep)
	if hover then { draw_set_alpha(0.5); hover=1 } else { draw_set_alpha(1); } //If mouse detcted, set alpha + hover
	if hover && mouse_check_button_pressed(mb_left) then	{ global.enter = 1; if (global.count < max_list-1) then obj_drug.written = 1 } //if clicked then tell variable
	draw_rectangle(xx,yy+(y_deep),xx+x_wide,yy+(y_deep)+y_deep,0)
	draw_set_alpha(1) //reset colour + alpha
	draw_set_colour(c_black)
	draw_text_transformed(xx+2,yy+(y_deep),"ENTER",1,1,0) //draw base dosage of drug	
	
	
}
if global.page !=2

{
	//DOSAGE BOX
	var y_deep = room_height/40
	var xx = (room_width-global.menu_width)+mar //starting position of selection boxes
	var yy = global.bar_depth + (px_mar)
	var x_wide = ((global.menu_width-(mar*2))/3)*2 //size
	draw_set_colour(c_white)
	draw_rectangle(xx,yy+(y_deep),xx+x_wide,yy+(y_deep)+y_deep,0)
	draw_set_alpha(1) //reset colour + alpha
	draw_set_colour(c_black)
	draw_text_transformed(xx,yy+(y_deep),string(global.dosage),1,1,0) //draw name of drug	
		
	
	
	//ADJUST BOX
	var xx = xx+x_wide+(px_mar) //starting position
	var x_wide = ((global.menu_width-(mar*2))/3)-px_mar //size
	draw_set_colour(c_white)
			var hover = point_in_rectangle(mouse_x,mouse_y,xx,yy+(y_deep),xx+x_wide,yy+(y_deep)+y_deep)
		if hover then { draw_set_alpha(0.5); hover=1 } else { draw_set_alpha(1); } //If mouse detcted, set alpha + hover
		if hover && mouse_check_button_pressed(mb_left) then
		{
		global.dosage = b_d
		global.select = 1
		} //if clicked then tell variable

	draw_rectangle(xx,yy+(y_deep),xx+x_wide,yy+(y_deep)+y_deep,0)
	draw_set_alpha(1) //reset colour + alpha
	draw_set_colour(c_black)
	draw_text_transformed(xx,yy+(y_deep),string(b_d),1,1,0) //draw base dosage of drug	

}

global.unit = scr_read(global.drug,3) 
file_text_close(file);


gs = global.gridsize //shorten grid size
if global.hr24 then gsizex = global.gridsize else gsizex = global.gridsize*2
mgs = global.minigridsize
var xx = global.startx //starting position of graph
var yy = global.starty 
var mx = global.minis_x
var my = global.minis_y



//calculate sum of colour for current x plus all those behind it
//and use that sum to decrease actual values by the tolerance constant

var ptotal = 0 //init variable for adding psych
var stotal = 0 //init variable for adding stim
var dtotal = 0 //init variable for adding diss
//if 24hr disabled then half number of grids drawn
if global.hr24 then { gridsx_store = global.gridsx } else { gridsx_store = global.gridsx/2 }
for(var ii=0; ii<global.gridsx; ii += 1) //set grid along X axis
	{	
		ptotal += sum[ii][3]
		stotal += sum[ii][4]
		dtotal += sum[ii][5]
		for(var i=0; i<global.gridsy; i += 1) //set grid along y axis
			{	
				//let the adjustment be the inverse decimal of the current total div by constant, and no less than zero
				padjust = max(0,lerp(1,0,ptotal*global.p_tol_constant))
				sadjust = max(0,lerp(1,0,stotal*global.s_tol_constant)) 
				dadjust = max(0,lerp(1,0,dtotal*global.d_tol_constant)) 
				if !global.effect then  //if efect is disabled
					{
						padjust = 1 //ignore tolerances
						sadjust = 1
						dadjust = 1
					}
				col_array = ds[# ii,i]
				R = col_array[3]*padjust //psych stats (RED)
				G = col_array[4]*sadjust //stim stats (GREEN)
				B = (col_array[5]*dadjust) //diss stats (BLUE)
				//cnt = col_array[6] //Count of drugs
				R_b = min((lerp(0,255,R/base)),255) //let colour = percentage of way to base number
				G_b = min((lerp(0,255,G/base)),255)
				B_b = min((lerp(0,255,B/base)),255)
				col_array[0] = R_b //set values to array
				col_array[1] = G_b
				col_array[2] = B_b
			} 
	}				
				
var zmr = global.zoom_hr*(global.gridsx/24) //shorten zoom
if global.hr24 = 1 then zmr = 0 //if opn 24hr mode then reset zoom
for(var ii=0+zmr; ii<gridsx_store+zmr; ii += 1) //draw grid along X axis
	{	

		for(var i=0; i<global.gridsy; i += 1) //draw grid along y axis
			{				
				col_array = ds[# ii,i]
				c1 = col_array[0] //remember values
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
						draw_rectangle(xx+((gsizex*(ii-zmr))+gsd),(yy-(gs*i))-gsd,xx+(gsizex+(gsizex*(ii-zmr)))-gsd,yy-(gs*(i+1)),0) 
					}			
				
				//begin to draw small cells
				col = make_color_rgb(c1,c2,c3)
				draw_set_colour(col)
		
				if col_array[6] !=0
					{
						draw_rectangle(xx+(gsizex*(ii-zmr)),yy-(gs*i)+2,xx+gsizex+(gsizex*(ii-zmr)),yy-(gs*(i+1)),0) //draw squares colours
					}

				draw_set_colour(c_grey)
				draw_set_alpha(0.05)
				draw_rectangle(xx+(gsizex*(ii-zmr)),yy-(gs*i),xx+gsizex+(gsizex*(ii-zmr)),yy-(gs*(i+1)),1) //draw squares outlines
				draw_set_alpha(1)
			} 
	}

if init = 0 then { scr_sum(); init = 1 } //recalculate totals once
	

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
draw_line_width(xx,yy,xx+(gsx*gs),yy,7) //Draw horizontal line
draw_line_width(xx,yy,xx,yy-(gsy*gs),7) //Draw vertical line
draw_set_color(c_grey)
draw_set_alpha(0.4)
draw_line_width(xx,yy,xx+(gsx*gs),yy,7) //Draw horizontal line
draw_line_width(xx,yy,xx,yy-(gsy*gs),7) //Draw vertical line

//DRAW MINI GRID

var zmr2 = zmr/2
for(var ii=0+(zmr2); ii<(zmr2)+gridsx_store/2; ii += 1) //draw grid along X axis
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
				draw_rectangle(mx+(mgs*(ii-zmr2))+1,my-(mgsy*i)+1,mx+mgs+(mgs*(ii-zmr2)),my-(mgsy*(i+1)),0) //draw squares colours			
				draw_set_colour(c_grey)
				draw_set_alpha(0.4)					
				draw_set_alpha(1)
			}
	}
	
//DRAW NUMBER AXIS


if global.hr24 = 1 //if AM_PM is on 24hr mode
	{
		var gm = global.margin
		var sx = global.startx-(global.startx/5)
		var sy = global.starty
		var hz = global.h_zero
		var sz = global.gridsize
		
		for(var i=global.h_zero; i<24; i +=1) //draw numbers on axis
			{
				draw_text((sz*global.gridsx/24)*(i-hz)+sx,sy+(gm/2),string(i))
			}
		filled = 24 - global.h_zero //number of hours filled
		for(var i=filled; i<24; i +=1) //draw numbers on axis
			{
				draw_text((sz*global.gridsx/24)*(i)+sx,sy+(gm/2),string(i-filled))
			}
	}
else //CHANGE THIS TO ONLY DRAW ACTUAL VIEWABLE NUMBERS //ONLY SHOW TOLERANCE WHEN EFFECT IS ON!!!!
//////START HERE
	{
		var gm = global.margin
		var sx = global.startx-(global.startx/5)
		var sy = global.starty
		var hz = global.h_zero
		var sz = global.gridsize
		var zh = global.zoom_hr
		
		for(var i=global.h_zero+zh; i<12+zh+hz; i +=1) //draw numbers on axis
			{
				if i < 24 then
					{
						draw_text((sz*global.gridsx/12)*(i-hz-zh)+sx,sy+(gm/2),string(i))
					}
			}
		filled = 24 - global.h_zero //number of hours filled
		for(var i=filled; i<24+zh; i +=1) //draw numbers on axis
			{
				if (i-filled) < 24-filled
				{
					//if (i-filled) < ((24-global.h_zero)+global.zoom_hr)-(22)
					var out = (global.zoom_hr+global.h_zero)-12 //Gives output of how many numbers are needed on the right side
					if (i-filled) < out
						{
							draw_text((sz*global.gridsx/12)*(i-zh)+sx,sy+(gm/2),string(i-filled))
						}
				}
			}
	}

if global.page = 2 //PAGE TWO SCHEDULE
{	
	
	//PRESET BUTTONS
	
	var y_deep = room_height/40
	var xx = (room_width-global.menu_width)+mar //starting position of selection boxes
	var yy = global.bar_depth + (px_mar)
	var x_wide = ((global.menu_width-(mar*2))/5) //size
	draw_set_colour(c_white)
	for(var i=0; i<(5); i += 1) //create list
	{
	var hover = point_in_rectangle(mouse_x,mouse_y,xx+(i*x_wide),yy+(y_deep),xx+(i*x_wide)+x_wide,yy+(y_deep)+y_deep)
	if hover then { draw_set_alpha(0.5); hover=1 } else { draw_set_alpha(1); } //If mouse detcted, set alpha + hover
	if global.preset = 1 && i = 0 then {draw_set_alpha(0.5);}
	if global.preset = 2 && i = 1 then {draw_set_alpha(0.5);}
	if global.preset = 3 && i = 2 then {draw_set_alpha(0.5);}
	if global.preset = 4 && i = 3 then {draw_set_alpha(0.5);}
	if global.preset = 5 && i = 4 then {draw_set_alpha(0.5);}
	if hover && mouse_check_button_pressed(mb_left) then //if clicked then tell variable
		{
			
			if alarm[1] = -1
			{
				if i = 0 then { global.preset = 1; scr_load(1); alarm[1] = 15 }
				if i = 1 then { global.preset = 2; scr_load(2); alarm[1] = 15 }
				if i = 2 then { global.preset = 3; scr_load(3); alarm[1] = 15 }
				if i = 3 then { global.preset = 4; scr_load(4); alarm[1] = 15 }
				if i = 4 then { global.preset = 5; scr_load(5); alarm[1] = 15 }
			}
			
		}
	draw_set_colour(c_white)
	draw_rectangle(xx+(i*x_wide),yy+(y_deep),xx+(i*x_wide)+x_wide,yy+(y_deep)+y_deep,0)
	draw_set_alpha(1) //reset colour + alpha
	draw_set_colour(c_black)
	draw_rectangle(xx+(i*x_wide),yy+(y_deep),xx+(i*x_wide)+x_wide,yy+(y_deep)+y_deep,1) //draw outline box		
	draw_text_transformed(xx+8+(i*x_wide),yy+(y_deep),string(i+1),1,1,0)
	}
	
	
	var y_deep = room_height/40
	var xx = (room_width-global.menu_width)+mar //starting position of selection boxes
	var yy = global.bar_depth + (y_deep*1.5)
	var x_wide = ((global.menu_width-(mar*2))) //size
	for(var i=1; i<(global.written+1); i += 1) //create list
	{
		//draw_set_font(fnt_default2);
		var num = list[# 0,global.written-i]
		if num = undefined then num = 0
		var tar = list[# 4,global.written-i]
		var dr = scr_read(num,1) //read real drug name
		file_text_close(file)
		var unt = scr_read(num,3) //read unit vals
		if unt = 1 {unt = "mg"}
		if unt = 2 {unt = "ug"}
		if unt = 3 {unt = "g"}
		file_text_close(file)
		draw_set_colour(c_white)
		var hover = point_in_rectangle(mouse_x,mouse_y,xx,yy+(i*y_deep),xx+x_wide,yy+(i*y_deep)+y_deep)
		if hover then { draw_set_alpha(0.5); hover=1 } else { draw_set_alpha(1); } //If mouse detcted, set alpha + hover
		if hover && mouse_check_button_pressed(mb_left) then //if clicked then tell variable
			{				
			global.drug = tar.drug
			global.dosage = tar.dosage
			global.hour = tar.hour
			global.tolerance = tar.tolerance
			global.select = 1;
			instance_destroy(tar);	
			break
			} 
		draw_rectangle(xx,yy+(i*y_deep),xx+x_wide,yy+(i*y_deep)+y_deep,0)
		draw_set_alpha(1) //reset colour + alpha
		draw_set_colour(c_black)
		draw_rectangle(xx,yy+(i*y_deep),xx+x_wide,yy+(i*y_deep)+y_deep,1) //draw outline box
		var hr = list[# 1,global.written-i]
			if hr < 12 then
	{
		//if AM_PM = 1 then am_pm_cur = 1  else am_pm_cur = 0
		am_pm_cur1 = 0
	}
	else 
	{ 
		//if AM_PM = 0 then am_pm_cur = 0  else am_pm_cur = 1
		am_pm_cur1 = 1
	}
	

		if AM_PM = 0 
			{
				 if am_pm_cur1 then 
				{	
					draw_text_transformed(xx,yy+(i*y_deep),string(dr) + " " + string(list[# 2,global.written-i]) + string(unt) + " " + string(hr-11) + "AM" ,1,1,0) //draw stats of drug
				}
				else
				{	
					draw_text_transformed(xx,yy+(i*y_deep),string(dr) + " " + string(list[# 2,global.written-i]) + string(unt) + " " + string(hr+1) + "PM" ,1,1,0) //draw stats of drug
				}
			}
			
		if AM_PM = 1
			{
				 if am_pm_cur1 then 
				{	
					draw_text_transformed(xx,yy+(i*y_deep),string(dr) + " " + string(list[# 2,global.written-i]) + string(unt) + " " + string(hr-11) + "PM" ,1,1,0) //draw stats of drug
				}
				else
				{	
					draw_text_transformed(xx,yy+(i*y_deep),string(dr) + " " + string(list[# 2,global.written-i]) + string(unt) + " " + string(hr+1) + "AM" ,1,1,0) //draw stats of drug
				}
			}
			
		if AM_PM = 2
			{
				 if am_pm_cur1 then 
				{	
					draw_text_transformed(xx,yy+(i*y_deep),string(dr) + " " + string(list[# 2,global.written-i]) + string(unt) + " " + string(hr+1) + ":00" ,1,1,0) //draw stats of drug
				}
				else
				{	
					draw_text_transformed(xx,yy+(i*y_deep),string(dr) + " " + string(list[# 2,global.written-i]) + string(unt) + " " + string(hr+1) + ":00" ,1,1,0) //draw stats of drug
				}
			}
			
		if AM_PM = 3
			{
				 if am_pm_cur1 then 
				{	
					draw_text_transformed(xx,yy+(i*y_deep),string(dr) + " " + string(list[# 2,global.written-i]) + string(unt) + " " + string(hr-11) + ":00" ,1,1,0) //draw stats of drug
				}
				else
				{	
					draw_text_transformed(xx,yy+(i*y_deep),string(dr) + " " + string(list[# 2,global.written-i]) + string(unt) + " " + string(hr+12) + ":00" ,1,1,0) //draw stats of drug
				}
			}

	}
draw_set_color(c_white)
draw_text(xx,yy-(y_deep*1.5), "SCHEDULE")

}

if global.enter = 1
{
	if global.count < (max_list-1)
		{
			//scr_sum()
			alarm[1] = 2 //recalculate totals
			inst = undefined;
			global.select = 1;
			global.drug = global.drugs_max;
			global.tolerance = 1; 
			//scr_save(global.preset)
		}		
}


if global.select = 1 then //if selected a box
	{	
		alarm[2] = 3 //double trigger select
		//scr_sum() //recalculate totals
		var inst_prev = inst //set memory of instance
		if b_d = global.dosage then {same = 1} else {same = 0} //if bd is same as dosage now, tell this variable
		b_d = scr_read(global.drug,2) //read temp base dosage
		file_text_close(file); //close file to be read elsewhere
		if same then global.dosage = b_d
		inst = scr_drug(global.drug,global.dosage,global.hour,global.tolerance,0); //create drug with asked dosage}
		with (inst_prev) { instance_destroy(id) } //delete old one
		global.select = 0 //reset select
		//scr_sum()
		alarm[1] = 2 //recalculate totals
		
		
					//BEGIN TO ORDER SCHEDULE
		
		//check max value, find it, save the instance ref to array, clear the grid
		//copy instances in order
		// finally destroy instance,
		if global.written < (max_list-1) then
		{
		curr = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0] //create array
		h = ds_grid_height(list)
		for (var i = 0; i < 20; i += 1)
		{
			t = ds_grid_get_max(list,1,0,1,h) //get highest number of hour
			if t != -1  //if max is not empty slot
				{
					T = ds_grid_value_y(list,1,0,1,h,t) //current target row
					var targ = list[# 4,T] //instance target reference
					curr[i] = targ //set target from largest to smallest
					ds_grid_set_region(list,1,T,5,T,-1) //clear row in question
					//cleared = 1 //tell list has been cleared
				}
		}	
		g_c = global.written
		for (var i = 0; i < g_c; i += 1) //run as many times as drugs exist
			{
				//show_message("sup")
				var targ = curr[i] //set new target instance from array
				if targ > 0 then 
					{ with(targ) {scr_drug(drug,dosage,hour,tolerance,written); instance_destroy(id)} }
			}
		}
	}
	draw_text(1200,420,global.extend)
	
	//disable peak extension level when alarm has expired
if alarm[0] = -1 { alarm[0] = 1 }

global.enter = 0
//scr_draw_ds(list,50,50)

//MINI GRID AXIS

draw_set_color(c_black)
draw_line_width(mx,my,mx+(mgx*mgs),my,7) //Draw horizontal line
draw_line_width(mx,my,mx,my-(mgy*mgsy),7) //Draw vertical line
draw_set_alpha(0.4)
draw_set_color(c_grey)
draw_line_width(mx,my,mx+(mgx*mgs),my,7) //Draw horizontal line
draw_line_width(mx,my,mx,my-(mgy*mgsy),7) //Draw vertical line
draw_set_alpha(1)


//DRAW MENU BOXES
draw_set_color(c_grey)
draw_set_alpha(0.2)
draw_rectangle(room_width-global.menu_width,0,room_width,room_height,0) //DRAW SIDE MENU
draw_rectangle(0,0,room_width-(global.menu_width+1),global.bar_depth,0) //DRAW TOP MENU
draw_set_alpha(1)

draw_text(30,50,filled)
draw_text(1200,420,global.extend)
draw_text(1200,440,global.peaked)

    draw_text(32, 32, global.zoom_hr);
	 draw_text(32, 65, test);