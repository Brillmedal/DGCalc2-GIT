scr_globals() //init globals

if !file_exists("1.txt") { var p1 = file_text_open_write(working_directory + "1.txt"); file_text_close(p1);}
if !file_exists("2.txt") { var p2 = file_text_open_write(working_directory + "2.txt"); file_text_close(p2);}
if !file_exists("3.txt") { var p3 = file_text_open_write(working_directory + "3.txt"); file_text_close(p3);}
if !file_exists("4.txt") { var p4 = file_text_open_write(working_directory + "4.txt"); file_text_close(p4);}
if !file_exists("5.txt") { var p5 = file_text_open_write(working_directory + "5.txt"); file_text_close(p5);}

if !file_exists("list1.txt") //if file doesn't exist
{	

	var file = file_text_open_write(working_directory + "list.txt");

	    file_text_write_string(file, "DRUG NAME");
	    file_text_writeln(file);
		file_text_write_string(file, "COLOUR (1=RED 2=ORANGE 3=YELLOW 4=LIME 5=GREEN 6=TEAL 7=BLUE 8=AZURE 9=INDIGO 10=VIOLET 11=PINK");	
		file_text_writeln(file);
		file_text_write_string(file, "Pyschedelic/Stimulating/Dissociating, percentage must add up to 100%");
		file_text_writeln(file);
	    file_text_write_string(file, "BASE DOSAGE");
		file_text_writeln(file);
		file_text_write_string(file, "INTENSITY BY HOUR T0 T1 T2 T3 T4... T19 T20");
		file_text_writeln(file);
		file_text_write_string(file, "UNIT (1=mg, 2=ug, 3=g");
		file_text_writeln(file);
		file_text_writeln(file);
		
		file_text_write_string(file, "LSD");
	    file_text_writeln(file);
		file_text_write_real(file, "4");
		file_text_writeln(file);
		file_text_write_real(file, "70");
		file_text_write_real(file, "25");
		file_text_write_real(file, "5");
		file_text_writeln(file);
	    file_text_write_string(file, "100");
		file_text_writeln(file);
		file_text_write_real(file, "0");
		file_text_write_real(file, "3");
		file_text_write_real(file, "5");
		file_text_write_real(file, "6");
		file_text_write_real(file, "7");
		file_text_write_real(file, "7");
		file_text_write_real(file, "8");
		file_text_write_real(file, "7");
		file_text_write_real(file, "7");
		file_text_write_real(file, "5");
		file_text_write_real(file, "4");
		file_text_write_real(file, "3");
		file_text_write_real(file, "2");
		file_text_write_real(file, "1");
		file_text_write_real(file, "1");
		file_text_write_real(file, "1");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_writeln(file);
		file_text_write_real(file, "2");
		file_text_writeln(file);
		file_text_writeln(file);
		
		file_text_write_string(file, "MDMA");
	    file_text_writeln(file);
		file_text_write_real(file, "11");
		file_text_writeln(file);
		file_text_write_real(file, "25");
		file_text_write_real(file, "70");
		file_text_write_real(file, "5");
		file_text_writeln(file);
	    file_text_write_string(file, "150");
		file_text_writeln(file);
		file_text_write_real(file, "0");
		file_text_write_real(file, "2");
		file_text_write_real(file, "7");
		file_text_write_real(file, "8");
		file_text_write_real(file, "7");
		file_text_write_real(file, "5");
		file_text_write_real(file, "1");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0")
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");;
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_writeln(file);
		file_text_write_real(file, "1");
		file_text_writeln(file);
		file_text_writeln(file);

for (var i = 0; i < 15; ++i;)
{
		file_text_write_string(file, "-");
	    file_text_writeln(file);
		file_text_write_real(file, "1");
		file_text_writeln(file);
		file_text_write_real(file, "25");
		file_text_write_real(file, "70");
		file_text_write_real(file, "5");
		file_text_writeln(file);
	    file_text_write_string(file, "0");
		file_text_writeln(file);
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_writeln(file);
		file_text_write_real(file, "1");
		file_text_writeln(file);
		file_text_writeln(file);
}
file_text_close(file);

}
instance_create_depth(x,y,-1,obj_grid)