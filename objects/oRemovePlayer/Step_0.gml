/// @description Insert description here
// You can write your code in this editor
//global.playerlist

if(pressed){
	var maxsize = ds_list_size(global.playerlist);
	index = clamp(index,0,maxsize-1);
	name = global.playerlist[| index];

	if(del){
		ds_list_delete(global.playerlist, index);
		var str = ds_list_write(global.playerlist);
		ini_open(global.playersave);
		ini_write_string("Lists","0",str);
		ini_close();
		
		//Return
		pressed = false;
		instance_destroy(oSelectDown);
		instance_destroy(oSelectUp);
		instance_destroy(oRemoveConfirm);
		instance_destroy(oBackfromRemove);
		instance_activate_all();
		
		index = 0;
		del = false;
	}
}