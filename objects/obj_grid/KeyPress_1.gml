///START CONTROLS
var unt = global.unit


if keyboard_check_pressed(vk_enter) 
	{
		global.enter = 1;
		if (global.count < max_list-1) then obj_drug.written = 1
	}

if keyboard_check_pressed(vk_escape) {global.clear = 1;}

if unt = 3 then p = 0.01 else p = 1


if keyboard_check_direct(vk_shift) then
	{
		if global.dosage > 0
		{ if keyboard_check_pressed(vk_down) {global.dosage -= p; global.select = 1} }
	
		if global.dosage < 1000
		{ if keyboard_check_pressed(vk_up) {global.dosage += p; global.select = 1} }
		
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
		{ if keyboard_check_pressed(vk_down) {global.dosage -= p*10; global.select = 1} }

		if global.dosage < 1000
		{ if keyboard_check_pressed(vk_up) {global.dosage += p*10; global.select = 1} }
		
		if global.hour > 0
		{ if keyboard_check_pressed(vk_left) {global.hour -= 0.25; global.select = 1} }

		if global.hour < 23
		{ if keyboard_check_pressed(vk_right) {global.hour += 0.25; global.select = 1} }

	}

