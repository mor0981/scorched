/// @description Insert description here
// You can write your code in this editor
//Save this round higscore
instance_deactivate_all(true);

//Save to highscore table
var gridsize = ds_grid_height(global.highlist);

//Add to the last y position
if(global.winnername!="" || global.winnerscore!=0){
	ds_grid_add(global.highlist, 0, gridsize-1, global.winnername);
	ds_grid_add(global.highlist, 1, gridsize-1, global.winnerscore)
}

//Sort based on score
ds_grid_sort(global.highlist, 1, false);

var str = ds_grid_write(global.highlist);
ini_open(global.highscoresave);
	ini_write_string("Lists","0",str);
ini_close();