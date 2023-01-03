if global.indicator

{

d = 6 //diameter of line
var height = y-(global.gridsy*global.gridsize)
draw_set_alpha(1)
draw_set_color(c_white)
draw_line_width(x,y,x,height,d)

if point_in_rectangle(mouse_x,mouse_y,x-d,height,x+d,y) && obj_start.lock = 0 then
	{
		draw_rectangle(x-d,y,x+d,height,0);
		if mouse_check_button_pressed(mb_left)
			 {
				lock = 1
			 }
	}
 
  if lock = 1
 {
	 draw_rectangle(x-d,y,x+d,height,0)
	 if (x > global.startx)
	  {x = mouse_x} 
 }
 
 if x < global.startx+5 then x = global.startx+10
 if x > global.startx + (global.gridsize*global.gridsx)-5 then x = global.startx + (global.gridsize*global.gridsx)-10
 
if mouse_check_button_released(mb_left) {lock = 0}

if x < obj_start.x+20 then x = obj_start.x+25


}