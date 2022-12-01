scr_grid() //init grid stats


//CREATE VISUAL GRID/COORDS
global.ds_grid = ds_grid_create(global.gridsx,global.gridsy) //create ds grid
ds = global.ds_grid //refer to grid


scr_drug(0,100,0,0,0)
scr_drug(0,50,3,0,0)
scr_drug(0,30,8,0,0)

for(var ii=0; ii<global.gridsx; ii += 1) //assign arrays along X axis
	{		
		for(var i=0; i<global.gridsy; i += 1) //asign arrays along y axis
			{ ds[# ii,i] = array_create(7,0) }
	}

scr_sum()	
base = global.base