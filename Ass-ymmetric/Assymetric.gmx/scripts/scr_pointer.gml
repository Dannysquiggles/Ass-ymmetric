
//select player
if (instance_number(player) = 1)
{
    x = player.x;
    y = player.y+40;
}
//initialise variables/states
gamepad_set_axis_deadzone(cont,0.2);
var haxis,vaxis,bulletspeed,bulletdirection,shotcooldown;
//define variables
haxis = gamepad_axis_value(cont, gp_axisrh);
vaxis = gamepad_axis_value(cont, gp_axisrv);
bulletdirection = point_direction(0, 0, haxis, vaxis);

//facebullet
image_angle = bulletdirection;
