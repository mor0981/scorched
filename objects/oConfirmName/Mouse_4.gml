/// @description Insert description here
// You can write your code in this editor
global.name[oInputName.currentPlayer] = global.playerlist[| oPlayerExisting.nameSelect];
instance_destroy(oSelectUp,true);
instance_destroy(oSelectDown,true);
oPlayerExisting.state = "completed";
instance_destroy(oBacktoRename);