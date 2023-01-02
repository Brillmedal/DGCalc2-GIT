function scr_read(argument0,argument1){

ii = argument0 //position to read from (adjusts placement in file)
pl = argument1 //retrieve and return this value

	
if file_exists("list.txt") //if file exists
{

	file = file_text_open_read(working_directory + "list.txt"); //Open file to read

	for (var i = 0; i < (7*ii); i += 1;) //skip to initial stats
		{
			file_text_readln(file);
		}
	length = 0 //init length of how many hours are above zero
	name = file_text_read_string(file)
	colour = file_text_read_real(file) 
	if pl = 1 {return name}
	psych = file_text_read_real(file) 
	stim = file_text_read_real(file) 
	diss = file_text_read_real(file) 
	b_dosage = file_text_read_real(file) 
	if pl = 2 {return b_dosage}
	T0 = file_text_read_real(file) 
	if T0 > 0 then {length += 1}
	if T0 = 0 then T0 = 0.2 //this is so line can be drawn and appears above zero
	T1 = file_text_read_real(file)
	if T1 > 0 then {length += 1}
	T2 = file_text_read_real(file)
	if T2 > 0 then {length += 1}
	T3 = file_text_read_real(file) 
	if T3 > 0 then {length += 1}
	T4 = file_text_read_real(file) 
	if T4 > 0 then {length += 1}
	T5 = file_text_read_real(file)
	if T5 > 0 then {length += 1} 
	T6 = file_text_read_real(file)
	if T6 > 0 then {length += 1} 
	T7 = file_text_read_real(file)
	if T7 > 0 then {length += 1} 
	T8 = file_text_read_real(file)
	if T8 > 0 then {length += 1} 
	T9 = file_text_read_real(file)
	if T9 > 0 then {length += 1} 
	T10 = file_text_read_real(file)
	if T10 > 0 then {length += 1} 
	T11 = file_text_read_real(file)
	if T11 > 0 then {length += 1} 
	T12 = file_text_read_real(file)
	if T12 > 0 then {length += 1} 
	T13 = file_text_read_real(file)
	if T13 > 0 then {length += 1} 
	T14 = file_text_read_real(file)
	if T14 > 0 then {length += 1} 
	T15 = file_text_read_real(file)
	if T15 > 0 then {length += 1} 
	T16 = file_text_read_real(file)
	if T16 > 0 then {length += 1} 
	T17 = file_text_read_real(file)
	if T17 > 0 then {length += 1} 
	T18 = file_text_read_real(file)
	if T18 > 0 then {length += 1} 
	T19 = file_text_read_real(file)
	if T19 > 0 then {length += 1} 
	T20 = file_text_read_real(file)
	if T20 > 0 then {length += 1} 
	T21 = file_text_read_real(file) 
	if T21 > 0 then {length += 1}
	T22 = file_text_read_real(file)
	if T22 > 0 then {length += 1} 
	T23 = file_text_read_real(file)
	if T23 > 0 then {length += 1} 
	unit = file_text_read_real(file)
	if pl = 3 {return unit}
	
}

}