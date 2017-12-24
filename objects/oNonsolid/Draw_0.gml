/// @description One draw event only
// You can write your code in this editor

//trigger draw event from oDestructibleArena and self
if(surface_exists(global.arenasurface)){
	surface_set_target(global.arenasurface);
	draw_sprite_ext(oDestructibleArena.sprite_index,0,oDestructibleArena.x,oDestructibleArena.y,1,1,0,c_white,1);
	surface_reset_target();
}
else{
	global.arenasurface = surface_create(room_width,room_height);
	surface_set_target(global.arenasurface);
	draw_sprite_ext(oDestructibleArena.sprite_index,0,oDestructibleArena.x,oDestructibleArena.y,1,1,0,c_white,1);
	surface_reset_target();
}

//draw self
surface_set_target(global.arenasurface);
gpu_set_blendmode(bm_subtract);;
draw_self();
gpu_set_blendmode(bm_normal);
surface_reset_target();

//Draw the surface
//draw_surface(global.arenasurface,0,0);

//create sprite
spr = sprite_create_from_surface(global.arenasurface,0,0,1280,720,false,false,0,0);
oDestructibleArena.sprite_index=spr;
oDestructibleArena.x = 0;
oDestructibleArena.y = 0;
sprite_collision_mask(spr,true,0,0,1280,0,720,0,5);
instance_destroy();