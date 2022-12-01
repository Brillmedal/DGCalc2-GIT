scr_grid() //init grid stats
scr_globals() //init globals


//CREATE VISUAL GRID/COORDS
global.ds_grid = ds_grid_create(global.gridsx,global.gridsy) //create ds grid
//global.mini_ds_grid = ds_grid_create(global.minig_x,global.minig_y) //create minigrid
ds = global.ds_grid //refer to grid
//mini_ds = global.mini_ds_grid


for(var ii=0; ii<global.gridsx; ii += 1) //assign arrays along X axis
	{		
		for(var i=0; i<global.gridsy; i += 1) //asign arrays along y axis
			{ ds[# ii,i] = array_create(7,0) }
	}
//for(var ii=0; ii<global.minig_x; ii += 1) //assign arrays along X axis
//	{		
//		for(var i=0; i<global.minig_y; i += 1) //asign arrays along y axis
//			{ mini_ds[# ii,i] = array_create(7,0) }
//	}
scr_sum()	
base = global.base