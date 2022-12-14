function scr_sum()

{
	
global.peaked = 0 //reset peaked
	
for(var ii=0; ii<global.gridsx; ii += 1) //fill totals along X axis
	{		
		var sum_0 = 0
		var sum_1 = 0
		var sum_2 = 0
		var sum_3 = 0
		var sum_4 = 0
		var sum_5 = 0
		var sum_6 = 0
		var sum_7 = 0
		sum[ii][7] = sum_7
		pc = global.synergy

		
		for(var i=0; i<global.gridsy; i += 1) //fill totals along y axis
			{	
				col_array = ds[# ii,i]
				sum_0 += col_array[0] //R
				sum_1 += col_array[1] //G
				sum_2 += col_array[2] //B
				sum_3 += col_array[3] //Psych
				sum_4 += col_array[4] //Stim
				sum_5 += col_array[5] //Diss
				sum_6 += col_array[6] //cell Count
				if col_array[6] > sum[ii][7] then sum[ii][7] = col_array[6] //if cell count is larger than sum 7 saved then replace				
				sum[ii][0] = sum_0
				sum[ii][1] = sum_1
				sum[ii][2] = sum_2
				sum[ii][3] = sum_3
				sum[ii][4] = sum_4
				sum[ii][5] = sum_5
				sum[ii][6] = sum_6-(sum_6*pc*sum[ii][7]) //subtract 5% for every drug on the timeframe
				if sum[ii][6] > (global.gridsy*global.peak_height) //if number is greater than 90% of chart
				{
					global.peaked += 1
				}
			}
	}
	if global.peaked > global.gridsx*global.peak_percentage//if greater than 35% of chart is peaked
		{
			global.extend = 1
		}
	else
		{
			global.extend = 0
		}
}