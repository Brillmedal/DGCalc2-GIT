function scr_read_const(){

	
if file_exists("Constants.txt") //if file exists
	{
		file = file_text_open_read(working_directory + "Constants.txt"); //Open file to read
		file_text_readln(file);
		global.mini_base = file_text_read_real(file)
		file_text_readln(file);
		file_text_readln(file);
		global.synergy = file_text_read_real(file) 
		file_text_readln(file);
		file_text_readln(file);
		global.p_tol_constant = file_text_read_real(file)/10000
		file_text_readln(file);
		file_text_readln(file);
		global.s_tol_constant = file_text_read_real(file)/10000
		file_text_readln(file);
		file_text_readln(file);
		global.d_tol_constant = file_text_read_real(file)/10000
		file_text_readln(file);
		file_text_readln(file);
		global.ext_len = file_text_read_real(file) 
		file_text_readln(file);
		file_text_readln(file);
		global.peak_height = file_text_read_real(file) 
		file_text_readln(file);
		file_text_readln(file);
		global.peak_percentage = file_text_read_real(file) 
	}

}