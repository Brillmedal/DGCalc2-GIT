	//disable peak extension level
if global.peaked < global.gridsx*global.peak_percentage//if less than 35% of chart is peaked
	{
			global.extend = 0
		//	global.select = 1
	}