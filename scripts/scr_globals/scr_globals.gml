function scr_globals()
{

//constants
global.m = 2.5 //multiplier to times drug colour percentages by
global.base = 400	//number to base 255 value on
global.mini_base = 255 //number to base mini grid 255value on
global.synergy = 0.08 //percentage to decrease per entry 
global.synergymax = 6 //how many max combos on synergy

global.drugs_max = 30
global.drug = global.drugs_max
global.dosage = 0
global.hour = 3
global.unit = 0
global.tolerance = 1
global.preset = 1
global.hr24 = 1 //set graph to 24hrs
global.h_zero = 7 //starting hour for axis
global.zoom_hr = 0 //starting hour for zoom focus
global.extend = 0
global.ext_height = 1.2 //percentage to increase height on extension
global.ext_len = 1.3
global.peak_height = 0.9 //percentage of height to be considered a peak
global.peak_percentage = 0.35//percentage of x axis required to be at peak
global.peaked = 0 //init
global.p_tol_constant = 0.0000011//constant to lower subsequent effects by
global.s_tol_constant = 0.0000014 //constant to lower subsequent effects by
global.d_tol_constant = 0.0000004 //constant to lower subsequent effects by



global.max_list = 22 //max no of entries at once
global.count = 0 //current no of entries
global.enter = 0
global.written = 0
global.effect = 1 //use colour or effect
global.page = 0
global.select = 0
global.next = 0
global.clear = 0
global.back = 0
}
