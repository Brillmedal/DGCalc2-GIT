///START CONTROLS
var unt = global.unit
if global.edit = 0 

{

if keyboard_check_pressed(vk_enter) 
	{
		global.enter = 1;
		if (global.count < max_list-1) then obj_drug.written = 1
	}

if keyboard_check_pressed(vk_escape) {global.clear = 1;}

if unt = 3 then p = 0.01 else p = 1

//if keyboard_check_pressed(vk_shift) then shift = 1
//if keyboard_check_released(vk_shift) then shift = 0

if shift then
	{
		if global.dosage > 0
		{ if keyboard_check_pressed(vk_down) {global.dosage -= p; global.select = 1} }
	
		if global.dosage < 1000
		{ if keyboard_check_pressed(vk_up) {global.dosage += p; global.select = 1} }
		
		if global.drug > 1
		{ if keyboard_check_pressed(vk_left) {global.drug -= 1; global.select = 1; alarm[3] = 1 } }
		if global.drug = 1 && alarm[3] = -1
		{ if keyboard_check_pressed(vk_left) {global.drug = global.drugs_max; global.select = 1} }

		if global.drug < global.drugs_max
		{ if keyboard_check_pressed(vk_right) {global.drug += 1; global.select = 1; alarm[3] = 1 } }
		if global.drug = global.drugs_max && alarm[3] = -1
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

if alarm[3] = -1
{
	if keyboard_check_pressed(ord("1")) ^^ keyboard_check_pressed(vk_numpad1) then {scr_save(global.preset); global.preset = 1; scr_load(1); alarm[3] = 12}
	else
		{ if keyboard_check_pressed(ord("2")) ^^ keyboard_check_pressed(vk_numpad2) then {scr_save(global.preset); global.preset = 2; scr_load(2); alarm[3] = 12}
			else
				{ if keyboard_check_pressed(ord("3")) ^^ keyboard_check_pressed(vk_numpad3) then {scr_save(global.preset); global.preset = 3; scr_load(3); alarm[3] = 12}
					else
						{ if keyboard_check_pressed(ord("4")) ^^ keyboard_check_pressed(vk_numpad4) then {scr_save(global.preset); global.preset = 4; scr_load(4); alarm[3] = 12}
							else
								{ if keyboard_check_pressed(ord("5")) ^^ keyboard_check_pressed(vk_numpad5) then {scr_save(global.preset); global.preset = 5; scr_load(5); alarm[3] = 12}
							}
						}
				}
		}
}


}