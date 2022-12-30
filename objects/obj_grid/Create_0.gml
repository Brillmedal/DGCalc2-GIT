scr_grid() //init grid stats


//CREATE VISUAL GRID/COORDS
global.ds_grid = ds_grid_create(global.gridsx,global.gridsy) //create ds grid
ds = global.ds_grid //refer to grid

global.list = ds_grid_create(6,21) //create actual drugs list
ds_grid_clear(global.list,-1) //clear grid to -1
list = global.list //refer to list



scr_drug(1,100,0,0,1)
scr_drug(1,50,3,0,1)
scr_drug(2,50,10,0,1)

for(var ii=0; ii<global.gridsx; ii += 1) //assign arrays along X axis
	{		
		for(var i=0; i<global.gridsy; i += 1) //asign arrays along y axis
			{ ds[# ii,i] = array_create(7,0) }
	}

draw_set_font(fnt_default);
scr_sum() //calculate totals
base = global.base //shorten for reference
AM_PM = 0 //set time to 24hr
b_d = scr_read(global.drug,2) //read temp base dosage
inst = scr_drug(1,b_d,0,1,0); //create drug
max_list = global.max_list //max number of drugs on list
init = 0