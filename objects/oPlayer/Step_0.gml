 /// @description Action if active
//Active code
			hspd = 0;
if(active){
	//Can read input
	var mv_right = keyboard_check(vk_right);
	var mv_left = keyboard_check(vk_left);
	var tap_left = keyboard_check_pressed(vk_left);
	var tap_right = keyboard_check_pressed(vk_right);
	var mv_up = keyboard_check(vk_up);
	var mv_down = keyboard_check(vk_down);
	var typeup = keyboard_check_pressed(vk_home);
	var typedown = keyboard_check_pressed(vk_end);
	var avarup = keyboard_check(vk_pageup);
	var avardown = keyboard_check(vk_pagedown);
	var bvarup = keyboard_check(vk_insert);
	var bvardown = keyboard_check(vk_delete);
	var cvarup = keyboard_check(vk_shift);
	var cvardown = keyboard_check(vk_control);

	var kb_space = keyboard_check_pressed(vk_space);
	
	
	switch(state){
		case "idle":
			break;
		case "aim":
			oController.control_visible = true;
			state="move";
			curr_move=maxmove;	//Reset amount of move that can be performed
			//Create formula display
			formula = instance_create_layer(room_width/2, room_height-140, layer, oFormula);
			typelabel.text = "Shot Type";
			break;
		case "move":
			//Cannon Angle
			formula.image_index=trajtype-1;
			
			//Move
			if(tap_right && curr_move>0){
				hspd+=mvstep;
				curr_move-=1;
				image_xscale=1;
			}
			if(tap_left && curr_move>0){
				hspd-=mvstep;
				curr_move-=1;
				image_xscale = -1;
			}
			
			//Shot trajectory type
			if(typedown){
				trajtype-=1;	
			}
			if(typeup){
				trajtype+=1;	
			}
			trajtype = clamp(trajtype,1,4);	//1 to 4: direct shoot, high trajectory, crazy sheep, guided arms
			typedisplay.text = string(trajtype);
			switch(trajtype){
				case 1:
					atext.text = "M";
					btext.text = "N";
					ctext.text = "";
					//Avar. Scale the increment or decreement
					if(avariable>=2){
						avariable+=(avarup-avardown);
					}
					else if(avariable>=1){
						avariable+=avarup;
						avariable-=(avardown*0.1)
					}
					else{
						avariable+=(0.1*(avarup-avardown));	
					}
					avariable = clamp(avariable,0,10);
					
					//bavar
					bvariable+=(bvarup-bvardown);
					bvariable = clamp(bvariable,-10,40);
					
					break;
				case 2:
					atext.text = "A";
					btext.text = "B";
					ctext.text = "C";
					
					//Avar
					if(avariable<=-2){
						avariable +=(avarup-avardown);	
					}
					else if(avariable<=-1){
						avariable+=avarup*0.01;
						avariable-=avardown;
					}
					else{
						avariable+=(0.01*(avarup-avardown));	
					}
					avariable = clamp(avariable,-1,0);
					
					//Bvar
					bvariable+=(bvarup-bvardown)*0.1;
					bvariable = clamp(bvariable,1,4);
					
					//Cvar
					cvariable+=((cvarup-cvardown)*10);
					cvariable = clamp(cvariable,-40,10);
					break;
				case 3:
					atext.text = "A";
					btext.text = "B";
					ctext.text = "";
					
					//Avar
					avariable+=(avarup-avardown);
					avariable = clamp(avariable,1,60);
					
					//Bvar
					bvariable+=(bvarup-bvardown);
					bvariable = clamp(bvariable,1,10);
					
					break;
				case 4:
					atext.text = "A";
					btext.text = "B";
					ctext.text = "";
					
					//Avar
					avariable+=(avarup-avardown);
					avariable = clamp(avariable,1,30);
					
					//Bvar
					bvariable+=(bvarup-bvardown);
					bvariable = clamp(bvariable,2,10);
				
					break;					
			}
			
			//Display text
			adisplay.text = string(avariable);
			bdisplay.text = string(bvariable);
			cdisplay.text = string(cvariable);
			
			//Calculate cannon angle
				var xaim,yaim;
				var i=1;
				{
					switch(trajtype){
						case 1:
							xaim = x+(i*image_xscale);
							yaim = y-(i*avariable);
							break;
						case 2:
							xaim = x+(i*image_xscale);
							yaim = y-(((i*i)*(avariable/10)) + (i*bvariable) + (cvariable));
							break;
						case 3:
							xaim = x+(i*image_xscale);
							yaim = y-(avariable*sin(degtorad(bvariable*i)));
							break;
						case 4:
							xaim = x+(i*image_xscale);
							yaim = y-(avariable*(logn(bvariable,i)));
							break;
						default: break;
					}
				}
				var angle = point_direction(x,y,xaim,yaim);
				cannonangle = clamp(cannonangle, -10, 190);
				cannonangle = angle;
			
			//Press space to shoot
			if(kb_space){
				instance_destroy(formula,true);
				state = "shoot";
			}
			
			break;
		case "shoot":
			oController.control_visible = false;
			var cannonball = instance_create_layer(x,y,layer,oCannonBall);
			cannonball.cannonangle = cannonangle;
			cannonball.xorigin = x;
			cannonball.yorigin = y;
			cannonball.image_xscale = image_xscale;
			cannonball.trajtype = trajtype;
			cannonball.avariable = avariable;
			cannonball.bvariable = bvariable;
			cannonball.cvariable = cvariable;
			cannonball.shooter = id;
			cannonball.grav = grav;
			audio_play_sound(sndShoot,10,false);
			
			trajectory = true;
			alarm[0] = room_speed*2;
			
			atext.text = "";
			btext.text = "";
			ctext.text = "";
			typelabel.text= "";
			
			state="shoot_wait";
			break;
		case "shoot_wait":
			break;
		case "shot_finished":
			oController.state="next_player";
			trajectory=false;
			break;
	}
}
else if(hp<=0){
	instance_destroy();	
}

//Horizontal movement
//nonsolid verification
if(place_meeting(x+hspd,y,oSolid)){
	//Check 45 degree up
	if(!place_meeting(x+hspd,y-(2*abs(hspd)),oSolid)){
		x+=hspd;
		y-=2*abs(hspd);
	}
	else{	
		while(!place_meeting(x+sign(hspd),y,oSolid)){
			x+=sign(hspd);
		}
		hspd=0;
	}
}
else{
	x+=hspd;	
}
//Clamp x
x = clamp(x,0,room_width);

// Gravity calculation
vspd+=tankgrav;

//Solid collision
if(place_meeting(x,y+vspd,oSolid)){
	while(!place_meeting(x,y+sign(vspd),oSolid)){
		y+=sign(vspd);
	}
	vspd=0;
}
else{
	y+=vspd;	
}