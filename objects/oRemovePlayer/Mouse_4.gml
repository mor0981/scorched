/// @description Change pressed to true
// You can write your code in this editor
if(!pressed){
	pressed = true;
	//Create up and down button
	instance_create_layer(x-32,y-96,layer,oSelectUp);
	instance_create_layer(x-32,y+32,layer,oSelectDown);
	//Create back
	instance_create_layer(x+224, y+128, layer, oBackfromRemove);
	
	//Create confirm
	instance_create_layer(x+224, y, layer, oRemoveConfirm);
	
	//Hide the new and existing button
	instance_deactivate_object(oPlayerNew);
	instance_deactivate_object(oPlayerExisting);
	instance_deactivate_object(oBacktoSelectP);
}