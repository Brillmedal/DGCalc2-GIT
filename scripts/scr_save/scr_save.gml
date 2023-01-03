function scr_save(argument0) //no of preset
{
	
	
if argument0 = 1
{
	if file_exists("1.txt") { file_delete("1.txt"); }  //delete file initialy
	if !file_exists("1.txt") //if file doesn't now exist
	{
		var p1 = file_text_open_write(working_directory + "1.txt");
			file_text_write_real(p1, global.written);
			file_text_writeln(p1);
			for(var i=0; i<(global.written); i += 1) //run as many times as written
			{
			var targ = list[# 4,i];
			file_text_write_real(p1, targ.drug);
			file_text_write_real(p1, targ.hour);
			file_text_write_real(p1, targ.dosage);
			file_text_write_real(p1, targ.tolerance);
		    file_text_writeln(p1);
			}
		
		file_text_close(file); //close file to be read elsewhere
	}
}

if argument0 = 2
{
	if file_exists("2.txt") { file_delete("2.txt"); }  //delete file initialy
	if !file_exists("2.txt") //if file doesn't now exist
	{
		var p1 = file_text_open_write(working_directory + "2.txt");
			file_text_write_real(p1, global.written);
			file_text_writeln(p1);
			for(var i=0; i<(global.written); i += 1) //run as many times as written
			{
			var targ = list[# 4,i];
			file_text_write_real(p1, targ.drug);
			file_text_write_real(p1, targ.hour);
			file_text_write_real(p1, targ.dosage);
			file_text_write_real(p1, targ.tolerance);
		    file_text_writeln(p1);
			}
		
		file_text_close(file); //close file to be read elsewhere
	}
}

if argument0 = 3
{
	if file_exists("3.txt") { file_delete("3.txt"); }  //delete file initialy
	if !file_exists("3.txt") //if file doesn't now exist
	{
		var p1 = file_text_open_write(working_directory + "3.txt");
			file_text_write_real(p1, global.written);
			file_text_writeln(p1);
			for(var i=0; i<(global.written); i += 1) //run as many times as written
			{
			var targ = list[# 4,i];
			file_text_write_real(p1, targ.drug);
			file_text_write_real(p1, targ.hour);
			file_text_write_real(p1, targ.dosage);
			file_text_write_real(p1, targ.tolerance);
		    file_text_writeln(p1);
			}
		
		file_text_close(file); //close file to be read elsewhere
	}
}

if argument0 = 4
{
	if file_exists("4.txt") { file_delete("4.txt"); }  //delete file initialy
	if !file_exists("4.txt") //if file doesn't now exist
	{
		var p1 = file_text_open_write(working_directory + "4.txt");
			file_text_write_real(p1, global.written);
			file_text_writeln(p1);
			for(var i=0; i<(global.written); i += 1) //run as many times as written
			{
			var targ = list[# 4,i];
			file_text_write_real(p1, targ.drug);
			file_text_write_real(p1, targ.hour);
			file_text_write_real(p1, targ.dosage);
			file_text_write_real(p1, targ.tolerance);
		    file_text_writeln(p1);
			}
		
		file_text_close(file); //close file to be read elsewhere
	}
}

if argument0 = 5
{
	if file_exists("5.txt") { file_delete("5.txt"); }  //delete file initialy
	if !file_exists("5.txt") //if file doesn't now exist
	{
		var p1 = file_text_open_write(working_directory + "5.txt");
			file_text_write_real(p1, global.written);
			file_text_writeln(p1);
			for(var i=0; i<(global.written); i += 1) //run as many times as written
			{
			var targ = list[# 4,i];
			file_text_write_real(p1, targ.drug);
			file_text_write_real(p1, targ.hour);
			file_text_write_real(p1, targ.dosage);
			file_text_write_real(p1, targ.tolerance);
		    file_text_writeln(p1);
			}
		
		file_text_close(file); //close file to be read elsewhere
	}
}

}