/// @description Creation code here
// Create tank as many as player selected
var i;
globalvar agdisplay, typedisplay, adisplay, bdisplay, cdisplay;
for(i=0;i<global.player;i+=1){
	playerid[i] = instance_create_layer(x,y,layer,oPlayer);
	playerid[i].image_index=i;
	playerid[i].active = false;
	playerid[i].name = global.name[i];
	switch(i){
		//Create player at determined position, store at playerid
		case 0:
			playerid[i].x = 160;
			playerid[i].y = 400;
			break;
		case 1:
			playerid[i].x = 480;
			playerid[i].y = 400;
			break;
		case 2:
			playerid[i].x = 640;
			playerid[i].y = 400;
			break;
		case 3:
			playerid[i].x = 1000;
			playerid[i].y = 400;
			break;
	}
}

state = "start";	//Controller starting state;
curr_player=0;	//start active at player 0;
control_visible = true;

/*
//Create the oKeyboardDisplay and oNumberDisplay
kbup	= instance_create_layer(128,32,layer,oKeyboardDisplay);
virtual_key_add(128,32,59,66,vk_up);
kbleft	= instance_create_layer(48,96,layer,oKeyboardDisplay);
kbleft.image_index = 1;
virtual_key_add(48,96,59,66,vk_left);
kbdown	= instance_create_layer(128,160,layer,oKeyboardDisplay);
kbdown.image_index = 2;
virtual_key_add(128,160,59,66,vk_down);
kbright	= instance_create_layer(208,96,layer,oKeyboardDisplay);
kbright.image_index = 3;
virtual_key_add(208,96,59,66,vk_right);

agdisplay=instance_create_layer(112,96,layer,oNumberDisplay);

//Shotpower group
shotpowerup = instance_create_layer(864,32,layer,oKeyboardDisplay);
virtual_key_add(864,32,59,66,vk_pageup);
shotpowerup.image_index=0;
shotpowerdown	= instance_create_layer(864,160,layer,oKeyboardDisplay);
virtual_key_add(864,160,59,66,vk_pagedown);
shotpowerdown.image_index = 2;
shotpowerdisplay = instance_create_layer(848,96,layer,oNumberDisplay);

//Shottype group
shottypeup = instance_create_layer(1024,32,layer,oKeyboardDisplay);
virtual_key_add(1024,32,59,66,vk_home);
shottypeup.image_index=0;
shottypedown	= instance_create_layer(1024,160,layer,oKeyboardDisplay);
virtual_key_add(1024,160,59,66,vk_end);
shottypedown.image_index = 2;
shottypedisplay = instance_create_layer(1008,96,layer,oNumberDisplay);
*/

global.arenasurface = surface_create(room_width,room_height);