/// @description Insert description here
// You can write your code in this editor
//Draw cannon
draw_sprite_ext(sprTankGun,image_index,x,y,1,1,cannonangle,c_white,1);

//Draw self
draw_self();

//Draw name
draw_text_new(x-2,y+96+2,name, fa_center, fa_middle, fntRingbearer, c_black);
draw_text_new(x,y+96,name, fa_center, fa_middle, fntRingbearer, c_white);

if(active){
	draw_sprite(sprArrow,0,x,y-48);
}

//draw_hp
var i=0;
for(i=0;i<3;i+=1){
	if(hp>i){
		draw_sprite(sprHp,0,x-24+(i*24),y+64);
	}
	else{
		draw_sprite(sprHp,1,x-24+(i*24),y+64);
	}
}

if(trajectory){	//draw the trajectory;
	draw_set_color(c_red);
	var xnow,xnext,ynow,ynext;
	var max_draw_i = 1200;
	var i=1;
	xnow=x;
	ynow=y;
	xnext=x;
	ynext=y;
	var outofbound = (xnext<0 || ynext<0 || y>=room_height || x>=room_width);
	while(!outofbound){
		xnow=xnext;
		ynow=ynext;
		switch(trajtype){
			case 1:
				xnext = x+(i*image_xscale);
				ynext = y-(i*avariable) + bvariable;
				break;
			case 2:
				xnext = x+(i*image_xscale);
				ynext = y-(((i*i)*(avariable/10)) + (i*bvariable) + (cvariable));
				break;
			case 3:
				xnext = x+(i*image_xscale);
				ynext = y-(avariable*sin(degtorad(bvariable*i)));
				break;
			case 4:
				xnext = x+(i*image_xscale);
				ynext = y-(avariable*(logn(bvariable,i)));
				break;
			default:
				break;
		}
		//Draw here
		draw_line(xnow,ynow,xnext,ynext);
		
		i+=1;
		outofbound = (xnext<0 || ynext<0 || y>=room_height || x>=room_width || i>=max_draw_i);
	}
	
}