if done != 1 //if not done

	{	
		scr_read(drug) //run script to assign values
		file_text_close(file); //close file to be read elsewhere
		scr_calc() //run calculation for stats
		
		var hr = hour*g //set local var to be changed
		for(var ii=0; ii<(global.gridsx-(hour+1)); ii += 1) //run as many times 
			{
				mem = round(stats[t]) //remember current stats of time
				for(var i=0; i<mem; i += 1) //loop upwards while less than stat value
					{	
						if global.effect = 1
							{
								c_array = ds[# hr,i] //read array
								c_array[3] += psych //add colour values
								c_array[4] += stim
								c_array[5] += diss	
								c_array[6] += 1		
							}
						else //if choose to display colours over effect
							{ 
								
								
								c_array = ds[# hr,i] //read array
								c_array[3] += red //add colour values
								c_array[4] += green
								c_array[5] += blue	
								c_array[6] += 1		
							}
					
					}
				t += 1 //move to next timeframe
				hr += 1 //move to next hour
			}
		done = 1
		alarm[0] = 2 //recalculate totals
	}
	
	//if enter and count is less than max list then allow to write
if global.enter && (global.count < max_list-1)  then written = 1
//if allowed to write and not already written then list in D.S
if written = 1 && done_b = 0
	{
		//begin to read Data structure
		//if cel not set
		//if list coords empty then set to current stats and tell object it has a cell
		for (var i=0 ; i < 21; i+=1)
		{if cel = -1 && list[# 0,i] = -1 then { list[# 0,i] = drug; list[# 1,i] = hour; list[# 2,i] = dosage; list[# 3,i] = tolerance; list[# 4,i] = id; list[# 5,i] = unit; cel = i;} }
		global.written += 1
		done_b = 1
		alarm[0] = 2 //recalculate totals
	}
	