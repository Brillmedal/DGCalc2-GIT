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