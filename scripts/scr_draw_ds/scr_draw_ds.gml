function scr_draw_ds(){
//-----------------------
///@description Draws the data of a given grid at a screen location.
///@param grid name
///@param x coordinate to start grid
///@param y coordinate to start grid

// ds_grid_draw(grid,x,y)
//      grid        grid data structure, id
//      x,y         screen position, real

var grid	= argument0;
var sx		= argument1;
var sy		= argument2;
var i		= 0;
var j		= 0;
var value	= 0;
var w		= ds_grid_width(grid);
var h		= ds_grid_height(grid);

// Modify these two variables for width of column and height of row.
var wbuffer	= 100;
var hbuffer	= 25;

for (i = 0; i < w; i++){
    for (j = 0; j < h; j++){
        value = ds_grid_get(grid, i, j);
        draw_point_color(sx + i * wbuffer, sy + j * hbuffer, c_red);
		draw_rectangle(
			sx + i * wbuffer,
			sy + j * hbuffer,
			sx + i * wbuffer + wbuffer,
			sy + j * hbuffer + hbuffer,
			true);
		draw_text(sx + i * wbuffer, sy + j * hbuffer, value);
    };
};

return 0;
}
