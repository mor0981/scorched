/// @description Player's tank creation code
// This is the initialization code.
image_speed=0;
grav = 0.02; //amount of positive y speed added each step.
tankgrav = 2;
vspd = 0;
hspd = 0;
active=false;
cannonangle=0;	//cannon start at 0 degree
anglestep=1;	//Cannon angle change increment at 1 degree;
mvstep=6;		//Movement is at 1 increment;
curr_move=5;
maxmove=5;		//Max move per turn is 5 step;
trajectory = false;
trajtype = 1;	//1,2,3,4
avariable = 2;
bvariable = 2;
cvariable = 2;
hp = 3;
state="idle";
name = "Noone";
scores = 0;