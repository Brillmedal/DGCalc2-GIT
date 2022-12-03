function scr_read(argument0,argument1){

ii = argument0 //position to read from (adjusts placement in file)
pl = argument1 //retrieve and return this value

	
if file_exists("list.txt") //if file exists
{

	file = file_text_open_read(working_directory + "list.txt"); //Open file to read

	for (var i = 0; i < (6*ii); i += 1;) //skip to initial stats
		{
			file_text_readln(file);
		}
		
	name = file_text_read_string(file)
	if pl = 1 {return name}
	psych = file_text_read_real(file) 
	stim = file_text_read_real(file) 
	diss = file_text_read_real(file) 
	b_dosage = file_text_read_real(file) 
	if pl = 2 {return b_dosage}
	T0 = file_text_read_real(file) 
	T1 = file_text_read_real(file)
	T2 = file_text_read_real(file) 
	T3 = file_text_read_real(file) 
	T4 = file_text_read_real(file) 
	T5 = file_text_read_real(file) 
	T6 = file_text_read_real(file) 
	T7 = file_text_read_real(file) 
	T8 = file_text_read_real(file) 
	T9 = file_text_read_real(file) 
	T10 = file_text_read_real(file) 
	T11 = file_text_read_real(file) 
	T12 = file_text_read_real(file) 
	T13 = file_text_read_real(file) 
	T14 = file_text_read_real(file) 
	T15 = file_text_read_real(file) 
	T16 = file_text_read_real(file) 
	T17 = file_text_read_real(file) 
	T18 = file_text_read_real(file) 
	T19 = file_text_read_real(file) 
	T20 = file_text_read_real(file) 
	T21 = file_text_read_real(file) 
	T22 = file_text_read_real(file) 
	T23 = file_text_read_real(file) 
	unit = file_text_read_real(file)
	if pl = 3 {return unit}
}

}