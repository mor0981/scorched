/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_black);
draw_rectangle(0,0,room_width,room_height,false);
var size = ds_grid_height(global.highlist);
var spacing = 52;
var i = 0;
draw_text_new(room_width/2, 48, "Highscores", fa_center, fa_middle, fntRingbearer40, c_white);
draw_text_new(400, 128+(i*spacing), "Name", fa_center, fa_middle, fntRingbearer40, c_white);
draw_text_new(800, 128+(i*spacing), "Score", fa_center, fa_middle, fntRingbearer40, c_white);
for(i=0; i<size; i+=1){
	var names = global.highlist[# 0,i];
	var scores = global.highlist[# 1,i];
	draw_text_new(400, 128+((i+1)*spacing), names, fa_center, fa_middle, fntRingbearer40, c_white);
	draw_text_new(800, 128+((i+1)*spacing), scores, fa_center, fa_middle, fntRingbearer40, c_white);
}