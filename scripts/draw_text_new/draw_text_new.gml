///@description draw_text_new(x,y,text,halign,valign,font,color)
//Proper use is draw_text_new(x,y,text,halign,valign,font,color)
var xpos = argument0;
var ypos = argument1;
var txt = argument2;
var alignh = argument3;
var alignv = argument4;
var fnt = argument5;
var color = argument6;
draw_set_halign(alignh);
draw_set_valign(alignv);
draw_set_color(color);
draw_set_font(fnt);
draw_text(xpos,ypos,txt);