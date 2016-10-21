///initialise variables
depth = -y-2;
if flashed = 0
{
instance_create(x,y,flash)
flashed = 1;
}
hspeed = 0;
vspeed = 0;
jumpspeed = 7;
movespeed = 3.0;
dashspeed = 140;

Health = 100;
image_speed = 0.25;
spawn = 0;

gamepad_set_axis_deadzone(cont,0.2);


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
if (place_meeting(x,(y + 100)+vspeed,obj_wallv))
{
    while(!place_meeting(x,(y + 100 )+sign(vspeed),obj_wallv))
    {
        y += sign(vspeed);
    }
    vspeed = 0;
}

y += vspeed;
//die & change state

if (global.shield == 'false')
{
if (instance_number(flash) = 0)
{
    if (place_meeting(x,y+vspeed,obj_b)||place_meeting(x,y+vspeed,obj_be)) && (!global.State == states.hero1)
    {
        global.State = states.hero1
        with (obj_b)
        {
        instance_destroy();
        }
        instance_destroy();
        instance_create(x, y, obj_screenshake);
        audio_play_sound(snd_shatter, 50, false);
    }
    if (place_meeting(x,y+vspeed,obj_bg)||place_meeting(x,y+vspeed,obj_beg))
    {
        global.State = states.hero2
         with (obj_bg)
        {
        instance_destroy();
        }
        instance_destroy();
        instance_create(x, y, obj_screenshake);
        audio_play_sound(snd_shatter, 50, false);
    }
    if (place_meeting(x,y+vspeed,obj_bp)||place_meeting(x,y+vspeed,obj_bep))
    {        
        global.State = states.hero3
         with (obj_bp)
        {
        instance_destroy();
        }
        instance_destroy();
        instance_create(x, y, obj_screenshake);
        audio_play_sound(snd_shatter, 50, false);        
    }
    if (place_meeting(x,y+vspeed,obj_by)||place_meeting(x,y+vspeed,obj_bey))
    {
        global.State = states.hero4
         with (obj_by)
        {
        instance_destroy();
        }
        instance_destroy();
        instance_create(x, y, obj_screenshake);
        audio_play_sound(snd_shatter, 50, false);
    }   
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
gamepad_set_axis_deadzone(cont,0.2);
var haxis,vaxis,bulletspeed,bulletdirection,shotcooldown;
//define variables
haxis = gamepad_axis_value(cont, gp_axislh);
vaxis = gamepad_axis_value(cont, gp_axislv);
bulletdirection = point_direction(0, 0, haxis, vaxis);
bulletspeed = 0;
shotcooldown = 0;
if (global.shotcooldown == 0) && (instance_number(hero_glow) == 0)
{
    instance_create(x,y,hero_glow)
}
//sprite direction
if (gamepad_axis_value(cont, gp_axislh) <0)
{
sprite_index = sprite2
image_xscale = -1;
global.dir = -1;
}
else if (gamepad_axis_value(cont, gp_axislh) > 0)
{
sprite_index = sprite2
image_xscale = 1;
global.dir = 1;
}
else
{
sprite_index = sprite1
}
global.im = image_index;
global.sprite = sprite_index;
///Dash

if (gamepad_button_check_pressed(cont, gp_face1) && (global.shotcooldown <= 0))then{
action_create_object_motion(obj_heroattack,x,y,bulletspeed,bulletdirection);
move = key_left + key_right;
hspeed = move * dashspeed;

moveV = key_up + key_down;
vspeed = moveV * dashspeed;
audio_play_sound(snd_laser, 80, false);
var dash = instance_create(x, y, obj_dasheffect);
dash.sprite_index = sprite_index;
dash.image_index = image_index;
alarm[0] = 90;
global.shotcooldown = 1;
with (hero_glow)
{
    instance_destroy();
}
}


