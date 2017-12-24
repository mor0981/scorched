/// @description Insert description here
// You can write your code in this editor
var i_d = ds_map_find_value(async_load, "id");
if i_d == msg
   {
   if ds_map_find_value(async_load, "status")
      {
      if ds_map_find_value(async_load, "result") != ""
         {
         global.name[currentPlayer] = ds_map_find_value(async_load, "result");
		 
		 //New player, add into the player list and save
		 ds_list_add(global.playerlist, global.name[currentPlayer]);
		 
		 //Save to playersave
		 {
			var str = ds_list_write(global.playerlist);
			ini_open(global.playersave);
			ini_write_string("Lists","0",str);
			ini_close();
		 }
		 
		 currentPlayer+=1;
		 if(currentPlayer==global.player){
				 room_goto_next();
		 }
         }
      }
	  instance_activate_all();
   }