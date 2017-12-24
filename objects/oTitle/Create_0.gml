/// @description Draw text
// New text
text = "Scorched";
text2= "The Mother of All Games";
alarm[0] = room_speed*2;
audio_play_sound(sndBGM,10,true);

//Create highscore save table
global.highscoresave = "hs.ini";
global.highlist = ds_grid_create(2,11);
//Create player list
global.playersave = "ps.ini";
global.playerlist = ds_list_create();



global.winnername = "";
global.winnerscore = 0;

//Load highscore table
if(file_exists(global.highscoresave)){
	ini_open(global.highscoresave);
	var str = ini_read_string("Lists", "0", "");
	if str != ""
	   {
	   ds_grid_read(global.highlist, str);
	   }
	ini_close();	
}

//Load player list
if(file_exists(global.playersave)){
	ini_open(global.playersave);
	var str = ini_read_string("Lists", "0", "");
	if str != ""
	   {
	   ds_list_read(global.playerlist, str);
	   }
	else{
		ds_list_add(global.playerlist, "New");
		}
	ini_close();	
}



/*
//Save to highscore table
var str = ds_grid_write(global.highlist);
ini_open(global.highscoresave);
	ini_write_string("Lists","0",str);
ini_close();
*/