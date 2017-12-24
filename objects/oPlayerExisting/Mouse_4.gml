/// @description Insert description here
// You can write your code in this editor
switch(state){
	case "unpressed":
		// create up, create down, destroy oPlyerNew, change image_index, create confirm name
		image_index=2;
		instance_create_layer(x-30,y-96,layer,oSelectUp);
		instance_create_layer(x-30,y+32,layer,oSelectDown);
		instance_deactivate_object(oPlayerNew);
		instance_deactivate_object(oRemovePlayer);
		instance_deactivate_object(oBacktoSelectP);
		instance_create_layer(1152,554,layer,oBacktoRename);
		var conf = instance_create_layer(x,y + 196,layer,oConfirmName);
		conf.text = "Confirm";
		showName = true;
		state = "display_existing";
		break;
	default: break;
}