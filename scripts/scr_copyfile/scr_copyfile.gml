function scr_copyfile(){

//iv = argument0 //position to read from //what number of drug is being changed?

T0 = 0
T1 = edit_stats[1]
T2 = edit_stats[2]
T3 = edit_stats[3]
T4 = edit_stats[4]
T5 = edit_stats[5]
T6 = edit_stats[6]
T7 = edit_stats[7]
T8 = edit_stats[8]
T9 = edit_stats[9]
T10 = edit_stats[10]
T11 = edit_stats[11]
T12 = edit_stats[12]
T13 = edit_stats[13]
T14 = edit_stats[14]
T15 = edit_stats[15]
T16 = edit_stats[16]
T17 = edit_stats[17]
T18 = edit_stats[18]
T19 = edit_stats[19]
T20 = edit_stats[20]
T21 = edit_stats[21]
T22 = edit_stats[22]
T23 = edit_stats[23]


if file_exists("list.txt") //if file exists
	{
		file1 = file_text_open_read(working_directory + "list.txt"); //Open file to read
		filecopy = file_text_open_write(working_directory + "list.txt"); //Open copy to read
		
		file_text_write_string(filecopy, "DRUG NAME");
	    file_text_writeln(filecopy);
		file_text_write_string(filecopy, "COLOUR (1=RED 2=ORANGE 3=YELLOW 4=LIME 5=GREEN 6=TEAL 7=BLUE 8=AZURE 9=INDIGO 10=VIOLET 11=PINK");	
		file_text_writeln(filecopy);
		file_text_write_string(filecopy, "Pyschedelic/Stimulating/Dissociating, percentage must add up to 100%");
		file_text_writeln(filecopy);
	    file_text_write_string(filecopy, "BASE DOSAGE");
		file_text_writeln(filecopy);
		file_text_write_string(filecopy, "INTENSITY BY HOUR T0 T1 T2 T3 T4... T22 T23");
		file_text_writeln(filecopy);
		file_text_write_string(filecopy, "UNIT (1=mg, 2=ug, 3=g");
		file_text_writeln(filecopy);
		file_text_writeln(filecopy);
		
				for (var i = 0; i < (7); i += 1;) //skip to initial stats
			{
				file_text_readln(file1);
			
			}
		for (var iiv = 0; iiv < global.drug-1; iiv += 1;)
		 //COPY ALL DRUGS BEFORE THE CURRENT ONE
		{
		val = file_text_read_string(file1) //name
		file_text_write_string(filecopy, val);
		file_text_writeln(filecopy);
		val = file_text_read_real(file1) //colour
		file_text_write_real(filecopy, val);
		file_text_writeln(filecopy);
		val = file_text_read_real(file1) //psych
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1) //stim	
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1) //diss
		file_text_write_real(filecopy, val);
		file_text_writeln(filecopy);
		val = file_text_read_real(file1) //b_dosage
		file_text_write_string(filecopy, val);
		file_text_writeln(filecopy);
		val = file_text_read_real(file1) //T0
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1) //T1
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1) //T2
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1) //T3
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1) //T4
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1) //T5
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1) //T6
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1) //T7
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1)
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1)
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1)
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1)
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1)
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1)
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1)
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1)
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1)
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1)
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1) 
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1)
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1)
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1) //T21
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1) //T22
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1) //T23
		file_text_write_real(filecopy, val);
		file_text_writeln(filecopy);
		val = file_text_read_real(file1) //unit
		file_text_write_real(filecopy, val);
		file_text_readln(file1);
		file_text_readln(file1);
		file_text_writeln(filecopy);
		file_text_writeln(filecopy);
		
		}	
		
		//WRITE NEW DRUG IN PLACE
	file_text_write_string(filecopy,keyboard_string) //NAME
	 file_text_writeln(filecopy);
	file_text_write_real(filecopy,chosen_colour)  //COLOUR
	 file_text_writeln(filecopy);
	file_text_write_real(filecopy,psych_edit)  //PSYCH
	file_text_write_real(filecopy,stim_edit) //STIM
	file_text_write_real(filecopy,diss_edit)  //DISS
	 file_text_writeln(filecopy);
	file_text_write_real(filecopy,b_d) //BASE DOSAGE
	 file_text_writeln(filecopy);
	file_text_write_real(filecopy,T0)  //T0
	file_text_write_real(filecopy,T1) 
	file_text_write_real(filecopy,T2) 
	file_text_write_real(filecopy,T3) 
	file_text_write_real(filecopy,T4) 
	file_text_write_real(filecopy,T5) 
	file_text_write_real(filecopy,T6) 
	file_text_write_real(filecopy,T7) 
	file_text_write_real(filecopy,T8) 
	file_text_write_real(filecopy,T9) 
	file_text_write_real(filecopy,T10) 
	file_text_write_real(filecopy,T11) 
	file_text_write_real(filecopy,T12) 
	file_text_write_real(filecopy,T13) 
	file_text_write_real(filecopy,T14) 
	file_text_write_real(filecopy,T15) 
	file_text_write_real(filecopy,T16) 
	file_text_write_real(filecopy,T17) 
	file_text_write_real(filecopy,T18) 
	file_text_write_real(filecopy,T19) 
	file_text_write_real(filecopy,T20) 
	file_text_write_real(filecopy,T21) 
	file_text_write_real(filecopy,T22)
	file_text_write_real(filecopy,T23) //T23
	 file_text_writeln(filecopy);
	file_text_write_real(filecopy,unit_edit) //UNIT
	file_text_writeln(filecopy);
	file_text_writeln(filecopy);
	
		for (var i = 0; i < (7); i += 1;) //skip to initial stats
			{
				file_text_readln(file1);
			
			}
	
			for (var iiv = 0; iiv < (global.drugs_max - (global.drug)); iiv += 1;)
		 //COPY ALL DRUGS AFTER THE CURRENT ONE
		{
		val = file_text_read_string(file1) //name
		file_text_write_string(filecopy, val);
		file_text_writeln(filecopy);
		val = file_text_read_real(file1) //colour
		file_text_write_real(filecopy, val);
		file_text_writeln(filecopy);
		val = file_text_read_real(file1) //psych
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1) //stim	
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1) //diss
		file_text_write_real(filecopy, val);
		file_text_writeln(filecopy);
		val = file_text_read_real(file1) //b_dosage
		file_text_write_string(filecopy, val);
		file_text_writeln(filecopy);
		val = file_text_read_real(file1) //T0
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1) //T1
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1) //T2
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1) //T3
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1) //T4
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1) //T5
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1) //T6
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1) //T7
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1)
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1)
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1)
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1)
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1)
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1)
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1)
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1)
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1)
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1)
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1) 
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1)
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1)
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1) //T21
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1) //T22
		file_text_write_real(filecopy, val);
		val = file_text_read_real(file1) //T23
		file_text_write_real(filecopy, val);
		file_text_writeln(filecopy);
		val = file_text_read_real(file1) //unit
		file_text_write_real(filecopy, val);
		file_text_readln(file1);
		file_text_readln(file1);
		file_text_writeln(filecopy);
		file_text_writeln(filecopy);
		
		}	
	}

}


	    
