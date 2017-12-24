/// @description Fly the cannonball until out of the room
// Will calculate it's trajectory
/*
			cannonball.cannonangle = cannonangle;
			cannonball.trajtype = trajtype;
			cannonball.avariable = avariable;
			cannonball.bvariable = bvariable;
			cannonball.cvariable = cvariable;
			cannonball.shooter = id;
			cannonball.grav = grav;
*/
repeat(shootspeed){
	switch(trajtype){
		case 1:
			xnext = xorigin+(lifestep*image_xscale);
			ynext = yorigin-(lifestep*avariable) + bvariable;
			break;
		case 2:
			xnext = xorigin+(lifestep*image_xscale);
			ynext = yorigin-(((lifestep*lifestep)*(avariable/10)) + (lifestep*bvariable) + (cvariable));
			break;
		case 3:
			xnext = xorigin+(lifestep*image_xscale);
			ynext = yorigin-(avariable*sin(degtorad(bvariable*lifestep)));
			break;
		case 4:
			xnext = xorigin+(lifestep*image_xscale);
			ynext = yorigin-(avariable*(logn(bvariable,lifestep)));
			break;
		default: break;
	}
	//Move the cannonball
	x = xnext;
	y = ynext;

	lifestep+=1;
	var outofbound = (x<0 || y<0 || y>=room_height || x>=room_width);
	var hit = (place_meeting(x,y,oPlayer));
	var solidhit = (place_meeting(x,y,oSolid));
	if(outofbound){
		shooter.state = "shot_finished";
		instance_destroy();	
	}
	else if(hit){
		var hitted = instance_place(x,y,oPlayer);
		if(hitted!=shooter){	//Only if not hitting the shooter
			hitted.hp-=1;
			shooter.scores+=100;
			var explode = instance_create_layer(x,y,layer,oHitEffect);
			explode.shooter = shooter;
			instance_destroy();
		}
	}
	else if(solidhit){
		//Check if is at nonsolid
		var nons = place_meeting(x,y,oNonsolid);
		if(!nons){
			//Create a oNonsolidcircle
			instance_create_layer(x,y,layer,oNonsolid);
			var explode = instance_create_layer(x,y,layer,oHitEffect);
			explode.shooter = shooter;
			instance_destroy();
		}
	}
}