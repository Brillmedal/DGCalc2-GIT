function scr_calc()
{

//Read stats to array
psych = psych*global.m //value from 0-255
stim = stim*global.m
diss = diss*global.m
g = global.gridsx/24 //find how much to divide the stats into
m = (global.gridsy/10)*(dosage/b_dosage) //how much to multiply the height on plus multiply by dosage
stats = array_create(24*g,0)
stats[0] = min(global.gridsy,T0 * m)
stats[1*g] = min(global.gridsy,T1 * m)
stats[2*g] = min(global.gridsy,T2 * m)
stats[3*g] = min(global.gridsy,T3 * m)
stats[4*g] = min(global.gridsy,T4 * m)
stats[5*g] = min(global.gridsy,T5 * m)
stats[6*g] = min(global.gridsy,T6 * m)
stats[7*g] = min(global.gridsy,T7 * m)
stats[8*g] = min(global.gridsy,T8 * m)
stats[9*g] = min(global.gridsy,T9 * m)
stats[10*g] = min(global.gridsy,T10 * m)
stats[11*g] = min(global.gridsy,T11 * m)
stats[12*g] = min(global.gridsy,T12 * m)
stats[13*g] = min(global.gridsy,T13 * m)
stats[14*g] = min(global.gridsy,T14 * m)
stats[15*g] = min(global.gridsy,T15 * m)
stats[16*g] = min(global.gridsy,T16 * m)
stats[17*g] = min(global.gridsy,T17 * m)
stats[18*g] = min(global.gridsy,T18 * m)
stats[19*g] = min(global.gridsy,T19 * m)
stats[20*g] = min(global.gridsy,T20 * m)
stats[21*g] = min(global.gridsy,T21 * m)
stats[22*g] = min(global.gridsy,T22 * m)
stats[23*g] = min(global.gridsy,T23 * m)

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