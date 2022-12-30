g = global.gridsx/24 //find how much to divide the stats into
var hr = hour*g //set local var to be changed
t = 0

if null = 0
{
for(var ii=0; ii<(global.gridsx-(hour*g)); ii += 1) //run as many times 
	{
		mem = round(stats[t]) //remember current stats of time
		for(var i=0; i<mem; i += 1) //loop upwards while less than stat value
			{	
				if global.effect = 1
					{
						c_array = ds[# hr,i] //read array
						c_array[3] -= psych //add colour values
						c_array[4] -= stim
						c_array[5] -= diss	
						c_array[6] -= 1		
					}
				else //if choose to display colours over effect
					{ 
								
								
						c_array = ds[# hr,i] //read array
						c_array[3] -= red //add colour values
						c_array[4] -= green
						c_array[5] -= blue	
						c_array[6] -= 1		
					}
					
			}
		t += 1 //move to next timeframe
		hr += 1 //move to next hour
	}
}
		//undo adjustment to global graphs
global.count -=1
if written
{
list[# 0,cel] = -1
list[# 1,cel] = -1
list[# 2,cel] = -1
list[# 3,cel] = -1
list[# 4,cel] = -1
global.written -= 1
}
//scr_sum() //recalculate totals