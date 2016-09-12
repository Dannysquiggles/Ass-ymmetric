///initialise variables
hspeed = 0;
vspeed = 0;
jumpspeed = 7;
movespeed = 5;
dashspeed = 70;

Health = 100;

spawn = 0;

gamepad_set_axis_deadzone(cont,0.2);

///move and collide.

// get players input
key_right = (gamepad_axis_value(cont,gp_axislh) > 0);
key_left = -(gamepad_axis_value(cont,gp_axislh) < 0);
key_up = -(gamepad_axis_value(cont,gp_axislv) < 0);
key_down = (gamepad_axis_value(cont,gp_axislv) > 0);

//react to inputs
move = key_left + key_right;
hspeed = move * movespeed;

moveV = key_up + key_down;
vspeed = moveV * movespeed;


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
//die & change state

if (global.shield == 'false')
{
    if (place_meeting(x,y+vspeed,obj_bullet1))
    {
        global.State = states.hero1
        instance_destroy();
    
        instance_create(x, y, obj_screenshake);
        audio_play_sound(snd_shatter, 50, false);
    }
    if (place_meeting(x,y+vspeed,obj_bullet2))
    {
        global.State = states.hero2;
        instance_destroy();
    
        instance_create(x, y, obj_screenshake);
        audio_play_sound(snd_shatter, 50, false);
    }
    if (place_meeting(x,y+vspeed,obj_bullet3))
    {
        global.State = states.hero3;
        instance_destroy();
    
        instance_create(x, y, obj_screenshake);
        audio_play_sound(snd_shatter, 50, false);
    }
    if (place_meeting(x,y+vspeed,obj_bullet4))
    {
        global.State = states.hero4;
        instance_destroy();
    
        instance_create(x, y, obj_screenshake);
        audio_play_sound(snd_shatter, 50, false);
    }   
}
///attacke
///melee attack

/*if ((gamepad_button_check(1, gp_face1)) && spawn = 0)
{
    instance_create(x,y, obj_heroattack);
    alarm[0] = 60;
    spawn = 1;
}
*/

//initialise variables/states
gamepad_set_axis_deadzone(cont,0.4);
var haxis,vaxis,bulletspeed,bulletdirection,shotcooldown;
//define variables
haxis = gamepad_axis_value(cont, gp_axisrh);
vaxis = gamepad_axis_value(cont, gp_axisrv);
bulletdirection = point_direction(0, 0, haxis, vaxis);
bulletspeed = 0;
shotcooldown = 0;
//shoot a bullet

if (gamepad_button_check_pressed(cont, gp_face1) && (shotcooldown <= 0))then{
action_create_object_motion(obj_heroattack,x,y,bulletspeed,bulletdirection);
move = key_left + key_right;
hspeed = move * dashspeed;

moveV = key_up + key_down;
vspeed = moveV * dashspeed;
audio_play_sound(snd_laser, 80, false);
}


