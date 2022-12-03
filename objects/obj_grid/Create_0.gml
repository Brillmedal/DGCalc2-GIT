scr_grid() //init grid stats


//CREATE VISUAL GRID/COORDS
global.ds_grid = ds_grid_create(global.gridsx,global.gridsy) //create ds grid
ds = global.ds_grid //refer to grid


scr_drug(1,100,0,0,0)
scr_drug(1,50,3,0,0)
//scr_drug(2,100,8,0,0)
scr_drug(2,50,10,0,0)

for(var ii=0; ii<global.gridsx; ii += 1) //assign arrays along X axis
	{		
		for(var i=0; i<global.gridsy; i += 1) //asign arrays along y axis
			{ ds[# ii,i] = array_create(7,0) }
	}

scr_sum() //calculate totals
base = global.base //shorten for reference
AM_PM = 0 //set time to 24hr