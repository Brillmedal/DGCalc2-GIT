scr_globals() //init globals

if !file_exists("1.txt") { var p1 = file_text_open_write(working_directory + "1.txt"); file_text_close(p1);}
if !file_exists("2.txt") { var p2 = file_text_open_write(working_directory + "2.txt"); file_text_close(p2);}
if !file_exists("3.txt") { var p3 = file_text_open_write(working_directory + "3.txt"); file_text_close(p3);}
if !file_exists("4.txt") { var p4 = file_text_open_write(working_directory + "4.txt"); file_text_close(p4);}
if !file_exists("5.txt") { var p5 = file_text_open_write(working_directory + "5.txt"); file_text_close(p5);}

var c = 0 //begin count

if !file_exists("list.txt") //if file doesn't exist
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
		file_text_write_string(file, "INTENSITY BY HOUR T0 T1 T2 T3 T4... T22 T23");
		file_text_writeln(file);
		file_text_write_string(file, "UNIT (1=mg, 2=ug, 3=g");
		file_text_writeln(file);
		file_text_writeln(file);
		
		c += 1
		file_text_write_string(file, "LSD");
	    file_text_writeln(file);
		file_text_write_real(file, "3");
		file_text_writeln(file);
		file_text_write_real(file, "70");
		file_text_write_real(file, "20");
		file_text_write_real(file, "10");
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
		
		c += 1
		file_text_write_string(file, "2CB");
	    file_text_writeln(file);
		file_text_write_real(file, "4");
		file_text_writeln(file);
		file_text_write_real(file, "65");
		file_text_write_real(file, "30");
		file_text_write_real(file, "5");
		file_text_writeln(file);
	    file_text_write_string(file, "20");
		file_text_writeln(file);
		file_text_write_real(file, "0");
		file_text_write_real(file, "2");
		file_text_write_real(file, "6");
		file_text_write_real(file, "7");
		file_text_write_real(file, "7");
		file_text_write_real(file, "6");
		file_text_write_real(file, "5");
		file_text_write_real(file, "3");
		file_text_write_real(file, "2");
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
		file_text_write_real(file, "0");
		file_text_write_real(file, "0"); //11
		file_text_write_real(file, "0");
		file_text_write_real(file, "0"); //12
		file_text_write_real(file, "0");
		file_text_writeln(file);
		file_text_write_real(file, "1");
		file_text_writeln(file);
		file_text_writeln(file);
		
		c += 1
		file_text_write_string(file, "4-HO-MET");
	    file_text_writeln(file);
		file_text_write_real(file, "7");
		file_text_writeln(file);
		file_text_write_real(file, "70");
		file_text_write_real(file, "15");
		file_text_write_real(file, "15");
		file_text_writeln(file);
	    file_text_write_string(file, "15");
		file_text_writeln(file);
		file_text_write_real(file, "0");
		file_text_write_real(file, "2");
		file_text_write_real(file, "6");
		file_text_write_real(file, "7");
		file_text_write_real(file, "7");
		file_text_write_real(file, "6");
		file_text_write_real(file, "5");
		file_text_write_real(file, "3");
		file_text_write_real(file, "2");
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
		file_text_write_real(file, "0");
		file_text_write_real(file, "0"); //11
		file_text_write_real(file, "0");
		file_text_write_real(file, "0"); //12
		file_text_write_real(file, "0");
		file_text_writeln(file);
		file_text_write_real(file, "1");
		file_text_writeln(file);
		file_text_writeln(file);
		
		
		c += 1
		file_text_write_string(file, "Shrooms");
	    file_text_writeln(file);
		file_text_write_real(file, "1");
		file_text_writeln(file);
		file_text_write_real(file, "80");
		file_text_write_real(file, "10");
		file_text_write_real(file, "10");
		file_text_writeln(file);
	    file_text_write_string(file, "2");
		file_text_writeln(file);
		file_text_write_real(file, "0");
		file_text_write_real(file, "4");
		file_text_write_real(file, "8");
		file_text_write_real(file, "7");
		file_text_write_real(file, "5");
		file_text_write_real(file, "3");
		file_text_write_real(file, "2");
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
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0"); //11
		file_text_write_real(file, "0");
		file_text_write_real(file, "0"); //12
		file_text_write_real(file, "0");
		file_text_writeln(file);
		file_text_write_real(file, "3");
		file_text_writeln(file);
		file_text_writeln(file);
		
		c += 1
		file_text_write_string(file, "4-ACO-DMT");
	    file_text_writeln(file);
		file_text_write_real(file, "1");
		file_text_writeln(file);
		file_text_write_real(file, "80");
		file_text_write_real(file, "10");
		file_text_write_real(file, "10");
		file_text_writeln(file);
	    file_text_write_string(file, "10");
		file_text_writeln(file);
		file_text_write_real(file, "0");
		file_text_write_real(file, "4");
		file_text_write_real(file, "8");
		file_text_write_real(file, "7");
		file_text_write_real(file, "5");
		file_text_write_real(file, "3");
		file_text_write_real(file, "2");
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
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0"); //11
		file_text_write_real(file, "0");
		file_text_write_real(file, "0"); //12
		file_text_write_real(file, "0");
		file_text_writeln(file);
		file_text_write_real(file, "1");
		file_text_writeln(file);
		file_text_writeln(file);
		
		c += 1
		file_text_write_string(file, "MDMA");
	    file_text_writeln(file);
		file_text_write_real(file, "7");
		file_text_writeln(file);
		file_text_write_real(file, "25");
		file_text_write_real(file, "70");
		file_text_write_real(file, "5");
		file_text_writeln(file);
	    file_text_write_string(file, "150");
		file_text_writeln(file);
		file_text_write_real(file, "0"); //1
		file_text_write_real(file, "2");
		file_text_write_real(file, "7"); //2
		file_text_write_real(file, "8");
		file_text_write_real(file, "7"); //3
		file_text_write_real(file, "5");
		file_text_write_real(file, "1"); //4
		file_text_write_real(file, "0");
		file_text_write_real(file, "0"); //5
		file_text_write_real(file, "0");
		file_text_write_real(file, "0"); //6
		file_text_write_real(file, "0");
		file_text_write_real(file, "0"); //7
		file_text_write_real(file, "0");
		file_text_write_real(file, "0"); //8
		file_text_write_real(file, "0");
		file_text_write_real(file, "0"); //9
		file_text_write_real(file, "0");
		file_text_write_real(file, "0"); //10
		file_text_write_real(file, "0");
		file_text_write_real(file, "0"); //11
		file_text_write_real(file, "0");
		file_text_write_real(file, "0"); //12
		file_text_write_real(file, "0");
		file_text_writeln(file);
		file_text_write_real(file, "1");
		file_text_writeln(file);
		file_text_writeln(file);
		
		c += 1
		file_text_write_string(file, "MDMA (NASAL)");
	    file_text_writeln(file);
		file_text_write_real(file, "7");
		file_text_writeln(file);
		file_text_write_real(file, "25");
		file_text_write_real(file, "70");
		file_text_write_real(file, "5");
		file_text_writeln(file);
	    file_text_write_string(file, "60");
		file_text_writeln(file);
		file_text_write_real(file, "0"); //1
		file_text_write_real(file, "5");
		file_text_write_real(file, "8"); //2
		file_text_write_real(file, "4");
		file_text_write_real(file, "2"); //3
		file_text_write_real(file, "1");
		file_text_write_real(file, "0"); //4
		file_text_write_real(file, "0");
		file_text_write_real(file, "0"); //5
		file_text_write_real(file, "0");
		file_text_write_real(file, "0"); //6
		file_text_write_real(file, "0");
		file_text_write_real(file, "0"); //7
		file_text_write_real(file, "0");
		file_text_write_real(file, "0"); //8
		file_text_write_real(file, "0");
		file_text_write_real(file, "0"); //9
		file_text_write_real(file, "0");
		file_text_write_real(file, "0"); //10
		file_text_write_real(file, "0");
		file_text_write_real(file, "0"); //11
		file_text_write_real(file, "0");
		file_text_write_real(file, "0"); //12
		file_text_write_real(file, "0");
		file_text_writeln(file);
		file_text_write_real(file, "1");
		file_text_writeln(file);
		file_text_writeln(file);
		
		c += 1
		file_text_write_string(file, "4MMC");
	    file_text_writeln(file);
		file_text_write_real(file, "8");
		file_text_writeln(file);
		file_text_write_real(file, "20");
		file_text_write_real(file, "75");
		file_text_write_real(file, "5");
		file_text_writeln(file);
	    file_text_write_string(file, "200");
		file_text_writeln(file);
		file_text_write_real(file, "0"); //1
		file_text_write_real(file, "3");
		file_text_write_real(file, "7"); //2
		file_text_write_real(file, "5");
		file_text_write_real(file, "2"); //3
		file_text_write_real(file, "1");
		file_text_write_real(file, "0"); //4
		file_text_write_real(file, "0");
		file_text_write_real(file, "0"); //5
		file_text_write_real(file, "0");
		file_text_write_real(file, "0"); //6
		file_text_write_real(file, "0");
		file_text_write_real(file, "0"); //7
		file_text_write_real(file, "0");
		file_text_write_real(file, "0"); //8
		file_text_write_real(file, "0");
		file_text_write_real(file, "0"); //9
		file_text_write_real(file, "0"); 
		file_text_write_real(file, "0"); //10
		file_text_write_real(file, "0");
		file_text_write_real(file, "0"); //11
		file_text_write_real(file, "0");
		file_text_write_real(file, "0"); //12
		file_text_write_real(file, "0");
		file_text_writeln(file);
		file_text_write_real(file, "1");
		file_text_writeln(file);
		file_text_writeln(file);
		
		c += 1
		file_text_write_string(file, "4MMC (NASAL)");
	    file_text_writeln(file);
		file_text_write_real(file, "8");
		file_text_writeln(file);
		file_text_write_real(file, "20");
		file_text_write_real(file, "75");
		file_text_write_real(file, "5");
		file_text_writeln(file);
	    file_text_write_string(file, "80");
		file_text_writeln(file);
		file_text_write_real(file, "0"); //1
		file_text_write_real(file, "8");
		file_text_write_real(file, "6"); //2
		file_text_write_real(file, "2");
		file_text_write_real(file, "1"); //3
		file_text_write_real(file, "1");
		file_text_write_real(file, "0"); //4
		file_text_write_real(file, "0");
		file_text_write_real(file, "0"); //5
		file_text_write_real(file, "0");
		file_text_write_real(file, "0"); //6
		file_text_write_real(file, "0");
		file_text_write_real(file, "0"); //7
		file_text_write_real(file, "0");
		file_text_write_real(file, "0"); //8
		file_text_write_real(file, "0");
		file_text_write_real(file, "0"); //9
		file_text_write_real(file, "0"); 
		file_text_write_real(file, "0"); //10
		file_text_write_real(file, "0");
		file_text_write_real(file, "0"); //11
		file_text_write_real(file, "0");
		file_text_write_real(file, "0"); //12
		file_text_write_real(file, "0");
		file_text_writeln(file);
		file_text_write_real(file, "1");
		file_text_writeln(file);
		file_text_writeln(file);
		
		c += 1
		file_text_write_string(file, "4FA");
	    file_text_writeln(file);
		file_text_write_real(file, "9");
		file_text_writeln(file);
		file_text_write_real(file, "20");
		file_text_write_real(file, "75");
		file_text_write_real(file, "5");
		file_text_writeln(file);
	    file_text_write_string(file, "200");
		file_text_writeln(file);
		file_text_write_real(file, "0");
		file_text_write_real(file, "2");
		file_text_write_real(file, "6");
		file_text_write_real(file, "7");
		file_text_write_real(file, "6");
		file_text_write_real(file, "6");
		file_text_write_real(file, "6");
		file_text_write_real(file, "4");
		file_text_write_real(file, "3");
		file_text_write_real(file, "2");
		file_text_write_real(file, "1");
		file_text_write_real(file, "1");
		file_text_write_real(file, "1");
		file_text_write_real(file, "1");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0"); //11
		file_text_write_real(file, "0");
		file_text_write_real(file, "0"); //12
		file_text_write_real(file, "0");
		file_text_writeln(file);
		file_text_write_real(file, "1");
		file_text_writeln(file);
		file_text_writeln(file);
		
		c += 1
		file_text_write_string(file, "Ket (Nasal)");
	    file_text_writeln(file);
		file_text_write_real(file, "2");
		file_text_writeln(file);
		file_text_write_real(file, "20");
		file_text_write_real(file, "10");
		file_text_write_real(file, "70");
		file_text_writeln(file);
	    file_text_write_string(file, "60");
		file_text_writeln(file);
		file_text_write_real(file, "0");
		file_text_write_real(file, "6");
		file_text_write_real(file, "3");
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
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0"); //11
		file_text_write_real(file, "0");
		file_text_write_real(file, "0"); //12
		file_text_write_real(file, "0");
		file_text_writeln(file);
		file_text_write_real(file, "1");
		file_text_writeln(file);
		file_text_writeln(file);
		
		c += 1
		file_text_write_string(file, "3-MEO-PCP");
	    file_text_writeln(file);
		file_text_write_real(file, "8");
		file_text_writeln(file);
		file_text_write_real(file, "10");
		file_text_write_real(file, "20");
		file_text_write_real(file, "70");
		file_text_writeln(file);
	    file_text_write_string(file, "10");
		file_text_writeln(file);
		file_text_write_real(file, "0");
		file_text_write_real(file, "5");
		file_text_write_real(file, "7");
		file_text_write_real(file, "7");
		file_text_write_real(file, "6");
		file_text_write_real(file, "5");
		file_text_write_real(file, "4");
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
		file_text_write_real(file, "0");
		file_text_write_real(file, "0"); //11
		file_text_write_real(file, "0");
		file_text_write_real(file, "0"); //12
		file_text_write_real(file, "0");
		file_text_writeln(file);
		file_text_write_real(file, "1");
		file_text_writeln(file);
		file_text_writeln(file);
		
		

for (var i = c; i < global.drugs_max; ++i;)
{
		c += 1
		file_text_write_string(file, "-");
	    file_text_writeln(file);
		file_text_write_real(file, "1");
		file_text_writeln(file);
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
		file_text_write_real(file, "0");
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
}


file_text_close(file);

}


var mini_base = 255 //number to base mini grid 255value on
var synergy = 0.08 //percentage to decrease per entry 
var p_tol_constant = 0.0000018*10000//constant to lower subsequent effects by (times 10000 just for storing data)
var s_tol_constant = 0.0000016*10000 //constant to lower subsequent effects by
var d_tol_constant = 0.0000004*10000 //constant to lower subsequent effects by
var ext_len = 1.3
var peak_height = 0.9 //percentage of height to be considered a peak
var peak_percentage = 0.35//percentage of x axis required to be at peak

if !file_exists("Constants.txt")
	{ 
		var file = file_text_open_write(working_directory + "Constants.txt");
		file_text_write_string(file, "Sensitivity of the mini grid (Default 255) higher is less sensitive:");
		file_text_writeln(file);
		file_text_write_real(file, mini_base);
		file_text_writeln(file);
		file_text_write_string(file, "Overall percentage decrease on synergy for each drug entry that overlaps ever hour:");
		file_text_writeln(file);
		file_text_write_real(file, synergy);
		file_text_writeln(file);
		file_text_write_string(file, "Decay on psychedelic effects over time as total values are accumulated:");
		file_text_writeln(file);
		file_text_write_real(file, p_tol_constant);
		file_text_writeln(file);
		file_text_write_string(file, "Decay on stimulant effects over time as total values are accumulated:");
		file_text_writeln(file);
		file_text_write_real(file, s_tol_constant);
		file_text_writeln(file);
		file_text_write_string(file, "Decay on dissociative effects over time as total values are accumulated:");
		file_text_writeln(file);
		file_text_write_real(file, d_tol_constant);
		file_text_writeln(file);
		file_text_write_string(file, "How much length of timings is extended by when high peak effects are detected:");
		file_text_writeln(file);
		file_text_write_real(file, ext_len);
		file_text_writeln(file);
		file_text_write_string(file, "What percentage height is considered a high peak effect:");
		file_text_writeln(file);
		file_text_write_real(file, peak_height);
		file_text_writeln(file);
		file_text_write_string(file, "What percentage of hours are required to be above this height to trigger detection:");
		file_text_writeln(file);
		file_text_write_real(file, peak_percentage);
		file_text_writeln(file);
		file_text_close(file);
	}
	
scr_read_const() //set constants

instance_create_depth(x,y,-1,obj_grid)
instance_create_depth(x,y,-1,obj_start)
instance_create_depth(x,y,-1,obj_end)
