///initialise variables
hspeed = 0;
vspeed = 0;
jumpspeed = 7;
movespeed = 4;

image_xscale = 0.5;
image_yscale = 0.5;

Health = 50;

gamepad_set_axis_deadzone(cont,0.2);

///move and collide.

// get players input
key_right = (gamepad_axis_value(cont,gp_axislh) > 0);
key_left = -((gamepad_axis_value(cont,gp_axislh) < 0));
key_up = -((gamepad_axis_value(cont,gp_axislv) < 0));
key_down = (gamepad_axis_value(cont,gp_axislv) > 0);

//react to inputs move.
move = key_left + key_right;
hspeed = move * movespeed;

moveV = key_up + key_down;
vspeed = moveV * movespeed;

//death
/*if (Health <= 0)
{
    instance_destroy();
}
*/

// horizontal collision

if (place_meeting(x+hspeed,y,obj_wall))
{
    while(!place_meeting(x+sign(hspeed),y,obj_wall))
    {
       x += sign(hspeed);
    }
    hspeed = 0;
}
x += hspeed;

// verticle collision
if (place_meeting(x,y+vspeed,obj_wall))
{
    while(!place_meeting(x,y+sign(vspeed),obj_wall))
    {
        y += sign(vspeed);
    }
    vspeed = 0;
}

y += vspeed;
//melee sprite
if (place_meeting(x+hspeed,y,obj_heroattack))
{
    instance_destroy()
}

///shooting

//initialise variables/states
gamepad_set_axis_deadzone(cont,0.2);
var haxis,vaxis,bulletspeed,bulletdirection,shotcooldown;
//define variables
haxis = gamepad_axis_value(cont, gp_axisrh);
vaxis = gamepad_axis_value(cont, gp_axisrv);
bulletdirection = point_direction(0, 0, haxis, vaxis);
bulletspeed = 50;
shotcooldown = 0;
//shoot a bullet

if (gamepad_button_check_pressed(cont, gp_shoulderrb) && /*(shotcooldown <= 0)*/ (instance_number(bullet) = 0))then{
action_create_object_motion(bullet,x,y,bulletspeed,bulletdirection);

//facebullet
image_angle = bulletdirection;
//time between shots
shotcooldown = 500;
};

//cooldowntimer
if shotcooldown >= 0 then{
shotcooldown = shotcooldown -1;
};
