/// @description Insert description here
// You can write your code in this editor
with(oInputName){
	msg = get_string_async("What is your name?", "");
	instance_deactivate_object(oPlayerExisting);
	instance_deactivate_object(oRemovePlayer);
	instance_deactivate_object(oBacktoSelectP);
}