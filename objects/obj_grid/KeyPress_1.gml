///START CONTROLS
var unt = scr_read(global.drug,3) //read unit vals
	file_text_close(file); //close file to be read elsewhere


if keyboard_check_pressed(vk_enter) 
	{
		global.enter = 1;
		if (global.count < max_list-1) then obj_drug.written = 1
	}

if keyboard_check_pressed(vk_escape) {global.clear = 1;}

if unt = 3 then i = 0.01 else i = 1


if keyboard_check_direct(vk_shift) then
	{
		if global.dosage > 0
		{ if keyboard_check_pressed(vk_down) {global.dosage -= i; global.select = 1} }
	
		if global.dosage < 1000
		{ if keyboard_check_pressed(vk_up) {global.dosage += i; global.select = 1} }
		
		if global.drug > 1
		{ if keyboard_check_pressed(vk_left) {global.drug -= 1; global.select = 1} }
		if global.drug = 1
		{ if keyboard_check_pressed(vk_left) {global.drug = 18; global.select = 1} }

		if global.drug < 18
		{ if keyboard_check_pressed(vk_right) {global.drug += 1; global.select = 1} }
		if global.drug = 18
		{ if keyboard_check_pressed(vk_right) {global.drug = 1; global.select = 1} }
		

	}
	else
	{
		if global.dosage > 0
		{ if keyboard_check_pressed(vk_down) {global.dosage -= i*10; global.select = 1} }

		if global.dosage < 1000
		{ if keyboard_check_pressed(vk_up) {global.dosage += i*10; global.select = 1} }
		
		if global.hour > 0
		{ if keyboard_check_pressed(vk_left) {global.hour -= 1; global.select = 1} }

		if global.hour < 23
		{ if keyboard_check_pressed(vk_right) {global.hour += 1; global.select = 1} }

	}

