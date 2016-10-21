draw_sprite(spr_player1H,0,x,y)
draw_set_color(argument1)
if !place_meeting(x,y-1,obj_player1state)
{
draw_line_width(x,y,x+32,y,argument0)
}
if !place_meeting(x,y+1,obj_player1state)
{
draw_line_width(x,y+32,x+32,y+32,argument0)
}
if !place_meeting(x-1,y,obj_player1state)
{
draw_line_width(x,y,x,y+32,argument0)
}
if !place_meeting(x+1,y,obj_player1state)
{
draw_line_width(x+32,y,x+32,y+32,argument0)
}
