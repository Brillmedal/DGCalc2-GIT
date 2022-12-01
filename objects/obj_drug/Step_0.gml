if done != 1 //if not done

	{	
		var hr = hour*g //set local var to be changed
		for(var ii=0; ii<(global.gridsx-(hour+1)); ii += 1) //run as many times 
		{
			mem = round(stats[t]) //remember current stats of time
			for(var i=0; i<mem; i += 1) //loop upwards while less than stat value
				{			
					c_array = ds[# hr,i] //read array
					c_array[3] += psych //add colour values
					c_array[4] += stim
					c_array[5] += diss	
					c_array[6] += 1			
					
				}
			t += 1 //move to next timeframe
			hr += 1 //move to next hour
		}
		done = 1
	}