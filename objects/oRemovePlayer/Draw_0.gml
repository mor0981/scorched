/// @description Insert description here
// You can write your code in this editor
if(!pressed){
	draw_self();
}
else{
	draw_sprite(sprite_index,2,x,y);
	draw_text_new(x,y,name,fa_center,fa_middle,fntRingbearer,c_white);
}