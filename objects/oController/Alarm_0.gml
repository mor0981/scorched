/// @description Insert description here
// You can write your code in this editor
if(state=="dm_wait" || state=="turn_wait"){
	instance_destroy(display_text,false);
	state="turn_wait";
}