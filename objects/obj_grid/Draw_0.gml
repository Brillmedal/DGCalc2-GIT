var mar = global.menu_width/15 //size of menu margin
var y_deep = room_height/40
var px_mar = y_deep*0.2
if keyboard_check_direct(vk_shift) then shift = 1 else shift = 0 //check shift


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

if global.dosage > 1000 {global.dosage = 1000}
if global.dosage < 0 {global.dosage = 0}
current = scr_read(global.drug,1)
file_text_close(file);

if global.edit = 0

{
	
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
	
}
	
if global.page = 0 //DRAW DRUG LIST

{
	var y_deep = room_height/40
	var xx = (room_width-global.menu_width)+mar //starting position of selection boxes
	var x_wide = global.menu_width-(mar*2) //size
	var yy = global.bar_depth + (y_deep*2.5)
	draw_set_alpha(1)

	for(var i=0; i<global.drugs_max; i += 1) //create list
	{
		draw_set_colour(c_white)
		if editing = 0
		{
			var hover = point_in_rectangle(mouse_x,mouse_y,xx,yy+(i*y_deep),xx+x_wide,yy+(i*y_deep)+y_deep)
			if hover then { draw_set_alpha(0.5); hover=1 } else { draw_set_alpha(1); } //If mouse detcted, set alpha + hover
			if hover && mouse_check_button_pressed(mb_left) then { global.drug = i+1; global.select = 1 } //if clicked then tell variable
		}
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

//LIMIT KEYBOARD STRING

if string_length(keyboard_string) > 20
{
    keyboard_string = string_copy(keyboard_string, 1, 20);
}

//EDIT BUTTON

var yy = room_height-(mar*2)
var y_deep = room_height/40
var xx = (room_width-global.menu_width)+mar //starting position of selection boxes
var x_wide = global.menu_width-(mar*2) //size

draw_set_colour(c_white)
var hover = point_in_rectangle(mouse_x,mouse_y,xx,yy,xx+x_wide,yy+y_deep)
if hover then { draw_set_alpha(0.5); hover=1 } else { draw_set_alpha(1); } //If mouse detcted, set alpha + hover
if hover && mouse_check_button_pressed(mb_left) then 
{
	if global.edit = 1 then global.edit = 0 else global.edit = 1 ;
	reset = 0;
	global.select = 1;
	error = 0
	total_effect = 0
	
} //if clicked then tell variable
draw_rectangle(xx,yy,xx+x_wide,yy+y_deep,0)
draw_set_alpha(1) //reset colour + alpha
draw_set_colour(c_black)
if global.edit = 0 then
	{ draw_text(xx+(x_wide/4),yy,string("VIEW STATS")); editing = 0 }
else 
	{ draw_text(xx+(x_wide/6),yy,string("DISCARD UNSAVED")); }


//SAVE AND EDIT
if global.edit = 1
{

	//EDIT BUTTON
	
	if editing = 0
	{
		var y_deep = room_height/40
		var yy = (room_height-(mar*2))-(y_deep+px_mar)
		var xx = (room_width-global.menu_width)+mar //starting position of selection boxes
		var x_wide = global.menu_width-(mar*2) //size

		draw_set_colour(c_white)
		var hover = point_in_rectangle(mouse_x,mouse_y,xx,yy,xx+x_wide,yy+y_deep)
		if hover then { draw_set_alpha(0.5); hover=1 } else { draw_set_alpha(1); } //If mouse detcted, set alpha + hover
		if hover && mouse_check_button_pressed(mb_left) then
		{ 
			editing = 1;
			psych_edit = psych; 
			diss_edit = diss;
			stim_edit = stim
			chosen_colour = colour
		} //if clicked then tell variable
		draw_rectangle(xx,yy,xx+x_wide,yy+y_deep,0)
		draw_set_alpha(1) //reset colour + alpha
		draw_set_colour(c_black)
		draw_text(xx+(x_wide/3),yy,string("EDIT"))
		unit_edit = global.unit
	}
	
	else
	
	//SAVE BUTTON
	
	{
		
		var y_deep = room_height/40
		var yy = (room_height-(mar*2))-(y_deep+px_mar)
		var xx = (room_width-global.menu_width)+mar //starting position of selection boxes
		var x_wide = global.menu_width-(mar*2) //size

		draw_set_colour(c_white)
		var hover = point_in_rectangle(mouse_x,mouse_y,xx,yy,xx+x_wide,yy+y_deep)
		if hover then { draw_set_alpha(0.5); hover=1 } else { draw_set_alpha(1); } //If mouse detcted, set alpha + hover
		if hover && mouse_check_button_pressed(mb_left) then 
			{
					//ERROR MESSAGES
				if total_effect != 100 then error =1	
				{
					if total_effect = 0 then error = 0
				}
				
				if error != 1
				{
					scr_copyfile();
					file_text_close(filecopy);
					file_text_close(file1);
					editing = 0
				}
			} //if clicked then tell variable
		draw_rectangle(xx,yy,xx+x_wide,yy+y_deep,0)
		draw_set_alpha(1) //reset colour + alpha
		draw_set_colour(c_black)
		draw_text(xx+(x_wide/6),yy,string("SAVE CHANGES"))
	
	}
	
	if reset = 0
	{
		//RESET BUTTON

		var xx = mar*1
		var yy = mar*1
		var x_wide = ((mar*16)) //size
		var y_deep = (room_height/40) 

		draw_set_colour(c_white)
		var hover = point_in_rectangle(mouse_x,mouse_y,xx,yy,xx+x_wide,yy+y_deep)
		if hover then { draw_set_alpha(0.5); hover=1 } else { draw_set_alpha(1); } //If mouse detcted, set alpha + hover
		if hover && mouse_check_button_pressed(mb_left) then { reset = 1; } //if clicked then tell variable
		draw_rectangle(xx,yy,xx+x_wide,yy+y_deep,0)
		draw_set_alpha(1) //reset colour + alpha
		draw_set_colour(c_black)
		draw_text(xx,yy,string("RESET ALL CHEMS TO DEFAULT"))	
	}
	if reset = 1
	
	{
		//RESET BUTTON

		var xx = mar*1
		var yy = mar*1
		var x_wide = ((mar*20)) //size
		var y_deep = (room_height/40) 

		draw_set_colour(c_white)
		//var hover = point_in_rectangle(mouse_x,mouse_y,xx,yy,xx+x_wide,yy+y_deep)
		//if hover then { draw_set_alpha(0.5); hover=1 } else { draw_set_alpha(1); } //If mouse detcted, set alpha + hover
		//if hover && mouse_check_button_pressed(mb_left) then { reset = 1; } //if clicked then tell variable
		draw_rectangle(xx,yy,xx+x_wide,yy+y_deep,0)
		draw_set_alpha(1) //reset colour + alpha
		draw_set_colour(c_black)
		draw_text(xx,yy,string("ARE YOU SURE? ERASE CUSTOM CHEMS?"))	
		
		var xx = mar*22
		var yy = mar*1
		var x_wide = ((mar*2)) //size
		var y_deep = (room_height/40) 

		draw_set_colour(c_white)
		var hover = point_in_rectangle(mouse_x,mouse_y,xx,yy,xx+x_wide,yy+y_deep)
		if hover then { draw_set_alpha(0.5); hover=1 } else { draw_set_alpha(1); } //If mouse detcted, set alpha + hover
		if hover && mouse_check_button_pressed(mb_left) then { reset = 2; alarm[3] = 1 } //if clicked then tell variable
		draw_rectangle(xx,yy,xx+x_wide,yy+y_deep,0)
		draw_set_alpha(1) //reset colour + alpha
		draw_set_colour(c_black)
		draw_text(xx,yy,string("YES"))	
		
		var xx = mar*25
		var x_wide = ((mar*4)) //size
		
		draw_set_colour(c_white)
		var hover = point_in_rectangle(mouse_x,mouse_y,xx,yy,xx+x_wide,yy+y_deep)
		if hover then { draw_set_alpha(0.5); hover=1 } else { draw_set_alpha(1); } //If mouse detcted, set alpha + hover
		if hover && mouse_check_button_pressed(mb_left) then { reset = 0; alarm[3] = 1} //if clicked then tell variable
		draw_rectangle(xx,yy,xx+x_wide,yy+y_deep,0)
		draw_set_alpha(1) //reset colour + alpha
		draw_set_colour(c_black)
		draw_text(xx,yy,string("NOPE"))			
	}
	
	if reset = 2 && alarm[3] = -1
	
	{
		//RESET BUTTON

		var xx = mar*1
		var yy = mar*1
		var x_wide = ((mar*14)) //size
		var y_deep = (room_height/40) 

		draw_set_colour(c_white)
		//var hover = point_in_rectangle(mouse_x,mouse_y,xx,yy,xx+x_wide,yy+y_deep)
		//if hover then { draw_set_alpha(0.5); hover=1 } else { draw_set_alpha(1); } //If mouse detcted, set alpha + hover
		//if hover && mouse_check_button_pressed(mb_left) then { reset = 1; } //if clicked then tell variable
		draw_rectangle(xx,yy,xx+x_wide,yy+y_deep,0)
		draw_set_alpha(1) //reset colour + alpha
		draw_set_colour(c_black)
		draw_text(xx,yy,string("LAST CHANCE"))	
		
		var xx = mar*16
		var yy = mar*1
		var x_wide = ((mar*3)) //size
		var y_deep = (room_height/40) 

		draw_set_colour(c_white)
		var hover = point_in_rectangle(mouse_x,mouse_y,xx,yy,xx+x_wide,yy+y_deep)
		if hover then { draw_set_alpha(0.5); hover=1 } else { draw_set_alpha(1); } //If mouse detcted, set alpha + hover
		if hover && mouse_check_button_pressed(mb_left) then { file_delete(working_directory + "list.txt"); game_end(); reset = 0 } //if clicked then tell variable
		draw_rectangle(xx,yy,xx+x_wide,yy+y_deep,0)
		draw_set_alpha(1) //reset colour + alpha
		draw_set_colour(c_black)
		draw_text(xx,yy,string("DO IT"))	
		
		var xx = mar*20
		var x_wide = ((mar*6)) //size
		
		draw_set_colour(c_white)
		var hover = point_in_rectangle(mouse_x,mouse_y,xx,yy,xx+x_wide,yy+y_deep)
		if hover then { draw_set_alpha(0.5); hover=1 } else { draw_set_alpha(1); } //If mouse detcted, set alpha + hover
		if hover && mouse_check_button_pressed(mb_left) then { reset = 0; } //if clicked then tell variable
		draw_rectangle(xx,yy,xx+x_wide,yy+y_deep,0)
		draw_set_alpha(1) //reset colour + alpha
		draw_set_colour(c_black)
		draw_text(xx,yy,string("DONT DO IT"))	
		
		
	}
	
		//EDIT TEXT BOX
	
		var y_deep = (room_height/30) 
		var xx = global.minis_x+y_deep
		var yy = global.minis_y+(y_deep*3)
		var x_wide = ((mar*16)) //size	
		draw_set_colour(c_white)
		draw_set_alpha(1) //reset colour + alpha
		draw_rectangle(xx,yy,xx+x_wide,yy+y_deep,0)
		draw_text(xx,yy-y_deep,string("NAME"))	
		draw_set_colour(c_black)		
		if !editing //if not editing then set file name as text
			{
				draw_text(xx,yy,string(name))	
				keyboard_string = name
			}
		else
			{
				draw_text(xx,yy,string(keyboard_string))	
			}
			
		//EDIT BASE DOSAGE
	
		var y_deep = (room_height/30) 
		var xx = global.minis_x+y_deep
		var yy = global.minis_y+(y_deep*6)
		var x_wide = ((mar*16)) //size	
		draw_set_colour(c_white)
		draw_set_alpha(1) //reset colour + alpha
		draw_rectangle(xx,yy,xx+x_wide,yy+y_deep,0)
		draw_text(xx,yy-y_deep,string("BASE DOSAGE"))	
		draw_set_colour(c_black)		
		if !editing //if not editing then set file name as text
			{
				draw_text(xx,yy,string(b_d))	
				//b_d += 1
			}
		else
			{	//CREATE PLUS SIDE
				draw_text(xx,yy,string(b_d))
				var x_wide = (global.menu_width/2)-(mar*1) //size
				var xx = global.minis_x+(room_height/30)
				var yy = global.minis_y+((room_height/30)*7.5)			
				var y_deep = room_height/15
				
				for(var i=0; i<3; i += 1) //create list
				{
					draw_set_colour(c_white)
					var hover = point_in_rectangle(mouse_x,mouse_y,xx,yy+(i*y_deep),xx+x_wide,yy+(i*y_deep)+y_deep)
					if hover then { draw_set_alpha(0.5); hover=1 } else { draw_set_alpha(1); } //If mouse detcted, set alpha + hover
					if hover && mouse_check_button_pressed(mb_left) then
					{

							if i = 0 then  b_d += 0.5
							if i = 1 then  b_d += 10
							if i = 2 then  b_d += 100			
							if b_d > 1000 {b_d = 1000}
							if b_d < 0 {b_d = 0}
					}
					draw_rectangle(xx,yy+(i*y_deep),xx+x_wide,yy+(i*y_deep)+y_deep,0)
					draw_set_alpha(1) //reset colour + alpha
					draw_set_colour(c_black)
					if i = 0 then  draw_text_transformed(xx,yy+(i*y_deep),string("+0.5"),1,1,0) //draw name of drug	
					if i = 1 then  draw_text_transformed(xx,yy+(i*y_deep),string("+10"),1,1,0) //draw name of drug	
					if i = 2 then  draw_text_transformed(xx,yy+(i*y_deep),string("+100"),1,1,0) //draw name of drug
					draw_rectangle(xx,yy+(i*y_deep),xx+x_wide,yy+(i*y_deep)+y_deep,1) //draw outline box
				}
				var xx = global.minis_x+(room_height/30)+x_wide
				//Write minus side!!
				for(var i=0; i<3; i += 1) //create list
				{
					draw_set_colour(c_white)
					var hover = point_in_rectangle(mouse_x,mouse_y,xx,yy+(i*y_deep),xx+x_wide,yy+(i*y_deep)+y_deep)
					if hover then { draw_set_alpha(0.5); hover=1 } else { draw_set_alpha(1); } //If mouse detcted, set alpha + hover
					if hover && mouse_check_button_pressed(mb_left) then
					{

							if i = 0 then  b_d -= 0.5
							if i = 1 then  b_d -= 10
							if i = 2 then  b_d -= 100			
							if b_d > 1000 {b_d = 1000}
							if b_d < 0 {b_d = 0}
					}
					draw_rectangle(xx,yy+(i*y_deep),xx+x_wide,yy+(i*y_deep)+y_deep,0)
					draw_set_alpha(1) //reset colour + alpha
					draw_set_colour(c_black)
					if i = 0 then  draw_text_transformed(xx,yy+(i*y_deep),string("-0.5"),1,1,0) //draw name of drug	
					if i = 1 then  draw_text_transformed(xx,yy+(i*y_deep),string("-10"),1,1,0) //draw name of drug	
					if i = 2 then  draw_text_transformed(xx,yy+(i*y_deep),string("-100"),1,1,0) //draw name of drug
					draw_rectangle(xx,yy+(i*y_deep),xx+x_wide,yy+(i*y_deep)+y_deep,1) //draw outline box
				}
				
				
			
			
			if error then 
			
			{ 				
				draw_set_colour(c_red)
				var yy = room_height-(mar*5)
				var xx = (room_width-global.menu_width)+mar //starting position of selection boxes
				draw_text(xx,yy,"Effects must total 100% or 0%")
				if total_effect = 100 then error = 0
			}
			
			}
		
		//PSYCH BUTTONS
	
		var x_wide = (global.menu_width/2)-(mar*1) //size
		var xx = global.minis_x+(room_height/30)+(x_wide*3)
		var y_deep = (room_height/30) 
		var yy = global.minis_y+(y_deep*6)
		var x_wide = ((mar*10)) //size	
		draw_set_colour(c_white)
		draw_set_alpha(1) //reset colour + alpha
		draw_rectangle(xx,yy,xx+x_wide,yy+y_deep,0)
		draw_text(xx,yy-y_deep,string("Psychedelic (%)"))	
		draw_set_colour(c_black)		
		if !editing //if not editing then set file name as text
			{
				draw_text(xx,yy,string(psych))	
			}
		else
			{	//CREATE PLUS SIDE
				
				draw_text(xx,yy,string(psych_edit))
				var x_wide = (global.menu_width/2)-(mar*1) //size
				var xx = global.minis_x+(room_height/30)+(x_wide*3)
				var yy = global.minis_y+((room_height/30)*7.5)			
				var y_deep = room_height/15
				
				
				for(var i=0; i<2; i += 1) //create list
				{
					draw_set_colour(c_white)
					var hover = point_in_rectangle(mouse_x,mouse_y,xx,yy+(i*y_deep),xx+x_wide,yy+(i*y_deep)+y_deep)
					if hover then { draw_set_alpha(0.5); hover=1 } else { draw_set_alpha(1); } //If mouse detcted, set alpha + hover
					if hover && mouse_check_button_pressed(mb_left) then
					{

							if i = 0 then  psych_edit += 1
							if i = 1 then  psych_edit += 10
							total_effect = psych_edit + stim_edit + diss_edit
							other_effect = stim_edit + diss_edit
							if total_effect > 100 then psych_edit = 100-other_effect //if total is greater than 100
							if psych_edit < 0 then psych_edit = 0 //if less than zero set to zero
							total_effect = psych_edit + stim_edit + diss_edit
							
					}
					draw_rectangle(xx,yy+(i*y_deep),xx+x_wide,yy+(i*y_deep)+y_deep,0)
					draw_set_alpha(1) //reset colour + alpha
					draw_set_colour(c_black)
					if i = 0 then  draw_text_transformed(xx,yy+(i*y_deep),string("+1"),1,1,0) //draw name of drug	
					if i = 1 then  draw_text_transformed(xx,yy+(i*y_deep),string("+10"),1,1,0) //draw name of drug	
					draw_rectangle(xx,yy+(i*y_deep),xx+x_wide,yy+(i*y_deep)+y_deep,1) //draw outline box
				}
				var xx = global.minis_x+(room_height/30)+(x_wide*4)
				//Write minus side!!
				for(var i=0; i<2; i += 1) //create list
				{
					draw_set_colour(c_white)
					var hover = point_in_rectangle(mouse_x,mouse_y,xx,yy+(i*y_deep),xx+x_wide,yy+(i*y_deep)+y_deep)
					if hover then { draw_set_alpha(0.5); hover=1 } else { draw_set_alpha(1); } //If mouse detcted, set alpha + hover
					if hover && mouse_check_button_pressed(mb_left) then
					{

							if i = 0 then  psych_edit -= 1
							if i = 1 then  psych_edit -= 10	
							total_effect = psych_edit + stim_edit + diss_edit
							other_effect = stim_edit + diss_edit
							if total_effect > 100 then psych_edit = 100-other_effect //if total is greater than 100
							if psych_edit < 0 then psych_edit = 0 //if less than zero set to zero
							total_effect = psych_edit + stim_edit + diss_edit
					}
					draw_rectangle(xx,yy+(i*y_deep),xx+x_wide,yy+(i*y_deep)+y_deep,0)
					draw_set_alpha(1) //reset colour + alpha
					draw_set_colour(c_black)
					if i = 0 then  draw_text_transformed(xx,yy+(i*y_deep),string("-1"),1,1,0) //draw name of drug	
					if i = 1 then  draw_text_transformed(xx,yy+(i*y_deep),string("-10"),1,1,0) //draw name of drug	
					draw_rectangle(xx,yy+(i*y_deep),xx+x_wide,yy+(i*y_deep)+y_deep,1) //draw outline box
				}
				
				
				
				
				
			}
			
				//STIM BUTTONS
	
		var x_wide = (global.menu_width/2)-(mar*1) //size
		var xx = global.minis_x+(room_height/30)+(x_wide*5.5)
		var y_deep = (room_height/30) 
		var yy = global.minis_y+(y_deep*6)
		var x_wide = ((mar*10)) //size	
		draw_set_colour(c_white)
		draw_set_alpha(1) //reset colour + alpha
		draw_rectangle(xx,yy,xx+x_wide,yy+y_deep,0)
		draw_text(xx,yy-y_deep,string("Stimulating (%)"))	
		draw_set_colour(c_black)		
		if !editing //if not editing then set file name as text
			{
				draw_text(xx,yy,string(stim))	
			}
		else
			{	//CREATE PLUS SIDE
				
				draw_text(xx,yy,string(stim_edit))
				var x_wide = (global.menu_width/2)-(mar*1) //size
				var yy = global.minis_y+((room_height/30)*7.5)			
				var y_deep = room_height/15
				
				
				for(var i=0; i<2; i += 1) //create list
				{
					draw_set_colour(c_white)
					var hover = point_in_rectangle(mouse_x,mouse_y,xx,yy+(i*y_deep),xx+x_wide,yy+(i*y_deep)+y_deep)
					if hover then { draw_set_alpha(0.5); hover=1 } else { draw_set_alpha(1); } //If mouse detcted, set alpha + hover
					if hover && mouse_check_button_pressed(mb_left) then
					{

							if i = 0 then  stim_edit += 1
							if i = 1 then  stim_edit += 10
							total_effect = psych_edit + stim_edit + diss_edit
							other_effect = psych_edit + diss_edit
							if total_effect > 100 then stim_edit = 100-other_effect //if total is greater than 100
							if stim_edit < 0 then stim_edit = 0 //if less than zero set to zero
							total_effect = psych_edit + stim_edit + diss_edit
					}
					draw_rectangle(xx,yy+(i*y_deep),xx+x_wide,yy+(i*y_deep)+y_deep,0)
					draw_set_alpha(1) //reset colour + alpha
					draw_set_colour(c_black)
					if i = 0 then  draw_text_transformed(xx,yy+(i*y_deep),string("+1"),1,1,0) //draw name of drug	
					if i = 1 then  draw_text_transformed(xx,yy+(i*y_deep),string("+10"),1,1,0) //draw name of drug	
					draw_rectangle(xx,yy+(i*y_deep),xx+x_wide,yy+(i*y_deep)+y_deep,1) //draw outline box
				}
				var xx = xx+x_wide
				//Write minus side!!
				for(var i=0; i<2; i += 1) //create list
				{
					draw_set_colour(c_white)
					var hover = point_in_rectangle(mouse_x,mouse_y,xx,yy+(i*y_deep),xx+x_wide,yy+(i*y_deep)+y_deep)
					if hover then { draw_set_alpha(0.5); hover=1 } else { draw_set_alpha(1); } //If mouse detcted, set alpha + hover
					if hover && mouse_check_button_pressed(mb_left) then
					{

							if i = 0 then  stim_edit -= 1
							if i = 1 then  stim_edit -= 10		
							total_effect = psych_edit + stim_edit + diss_edit
							other_effect = psych_edit + diss_edit
							if total_effect > 100 then stim_edit = 100-other_effect //if total is greater than 100
							if stim_edit < 0 then stim_edit = 0 //if less than zero set to zero
							total_effect = psych_edit + stim_edit + diss_edit
					}
					draw_rectangle(xx,yy+(i*y_deep),xx+x_wide,yy+(i*y_deep)+y_deep,0)
					draw_set_alpha(1) //reset colour + alpha
					draw_set_colour(c_black)
					if i = 0 then  draw_text_transformed(xx,yy+(i*y_deep),string("-1"),1,1,0) //draw name of drug	
					if i = 1 then  draw_text_transformed(xx,yy+(i*y_deep),string("-10"),1,1,0) //draw name of drug	
					draw_rectangle(xx,yy+(i*y_deep),xx+x_wide,yy+(i*y_deep)+y_deep,1) //draw outline box
				}
				
				
				
			}
			
				//DISS BUTTONS
	
		var x_wide = (global.menu_width/2)-(mar*1) //size
		var xx = global.minis_x+(room_height/30)+(x_wide*8)
		var y_deep = (room_height/30) 
		var yy = global.minis_y+(y_deep*6)
		var x_wide = ((mar*10)) //size	
		draw_set_colour(c_white)
		draw_set_alpha(1) //reset colour + alpha
		draw_rectangle(xx,yy,xx+x_wide,yy+y_deep,0)
		draw_text(xx,yy-y_deep,string("Dissociating (%)"))	
		draw_set_colour(c_black)		
		if !editing //if not editing then set file name as text
			{
				draw_text(xx,yy,string(diss))	
			}
		else
			{	//CREATE PLUS SIDE
				
				draw_text(xx,yy,string(diss_edit))
				var x_wide = (global.menu_width/2)-(mar*1) //size
				var yy = global.minis_y+((room_height/30)*7.5)			
				var y_deep = room_height/15
				
				
				for(var i=0; i<2; i += 1) //create list
				{
					draw_set_colour(c_white)
					var hover = point_in_rectangle(mouse_x,mouse_y,xx,yy+(i*y_deep),xx+x_wide,yy+(i*y_deep)+y_deep)
					if hover then { draw_set_alpha(0.5); hover=1 } else { draw_set_alpha(1); } //If mouse detcted, set alpha + hover
					if hover && mouse_check_button_pressed(mb_left) then
					{

							if i = 0 then  diss_edit += 1
							if i = 1 then  diss_edit += 10
							total_effect = psych_edit + stim_edit + diss_edit
							other_effect = psych_edit + stim_edit
							if total_effect > 100 then diss_edit = 100-other_effect //if total is greater than 100
							if diss_edit < 0 then diss_edit = 0 //if less than zero set to zero
							total_effect = psych_edit + stim_edit + diss_edit
					}
					draw_rectangle(xx,yy+(i*y_deep),xx+x_wide,yy+(i*y_deep)+y_deep,0)
					draw_set_alpha(1) //reset colour + alpha
					draw_set_colour(c_black)
					if i = 0 then  draw_text_transformed(xx,yy+(i*y_deep),string("+1"),1,1,0) //draw name of drug	
					if i = 1 then  draw_text_transformed(xx,yy+(i*y_deep),string("+10"),1,1,0) //draw name of drug	
					draw_rectangle(xx,yy+(i*y_deep),xx+x_wide,yy+(i*y_deep)+y_deep,1) //draw outline box
				}
				var xx = xx+x_wide
				//Write minus side!!
				for(var i=0; i<2; i += 1) //create list
				{
					draw_set_colour(c_white)
					var hover = point_in_rectangle(mouse_x,mouse_y,xx,yy+(i*y_deep),xx+x_wide,yy+(i*y_deep)+y_deep)
					if hover then { draw_set_alpha(0.5); hover=1 } else { draw_set_alpha(1); } //If mouse detcted, set alpha + hover
					if hover && mouse_check_button_pressed(mb_left) then
					{

							if i = 0 then  diss_edit -= 1
							if i = 1 then  diss_edit -= 10		
							total_effect = psych_edit + stim_edit + diss_edit
							other_effect = psych_edit + stim_edit
							if total_effect > 100 then diss_edit = 100-other_effect //if total is greater than 100
							if diss_edit < 0 then diss_edit = 0 //if less than zero set to zero
							total_effect = psych_edit + stim_edit + diss_edit
					}
					draw_rectangle(xx,yy+(i*y_deep),xx+x_wide,yy+(i*y_deep)+y_deep,0)
					draw_set_alpha(1) //reset colour + alpha
					draw_set_colour(c_black)
					if i = 0 then  draw_text_transformed(xx,yy+(i*y_deep),string("-1"),1,1,0) //draw name of drug	
					if i = 1 then  draw_text_transformed(xx,yy+(i*y_deep),string("-10"),1,1,0) //draw name of drug	
					draw_rectangle(xx,yy+(i*y_deep),xx+x_wide,yy+(i*y_deep)+y_deep,1) //draw outline box
				}
				
				
				
			}
	
		//list hour numbers
		var gm = global.margin
		var sx = global.startx-(global.startx/5)
		var sy = global.starty
		var hz = global.h_zero
		var sz = global.gridsize
		draw_set_colour(c_grey)
		for(var i=0; i<24; i +=1) //draw numbers on axis
				{
					draw_text((sz*global.gridsx/24)*(i+0.55)+sx,global.minis_y+(mar/2),string(i))
					//draw_line_width()
				}
		//list stat numbers	
		var gm = global.margin
		var sx = global.startx-(global.startx/5)
		var sy = global.starty
		var hz = global.h_zero
		var sz = global.gridsize
		draw_set_colour(c_white)

		
		for(var i=0; i<24; i +=1) //draw numbers on axis
				{
					draw_text((sz*global.gridsx/24)*(i+0.55)+sx,global.minis_y-(mar*3.2),string(edit_stats[i]))
				}		
				
			
		//COLOUR BOXES
		
			var y_deep = (room_height/30) 
			var x_wide = ((mar*12)) //size	
			var xx = global.minis_x+y_deep+(x_wide*2.6)
			var yy = global.minis_y+(y_deep*3)
			if editing = 0  //if editing then let colour equal the current read one
				{
					scr_colour_edit(colour)
					current_colour =make_color_rgb(r_ed,g_ed,bl_ed)			
				}
			else //otherwise let the colour equal the chosen one
				{
					scr_colour_edit(chosen_colour)
					current_colour =make_color_rgb(r_ed,g_ed,bl_ed)		
				}
			draw_set_color(current_colour) 
			draw_rectangle(xx,yy,xx+x_wide,yy+y_deep,0)
			draw_set_color(c_white)
			draw_text(xx,yy-y_deep,"COLOUR")

		if editing 
		{
			var y_deep = (room_height/30) 
			var x_wide = ((mar*2)) //size	
			var xx = global.minis_x+y_deep+(mar*42)
			var yy = global.minis_y+(y_deep*3)	
			
			for(var i=1; i<12; i += 1) //create list
				{
					
					var hover = point_in_rectangle(mouse_x,mouse_y,xx+(i*x_wide),yy,xx+x_wide+(x_wide*i),yy+y_deep)
					if hover then { draw_set_alpha(0.5); hover=1 } else { draw_set_alpha(1);} //If mouse detcted, set alpha + hover
					if hover && mouse_check_button_pressed(mb_left) then
					{
					 chosen_colour = i
					}
					scr_colour_edit(i)
					c_editing =make_color_rgb(r_ed,g_ed,bl_ed)
					draw_set_colour(c_editing)
					draw_rectangle(xx+(i*x_wide),yy,xx+x_wide+(x_wide*i),yy+y_deep,0)
					draw_set_alpha(1) //reset colour + alpha
					draw_set_colour(c_black)
					draw_rectangle(xx+(i*x_wide),yy,xx+x_wide+(x_wide*i),yy+y_deep,1) //draw outline box
				}

		}
		
		//UNIT BUTTONS
		
				//COLOUR BOXES
		
			var y_deep = (room_height/30) 
			var x_wide = ((mar*4)) //size	
			var xx = global.minis_x+y_deep+(x_wide*3.5)
			var yy = global.minis_y+(y_deep*3)
			draw_set_color(c_white)
			draw_set_color(c_white)
			draw_text(xx+(x_wide*1.2),yy-y_deep,"UNIT")
			

							for(var i=1; i<4; i += 1) //create list
				{
					if editing then
					{
						var hover = point_in_rectangle(mouse_x,mouse_y,xx+(i*x_wide),yy,xx+x_wide+(x_wide*i),yy+y_deep)
						if hover then { draw_set_alpha(0.5); hover=1 } else { draw_set_alpha(1);} //If mouse detcted, set alpha + hover
						if hover && mouse_check_button_pressed(mb_left) then
						{
						 if i = 1 then { unit_edit = 1 }
						 if i = 2 then { unit_edit = 2 }
						 if i = 3 then { unit_edit = 3 }
						}

					}
					if unit_edit = i then 
						{
							draw_set_alpha(0.5)
						}
					else
						{
							draw_set_alpha(1)
						}
					draw_set_color(c_white)
					draw_rectangle(xx+(i*x_wide),yy,xx+x_wide+(x_wide*i),yy+y_deep,0)
					draw_set_alpha(1)
					draw_set_colour(c_black)
					
					 if i = 1 then
						{ 
							 draw_text(xx+(i*x_wide)+(x_wide*0.2),yy,"mg")
						 }
					 if i = 2 then 
						{
							 draw_text(xx+(i*x_wide)+(x_wide*0.2),yy,"ug") 			 
						}
					 if i = 3 then
						 {
							 draw_text(xx+(i*x_wide)+(x_wide*0.2),yy,"g")
						 }
					
					draw_rectangle(xx+(i*x_wide),yy,xx+x_wide+(x_wide*i),yy+y_deep,1) //draw outline box
				}
			

	
		//Up and down edit stat buttons	
		if editing then 
		
		{
			
			//DRAW LOWER BUTTONS
		var xx = (sz*global.gridsx/24)
		var yy = global.minis_y-(mar*1.5)
		var x_wide = ((mar*2.63)) //size
		var y_deep = (room_height/45) 
	
		for(var i=1; i<24; i +=1) 
				{
		draw_set_colour(c_white)
		var hover = point_in_rectangle(mouse_x,mouse_y,xx+(x_wide*i)+(px_mar*i),yy,xx+x_wide+(x_wide*i)+(px_mar*i),yy+y_deep)
		if hover then { draw_set_alpha(0.5); hover=1 } else { draw_set_alpha(1); } //If mouse detcted, set alpha + hover
		if hover && mouse_check_button_pressed(mb_left) then { if edit_stats[i] > 0 then edit_stats[i] -= 0.5 } //if clicked then tell variable
		draw_rectangle(xx+(x_wide*i)+(px_mar*i),yy,xx+x_wide+(x_wide*i)+(px_mar*i),yy+y_deep,0)
		draw_set_alpha(1) //reset colour + alpha	
		draw_set_font(fnt_large);
		draw_set_colour(c_black)
		//draw_set_colour(c_white)
		draw_text_transformed(xx+(x_wide*i)+(px_mar*i)+(x_wide*0.8),yy+y_deep,string("^^"),1,1,180)	
		draw_set_font(fnt_default);
				}
			
			// DRAW UPPER BUTTONS
		var xx = (sz*global.gridsx/24)
		var yy = global.minis_y-(mar*5.1)
		var x_wide = ((mar*2.63)) //size
		var y_deep = (room_height/45) 
	
		for(var i=1; i<24; i +=1) //draw lower buttons
				{
		draw_set_colour(c_white)
		var hover = point_in_rectangle(mouse_x,mouse_y,xx+(x_wide*i)+(px_mar*i),yy,xx+x_wide+(x_wide*i)+(px_mar*i),yy+y_deep)
		if hover then { draw_set_alpha(0.5); hover=1 } else { draw_set_alpha(1); } //If mouse detcted, set alpha + hover
		if hover && mouse_check_button_pressed(mb_left) then { if edit_stats[i] < 8 then edit_stats[i] += 0.5 } //if clicked then tell variable
		draw_rectangle(xx+(x_wide*i)+(px_mar*i),yy,xx+x_wide+(x_wide*i)+(px_mar*i),yy+y_deep,0)
		draw_set_alpha(1) //reset colour + alpha	
		draw_set_font(fnt_large);
		draw_set_colour(c_black)
		//draw_set_colour(c_white)
		draw_text_transformed(xx+(x_wide*i)+(px_mar*i)+(x_wide*0.2),yy,string("^^"),1,1,0)	
		draw_set_font(fnt_default);
				}
		
		}
	
	
}


}

if global.edit = 0 then

{
	
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
	
}

if global.clear = 1 //RESET INSTANCES
	
		{
			instance_destroy(obj_drug)
			//global.select = 1
			inst = scr_drug(global.drugs_max,0,0,1,0)
			global.clear = 0
			alarm[1] = 2 //recalculate select			
			scr_save(global.preset)
		}
		
if global.edit = 0 then

{
		
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

//LINE BUTTON

var xx = mar*18
var yy = mar*1
var x_wide = ((mar*3)) //size
var y_deep = (room_height/40) 

draw_set_colour(c_white)
var hover = point_in_rectangle(mouse_x,mouse_y,xx,yy,xx+x_wide,yy+y_deep)
if hover then { draw_set_alpha(0.5); hover=1 } else { draw_set_alpha(1); } //If mouse detcted, set alpha + hover
if hover && mouse_check_button_pressed(mb_left) then {alarm[2] = 2 ; global.select = 1; if global.lines = 0 then global.lines = 1 else global.lines = 0 } //if clicked then tell variable
if global.lines then { draw_set_alpha(0.5) }
draw_rectangle(xx,yy,xx+x_wide,yy+y_deep,0)
draw_set_alpha(1) //reset colour + alpha
draw_set_colour(c_black)
draw_text(xx,yy,string("LINES"))


//INDICATOR BUTTON

var xx = mar*21.5
var yy = mar*1
var x_wide = ((mar*5)) //size
var y_deep = (room_height/40) 

draw_set_colour(c_white)
var hover = point_in_rectangle(mouse_x,mouse_y,xx,yy,xx+x_wide,yy+y_deep)
if hover then { draw_set_alpha(0.5); hover=1 } else { draw_set_alpha(1); } //If mouse detcted, set alpha + hover
if hover && mouse_check_button_pressed(mb_left) then {if global.indicator = 0 then global.indicator = 1 else global.indicator = 0 } //if clicked then tell variable
if global.indicator then { draw_set_alpha(0.5) }
draw_rectangle(xx,yy,xx+x_wide,yy+y_deep,0)
draw_set_alpha(1) //reset colour + alpha
draw_set_colour(c_black)
draw_text(xx,yy,string("INDICATOR"))


		//help button
		
var xx = mar*27
var yy = mar*1
var x_wide = ((mar*3)) //size
var y_deep = (room_height/40) 

	draw_set_colour(c_white)
	var hover = point_in_rectangle(mouse_x,mouse_y,xx,yy,xx+x_wide,yy+y_deep)
	if hover then { draw_set_alpha(0.5); hover=1 } else { draw_set_alpha(1); } //If mouse detcted, set alpha + hover
	if hover && mouse_check_button_pressed(mb_left) then 
		{
		url_open("https://github.com/Brillmedal/DGCalc2-GIT/blob/main/README.md")  //if clicked then tell variable}
		}
	draw_rectangle(xx,yy,xx+x_wide,yy+y_deep,0)
	draw_set_alpha(1) //reset colour + alpha
	draw_set_colour(c_black)
	draw_text(xx+2,yy,"HELP")

//DISPLAY BOX

var xx = (room_width-global.menu_width)-(mar*16)
var yy = mar*1
var x_wide = (mar*16) //size
var y_deep = room_height/40

draw_set_colour(c_white)
draw_rectangle(xx,yy,xx+x_wide,yy+y_deep,0)
draw_set_alpha(1) //reset colour + alpha
draw_set_colour(c_black)
var unt = global.unit //read unit vals
if unt = 1 {unt = "mg"}
if unt = 2 {unt = "ug"}
if unt = 3 {unt = "g"}
var hr_remain = (frac(global.hour)/0.25)*15 //remainder of the hour in  minutes
var hr_floor = floor(global.hour) //the full hour integer
if global.hour+global.h_zero < 24 then
	{ //draw schedule stats before 24hrs
		if hr_remain = 0 then draw_text_transformed(xx,yy,string(current) + " "+ string(global.dosage) + string(unt) + " " + string(hr_floor+global.h_zero) + ":00",1,1,0)
		else
			{	draw_text_transformed(xx,yy,string(current) + " "+ string(global.dosage) + + string(unt) + " " + string(hr_floor+global.h_zero) + ":" + string(hr_remain),1,1,0)	}
	}

else  //draw schedule after 24hrs
	{ //draw schedule stats before 24hrs
		if hr_remain = 0 then draw_text_transformed(xx,yy,string(current) + " "+ string(global.dosage) + string(unt) + " " + string(hr_floor+global.h_zero-24) + ":00",1,1,0)
		else
			{	draw_text_transformed(xx,yy,string(current) + " "+ string(global.dosage) + + string(unt) + " " + string(hr_floor+global.h_zero-24) + ":" + string(hr_remain),1,1,0)	}
	}

}

if global.page = 1

{
	//ENTER BUTTON
	
	
	
	var xx = (room_width-global.menu_width)+mar
	var yy = room_height-(global.bar_depth*2) 
	var x_wide = ((global.menu_width-(mar*2))) //size
	var y_deep = room_height/20
	draw_set_colour(c_white)
	var hover = point_in_rectangle(mouse_x,mouse_y,xx,yy+(y_deep),xx+x_wide,yy+(y_deep)+y_deep)
	if hover then { draw_set_alpha(0.5); hover=1 } else { draw_set_alpha(1); } //If mouse detcted, set alpha + hover
	if hover && mouse_check_button_pressed(mb_left) then	{ global.enter = 1; if (global.count < max_list-1) then obj_drug.written = 1 } //if clicked then tell variable
	draw_rectangle(xx,yy+(y_deep),xx+x_wide,yy+(y_deep)+y_deep,0)
	draw_set_alpha(1) //reset colour + alpha
	draw_set_colour(c_black)
	draw_text_transformed(xx+2,yy+(y_deep),"ENTER",1,1,0) //draw base dosage of drug	
	
	
	//DRAW PLUS DOSAGE
	
	var x_wide = (global.menu_width/2)-(mar*1) //size
	var y_deep = room_height/15
	var xx = (room_width-global.menu_width)+mar //starting position of selection boxes
	var yy = global.bar_depth + (y_deep*1)
	
	draw_set_color(c_white)
	draw_text(xx,yy-y_deep, "DOSAGE")
	
	for(var i=0; i<3; i += 1) //create list
	{
		draw_set_colour(c_white)
		var hover = point_in_rectangle(mouse_x,mouse_y,xx,yy+(i*y_deep),xx+x_wide,yy+(i*y_deep)+y_deep)
		if hover then { draw_set_alpha(0.5); hover=1 } else { draw_set_alpha(1); } //If mouse detcted, set alpha + hover
		if hover && mouse_check_button_pressed(mb_left) then
		{
			if global.unit = 3
			{
				if i = 0 then  global.dosage += 0.01
				if i = 1 then  global.dosage += 0.1
				if i = 2 then  global.dosage += 1
			}
			else
			{
				if i = 0 then  global.dosage += 1
				if i = 1 then  global.dosage += 10
				if i = 2 then  global.dosage += 100
			}
			
			if global.dosage > 1000 {global.dosage = 1000}
			if global.dosage < 0 {global.dosage = 0}

		global.select = 1
		} //if clicked then tell variable
		draw_rectangle(xx,yy+(i*y_deep),xx+x_wide,yy+(i*y_deep)+y_deep,0)
		draw_set_alpha(1) //reset colour + alpha
		draw_set_colour(c_black)
		if global.unit = 3
		{
			if i = 0 then  draw_text_transformed(xx,yy+(i*y_deep),string("+0.01"),1,1,0) //draw name of drug	
			if i = 1 then  draw_text_transformed(xx,yy+(i*y_deep),string("+0.1"),1,1,0) //draw name of drug	
			if i = 2 then  draw_text_transformed(xx,yy+(i*y_deep),string("+1"),1,1,0) //draw name of drug	
		}
		else
		{
			if i = 0 then  draw_text_transformed(xx,yy+(i*y_deep),string("+1"),1,1,0) //draw name of drug	
			if i = 1 then  draw_text_transformed(xx,yy+(i*y_deep),string("+10"),1,1,0) //draw name of drug	
			if i = 2 then  draw_text_transformed(xx,yy+(i*y_deep),string("+100"),1,1,0) //draw name of drug
		}
		draw_rectangle(xx,yy+(i*y_deep),xx+x_wide,yy+(i*y_deep)+y_deep,1) //draw outline box
	}
		

	//DRAW MINUS DOSAGE
	var xx = xx+x_wide //starting position of selection boxes
	var y_deep = room_height/15
	var yy = global.bar_depth + (y_deep*1)

	for(var i=0; i<3; i += 1) //create list
	{
		draw_set_colour(c_white)
		var hover = point_in_rectangle(mouse_x,mouse_y,xx,yy+(i*y_deep),xx+x_wide,yy+(i*y_deep)+y_deep)
		if hover then { draw_set_alpha(0.5); hover=1 } else { draw_set_alpha(1); } //If mouse detcted, set alpha + hover
		if hover && mouse_check_button_pressed(mb_left) then
		{
			if global.unit = 3
			{
				if i = 0 then  global.dosage -= 0.01
				if i = 1 then  global.dosage -= 0.1
				if i = 2 then  global.dosage -= 1
			}
			else
			{
				if i = 0 then  global.dosage -= 1
				if i = 1 then  global.dosage -= 10
				if i = 2 then  global.dosage -= 100
			}
		if global.dosage > 1000 {global.dosage = 1000}
		if global.dosage < 0 {global.dosage = 0}
		global.select = 1
		} //if clicked then tell variable
		draw_rectangle(xx,yy+(i*y_deep),xx+x_wide,yy+(i*y_deep)+y_deep,0)
		draw_set_alpha(1) //reset colour + alpha
		draw_set_colour(c_black)
		if global.unit = 3
		{
			if i = 0 then  draw_text_transformed(xx,yy+(i*y_deep),string("-0.01"),1,1,0) //draw name of drug	
			if i = 1 then  draw_text_transformed(xx,yy+(i*y_deep),string("-0.1"),1,1,0) //draw name of drug	
			if i = 2 then  draw_text_transformed(xx,yy+(i*y_deep),string("-1"),1,1,0) //draw name of drug
		}
		else
		{
		if i = 0 then  draw_text_transformed(xx,yy+(i*y_deep),string("-1"),1,1,0) //draw name of drug	
		if i = 1 then  draw_text_transformed(xx,yy+(i*y_deep),string("-10"),1,1,0) //draw name of drug	
		if i = 2 then  draw_text_transformed(xx,yy+(i*y_deep),string("-100"),1,1,0) //draw name of drug	
		}
		draw_rectangle(xx,yy+(i*y_deep),xx+x_wide,yy+(i*y_deep)+y_deep,1) //draw outline box
	} 



//DRAW HOURS LEFT
	var yy = global.bar_depth + (y_deep*5)
	var x_wide = (global.menu_width/2)-(mar*3) //size
	var y_deep = room_height/25
	var xx = (room_width-global.menu_width)+mar //starting position of selection boxes

draw_set_color(c_white)
draw_text(xx,yy-(y_deep/1.2), "TIME")
	
	for(var i=0; i<12; i += 1) //create list
	{
		draw_set_colour(c_white)
		var hover = point_in_rectangle(mouse_x,mouse_y,xx,yy+(i*y_deep),xx+x_wide,yy+(i*y_deep)+y_deep)
		if hover then { draw_set_alpha(0.5); hover=1 } else { draw_set_alpha(1); } //If mouse detcted, set alpha + hover
		if hover && mouse_check_button_pressed(mb_left) then
		{		
		alarm[5] = 3
		var iz = i-global.h_zero //calc what to set hour to based on zero
		if iz < 0 then { iz += 24 }
		global.hour=iz
		//show_message(iz)
		} //if clicked then tell variable
		if i = floor(global.hour)+global.h_zero then { draw_set_alpha(0.5) }
		if i+24 = floor(global.hour)+global.h_zero then { draw_set_alpha(0.5) }
		draw_rectangle(xx,yy+(i*y_deep),xx+x_wide,yy+(i*y_deep)+y_deep,0)
		draw_set_alpha(1) //reset colour + alpha
		draw_set_colour(c_black)
		draw_text_transformed(xx,yy+(i*y_deep),(string(i)) + ":00",1,1,0) //draw hour text
		draw_rectangle(xx,yy+(i*y_deep),xx+x_wide,yy+(i*y_deep)+y_deep,1) //draw outline box
	}
	
//DRAW HOURS RIGHT
	var xx = (room_width-global.menu_width)+mar+x_wide+px_mar //starting position of selection boxes

	
	for(var i=0; i<12; i += 1) //create list
	{
		draw_set_colour(c_white)
		var hover = point_in_rectangle(mouse_x,mouse_y,xx,yy+(i*y_deep),xx+x_wide,yy+(i*y_deep)+y_deep)
		if hover then { draw_set_alpha(0.5); hover=1 } else { draw_set_alpha(1); } //If mouse detcted, set alpha + hover
		if hover && mouse_check_button_pressed(mb_left) then
		{		
		alarm[5] = 1
		var iz = (i-global.h_zero)+12 //calc what to set hour to based on zero
		if iz < 0 then { iz += 24 }
		global.hour=iz
		//show_message(iz)
		} //if clicked then tell variable
		if i+12 = floor(global.hour)+global.h_zero then { draw_set_alpha(0.5) }
		if i+36 = floor(global.hour)+global.h_zero then { draw_set_alpha(0.5) }
		draw_rectangle(xx,yy+(i*y_deep),xx+x_wide,yy+(i*y_deep)+y_deep,0)
		draw_set_alpha(1) //reset colour + alpha
		draw_set_colour(c_black)
		draw_text_transformed(xx,yy+(i*y_deep),(string(i+12)) + ":00",1,1,0) //draw hour text
		draw_rectangle(xx,yy+(i*y_deep),xx+x_wide,yy+(i*y_deep)+y_deep,1) //draw outline box
	}

	
	//Plus 15 min
	var xx = xx + x_wide + px_mar
	var yy = (yy-y_deep)+(px_mar/2)+y_deep
	var y_deep = (y_deep*6)-px_mar
	var x_wide = (global.menu_width/3)-(mar*1.5) //size
	draw_set_colour(c_white)
	var hover = point_in_rectangle(mouse_x,mouse_y,xx,yy,xx+x_wide,yy+y_deep)
	if hover then { draw_set_alpha(0.5); hover=1 } else { draw_set_alpha(1); } //If mouse detcted, set alpha + hover
	if hover && mouse_check_button_pressed(mb_left) then	{ if global.hour < 23.5 then { global.hour += 0.25 }; global.select = 1 } //if clicked then tell variable
	draw_rectangle(xx,yy,xx+x_wide,yy+y_deep,0)
	draw_set_alpha(1) //reset colour + alpha
	draw_set_colour(c_black)
	draw_text_transformed(xx+2,yy,"+15 MIN",1,1,0) //draw base dosage of drug	
	
	//Minus 15 min
	var yy = yy+y_deep +px_mar
	draw_set_colour(c_white)
	var hover = point_in_rectangle(mouse_x,mouse_y,xx,yy,xx+x_wide,yy+y_deep)
	if hover then { draw_set_alpha(0.5); hover=1 } else { draw_set_alpha(1); } //If mouse detcted, set alpha + hover
	if hover && mouse_check_button_pressed(mb_left) then	{ if global.hour > 0 then { global.hour -= 0.25 }; global.select = 1 } //if clicked then tell variable
	draw_rectangle(xx,yy,xx+x_wide,yy+y_deep,0)
	draw_set_alpha(1) //reset colour + alpha
	draw_set_colour(c_black)
	draw_text_transformed(xx+2,yy,"-15 MIN",1,1,0) //draw base dosage of drug	
	

	
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
	if global.edit = 0 then 
	{
		var hover = point_in_rectangle(mouse_x,mouse_y,xx,yy+(y_deep),xx+x_wide,yy+(y_deep)+y_deep)
		if hover then { draw_set_alpha(0.5); hover=1 } else { draw_set_alpha(1); } //If mouse detcted, set alpha + hover
		if hover && mouse_check_button_pressed(mb_left) then
			{
			global.dosage = b_d
			global.select = 1
			} //if clicked then tell variable
	}
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
						if global.edit = 0 then 
						{ draw_rectangle(xx+((gsizex*(ii-zmr))+gsd),(yy-(gs*i))-gsd,xx+(gsizex+(gsizex*(ii-zmr)))-gsd,yy-(gs*(i+1)),0) }
					}			
				
				//begin to draw small cells
				col = make_color_rgb(c1,c2,c3)
				draw_set_colour(col)
				
				if global.edit = 0 then 
				{
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
				if global.edit = 0 then
				{
				draw_set_colour(col)
				draw_set_alpha(a123)
				draw_rectangle(mx+(mgs*(ii-zmr2))+1,my-(mgsy*i)+1,mx+mgs+(mgs*(ii-zmr2)),my-(mgsy*(i+1)),0) //draw squares colours			
				draw_set_colour(c_grey)
				draw_set_alpha(0.4)					
				draw_set_alpha(1)
				}
			}
	}
	
//DRAW NUMBER AXIS

draw_set_color(c_white)
if global.hr24 = 1 //if AM_PM is on 24hr mode
	{
		var gm = global.margin
		var sx = global.startx-(global.startx/5)
		var sy = global.starty
		var hz = global.h_zero
		var sz = global.gridsize
		
		if global.edit = 0 then
		{
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
	}
else
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
						if global.edit = 0 then 
						{ draw_text((sz*global.gridsx/12)*(i-hz-zh)+sx,sy+(gm/2),string(i)) }
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
							if global.edit = 0 then
							{ draw_text((sz*global.gridsx/12)*(i-zh)+sx,sy+(gm/2),string(i-filled)) }
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
				if i = 0 then { scr_save(global.preset); global.preset = 1; scr_load(1); alarm[3] = 12 }
				if i = 1 then { scr_save(global.preset); global.preset = 2; scr_load(2); alarm[3] = 12 }
				if i = 2 then { scr_save(global.preset); global.preset = 3; scr_load(3); alarm[3] = 12 }
				if i = 3 then { scr_save(global.preset); global.preset = 4; scr_load(4); alarm[3] = 12 }
				if i = 4 then { scr_save(global.preset); global.preset = 5; scr_load(5); alarm[3] = 12 }
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
			scr_save(global.preset)
			break
			} 
		draw_rectangle(xx,yy+(i*y_deep),xx+x_wide,yy+(i*y_deep)+y_deep,0)
		draw_set_alpha(1) //reset colour + alpha
		draw_set_colour(c_black)
		draw_rectangle(xx,yy+(i*y_deep),xx+x_wide,yy+(i*y_deep)+y_deep,1) //draw outline box
		var hr = (list[# 1,global.written-i])+global.h_zero
		var hr_remain = (frac(hr)/0.25)*15 //remainder of the hour in  minutes
		var hr_floor = floor(hr) //the full hour integer
		if hr < 24 then
			{ //draw schedule stats before 24hrs
				draw_text_transformed(xx,yy+(i*y_deep),string(dr) + " " + string(list[# 2,global.written-i]) + string(unt) + " " + string(hr_floor) + ":" + string(hr_remain) ,1,1,0) //draw stats of drug
				if hr_remain = 0 then draw_text_transformed(xx,yy+(i*y_deep),string(dr) + " " + string(list[# 2,global.written-i]) + string(unt) + " " + string(hr_floor) + ":00" ,1,1,0) //draw stats of drug
			}
		else  //draw schedule after 24hrs
			{
				draw_text_transformed(xx,yy+(i*y_deep),string(dr) + " " + string(list[# 2,global.written-i]) + string(unt) + " " + string(hr_floor-24) + ":" + string(hr_remain) ,1,1,0) //draw stats of drug
				if hr_remain = 0 then draw_text_transformed(xx,yy+(i*y_deep),string(dr) + " " + string(list[# 2,global.written-i]) + string(unt) + " " + string(hr_floor-24) + ":00" ,1,1,0) //draw stats of drug
			}

	}
draw_set_color(c_white)
draw_text(xx,yy-(y_deep*1.5), "SCHEDULE")

}

if global.enter = 1
{
	if global.count < (max_list-1)
		{
			alarm[1] = 2 //recalculate totals
			inst = undefined;
			global.select = 1;
			global.drug = global.drugs_max;
			global.tolerance = 1; 
			scr_save(global.preset)
		}		
}


if global.select = 1 then //if selected a box
	{	
		alarm[2] = 3 //double trigger select
		var inst_prev = inst //set memory of instance
		if b_d = global.dosage then {same = 1} else {same = 0} //if bd is same as dosage now, tell this variable
		b_d = scr_read(global.drug,2) //read temp base dosage
		scr_stats()
		file_text_close(file); //close file to be read elsewhere
		if same then global.dosage = b_d
		inst = scr_drug(global.drug,global.dosage,global.hour,global.tolerance,0); //create drug with asked dosage}
		with (inst_prev) { instance_destroy(id) } //delete old one
		global.select = 0 //reset select
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
	
//disable peak extension level when alarm has expired
if alarm[0] = -1 { alarm[0] = 1 }

global.enter = 0

if loaded = 0 then { alarm[4] = 4; loaded = 1 }
	
	


//DRAW MENU BOXES
draw_set_color(c_grey)
draw_set_alpha(0.2)
draw_rectangle(room_width-global.menu_width,0,room_width,room_height,0) //DRAW SIDE MENU
draw_rectangle(0,0,room_width-(global.menu_width+1),global.bar_depth,0) //DRAW TOP MENU
draw_set_alpha(1)



draw_text(30,50,total_effect)
//draw_text(1200,420,global.extend)
//draw_text(1200,440,global.peaked)
//draw_text(32, 32, global.zoom_hr);
//draw_text(32, 65, global.hour);
