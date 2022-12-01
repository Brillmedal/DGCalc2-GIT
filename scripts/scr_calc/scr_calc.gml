function scr_calc()
{

//Read stats to array

g = global.gridsx/24 //find how much to divide the stats into
m = (global.gridsy/10)*(dosage/b_dosage) //how much to multiply the height on plus multiply by dosage
stats = array_create(24*g,0)
stats[0] = min(global.gridsy,t_0 * m)
stats[1*g] = min(global.gridsy,t_1 * m)
stats[2*g] = min(global.gridsy,t_2 * m)
stats[3*g] = min(global.gridsy,t_3 * m)
stats[4*g] = min(global.gridsy,t_4 * m)
stats[5*g] = min(global.gridsy,t_5 * m)
stats[6*g] = min(global.gridsy,t_6 * m)
stats[7*g] = min(global.gridsy,t_7 * m)
stats[8*g] = min(global.gridsy,t_8 * m)
stats[9*g] = min(global.gridsy,t_9 * m)
stats[10*g] = min(global.gridsy,t_10 * m)
stats[11*g] = min(global.gridsy,t_11 * m)
stats[12*g] = min(global.gridsy,t_12 * m)
stats[13*g] = min(global.gridsy,t_13 * m)
stats[14*g] = min(global.gridsy,t_14 * m)
stats[15*g] = min(global.gridsy,t_15 * m)
stats[16*g] = min(global.gridsy,t_16 * m)
stats[17*g] = min(global.gridsy,t_17 * m)
stats[18*g] = min(global.gridsy,t_18 * m)
stats[19*g] = min(global.gridsy,t_19 * m)
stats[20*g] = min(global.gridsy,t_20 * m)
stats[21*g] = min(global.gridsy,t_21 * m)
stats[22*g] = min(global.gridsy,t_22 * m)
stats[23*g] = min(global.gridsy,t_23 * m)

for(var i=0; i<23; i += 1)
{
	if g >= 2 //if divisible by 2
		{
			stats[(i*g)+(g/2)] = mean(stats[i*g],stats[(i*g)+g]) //set stats for array that is halfway between ones already set, to the average
		}
	if g >= 4 //if divisible by 4
		{
			stats[(i*g)+(g/4)] = mean(stats[i*g],stats[(i*g)+(g/2)])
			stats[(i*g)+(g/4)+(g/2)] = mean(stats[(i*g)+(g/2)],stats[(i*g)+g])
		}
}

}