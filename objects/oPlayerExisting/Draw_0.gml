/// @description Insert description here
// You can write your code in this editor
draw_self();
var playerlistsize = ds_list_size(global.playerlist);
nameSelect = clamp(nameSelect, 0, playerlistsize-1);
var name = global.playerlist[| nameSelect];
if(showName){
	draw_text_new(x,y,name, fa_center, fa_middle, fntRingbearer, c_white);	
}