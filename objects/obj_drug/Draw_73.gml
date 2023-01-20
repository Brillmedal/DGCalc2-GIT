if global.edit = 0

{

	if done = 1 && global.lines

	{

	if global.hr24 then gsizex = global.gridsize else gsizex = global.gridsize*2

	draw_set_color(line_c)
	for(var ii=0; ii<(global.gridsx-(hour*g)); ii += 1) //run as many times 
		{
			if stats[ii] > 0 then
				{ //check through stats per hour and draw lines between current and next spot
					if global.hr24
					then
						{
									draw_line_width(((hour*g)*gsizex)+(gsizex*ii)+global.startx,global.starty-(stats[ii]*global.gridsize),(((hour+1)*g)*gsizex)+(gsizex*(ii-3))+global.startx,global.starty-(stats[ii+1]*global.gridsize),3)
						}
					else
						{ //check if needs to be drawn on zoom
							if ii > -1
								{
									var zhr = global.zoom_hr*4
									if (ii-zhr)+(hour*g) > -1
										{
											if (ii-zhr)+(hour*g) < global.gridsx/2
												{
													draw_line_width((((hour*g)*gsizex)+((gsizex)*(ii-zhr))+global.startx),global.starty-(stats[ii]*global.gridsize),(((hour+1)*g)*gsizex)+(gsizex*((ii-3)-zhr))+global.startx,global.starty-(stats[ii+1]*global.gridsize),3)
												}
									}
							}
						}
				}
	}
}

}