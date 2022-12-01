function scr_drug(argument0,argument1,argument2,argument3,argument4) //recieve incoming drug/dosage/hour of taking,tolerance

{

//drug = argument0
//dosage = argument1
//hour = argument2
//tolerance = argument3
//written = argument4

var inst
inst = instance_create_layer(0,0,0,obj_drug) //create object at specified coords
with(inst) {drug = argument0; dosage = argument1 ; hour = argument2; tolerance = argument3; written = argument4} //tell variables to object
return inst
}