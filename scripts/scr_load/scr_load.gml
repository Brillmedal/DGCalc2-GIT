function scr_load(argument0) //preset no
{

if argument0 = 1
{
	if file_exists("1.txt") //if file exists
	{

		var p1 = file_text_open_read(working_directory + "1.txt"); //Open file to read
		var no = file_text_read_real(p1) //how many written
		instance_destroy(obj_drug)
		if no > 0 then
			{
			for (var i = 0; i < (no); i += 1;)
				{
					drug = file_text_read_real(p1) 
					hour = file_text_read_real(p1) 
					dosage = file_text_read_real(p1) 
					tolerance = file_text_read_real(p1) 
					scr_drug(drug,dosage,hour,tolerance,1)
					global.select = 1
				}
			}
			else { global.select = 1 }
			

	file_text_close(p1); //close file to be read elsewhere
	}

}

if argument0 = 2
{
	if file_exists("2.txt") //if file exists
	{

		var p1 = file_text_open_read(working_directory + "2.txt"); //Open file to read
		var no = file_text_read_real(p1) //how many written
		instance_destroy(obj_drug)
		if no > 0 then
			{
			for (var i = 0; i < (no); i += 1;)
				{
					drug = file_text_read_real(p1) 
					hour = file_text_read_real(p1) 
					dosage = file_text_read_real(p1) 
					tolerance = file_text_read_real(p1) 		
					scr_drug(drug,dosage,hour,tolerance,1)
					global.select = 1
				}
			}
			else { global.select = 1 }

	file_text_close(p1); //close file to be read elsewhere
	}
}

if argument0 = 3
{
	if file_exists("3.txt") //if file exists
	{

		var p1 = file_text_open_read(working_directory + "3.txt"); //Open file to read
		var no = file_text_read_real(p1) //how many written
		instance_destroy(obj_drug)
		if no > 0 then
			{
			for (var i = 0; i < (no); i += 1;)
				{
					drug = file_text_read_real(p1) 
					hour = file_text_read_real(p1) 
					dosage = file_text_read_real(p1) 
					tolerance = file_text_read_real(p1) 		
					scr_drug(drug,dosage,hour,tolerance,1)
					global.select = 1
				}
			}
			else { global.select = 1 }

	file_text_close(p1); //close file to be read elsewhere
	}
}

if argument0 = 4
{
	if file_exists("4.txt") //if file exists
	{

		var p1 = file_text_open_read(working_directory + "4.txt"); //Open file to read
		var no = file_text_read_real(p1) //how many written
		instance_destroy(obj_drug)
		if no > 0 then
			{
			for (var i = 0; i < (no); i += 1;)
				{
					drug = file_text_read_real(p1) 
					hour = file_text_read_real(p1) 
					dosage = file_text_read_real(p1) 
					tolerance = file_text_read_real(p1) 		
					scr_drug(drug,dosage,hour,tolerance,1)
					global.select = 1
				}
			}
			else { global.select = 1 }

	file_text_close(p1); //close file to be read elsewhere
	}
}

if argument0 = 5
{
	if file_exists("5.txt") //if file exists
	{

		var p1 = file_text_open_read(working_directory + "5.txt"); //Open file to read
		var no = file_text_read_real(p1) //how many written
		instance_destroy(obj_drug)
		if no > 0 then
			{
			for (var i = 0; i < (no); i += 1;)
				{
					drug = file_text_read_real(p1) 
					hour = file_text_read_real(p1) 
					dosage = file_text_read_real(p1) 
					tolerance = file_text_read_real(p1) 		
					scr_drug(drug,dosage,hour,tolerance,1)
					global.select = 1
				}
			}
			else { global.select = 1 }

	file_text_close(p1); //close file to be read elsewhere
	}
}

}