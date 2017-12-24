/// @description Insert description here
// You can write your code in this editor
switch(state){
	case "display_existing":
		break;
	case "completed":
		showName = false;
		instance_destroy(oConfirmName,true);
		instance_activate_all();
		image_index=1;
		oInputName.currentPlayer+=1;
		if(oInputName.currentPlayer==global.player){
			room_goto_next();
		}
		state = "unpressed";
	break;	
	default: break;
}