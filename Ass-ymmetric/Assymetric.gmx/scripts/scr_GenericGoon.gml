///initialise variables
hspeed = 0;
vspeed = 0;
jumpspeed = 7;
movespeed = 2;
movespeed2 = 0.5;

Health = 50;
spawn = 0;
spawn2 = 0;

gamepad_set_axis_deadzone(cont,0.2);

///move and collide.

// get players input
key_right = (gamepad_axis_value(cont,gp_axislh) > 0);
key_left = -((gamepad_axis_value(cont,gp_axislh) < 0));
key_up = -((gamepad_axis_value(cont,gp_axislv) < 0));
key_down = (gamepad_axis_value(cont,gp_axislv) > 0);

//react to inputs move.
if (!gamepad_button_check(cont, gp_face1))
{
move = key_left + key_right;
hspeed = move * movespeed;

moveV = key_up + key_down;
vspeed = moveV * movespeed;
}
else
{
move = key_left + key_right;
hspeed = move * movespeed2;

moveV = key_up + key_down;
vspeed = moveV * movespeed2;
}

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
if (place_meeting(x,y+vspeed,obj_wallv))
{
    while(!place_meeting(x,y+sign(vspeed),obj_wallv))
    {
        y += sign(vspeed);
    }
    vspeed = 0;
}

y += vspeed;
//melee sprite
if (place_meeting(x+hspeed,y,obj_heroattack))
{
    audio_play_sound(snd_shatter, 50, false);
    instance_destroy()
}

///shooting

//initialise variables/states
gamepad_set_axis_deadzone(cont,0.2);
var haxis,vaxis,bulletspeed,bulletdirection,shotcooldown;
//define variables
haxis = gamepad_axis_value(cont, gp_axislh);
vaxis = gamepad_axis_value(cont, gp_axislv);
bulletdirection = point_direction(0, 0, haxis, vaxis);

//facebullet
if (gamepad_axis_value(cont, gp_axislh) < 0)
    {
        image_xscale = 1;
        buffer = 40;
    }
else if (gamepad_axis_value(cont, gp_axislh) > 0)
    {
        image_xscale = -1;
        buffer = -40;
    }
if (gamepad_axis_value(cont, gp_axislh) > 0)||(gamepad_axis_value(cont, gp_axislh) < 0)||(gamepad_axis_value(cont, gp_axislv) < 0)||(gamepad_axis_value(cont, gp_axislv) > 0)
    {
        image_speed = 1;
    }
else
    {
    image_index = 0;
    image_speed = 0;
    }
bulletspeed = 0;
shotcooldown = 0;

//Aiming
if (haxis > 0) || (haxis < 0) || (vaxis > 0) || (vaxis < 0)
{
    action_create_object_motion(bullet,x - buffer,y - 48,bulletspeed, bulletdirection);
}
//shoot a bullet

//if (gamepad_button_check_pressed(cont, gp_shoulderrb) && /*(shotcooldown <= 0)*/ (instance_number(bullet) = 0))then{
//action_create_object_motion(bullet,x,y,bulletspeed, bulletdirection);
if (gamepad_button_check(cont, gp_face1)) //&& ((haxis > 0) || (haxis < 0) || (vaxis > 0) || (vaxis < 0))
{
    if charge = 0
    {
        action_create_object(chargesh,x-buffer,y-48)
        charge = 1;
        //action_create_object_motion(bulletID,x,y,bulletspeed, bulletdirection);
    }
    
    if charge > 0 
    {
        charge += 1;
        if charge > 90
        {
            charge = 90;
        }
    }
    if ((charge = 20) && (spawn = 0))
    {
        audio_play_sound(snd_chargeup1, 10, false);
        spawn = 1;
    }
    if (charge = 80)
    {
        audio_play_sound(snd_ding_, 70, false);
        audio_play_sound(snd_chargehum, 50, false);
    }
}

if (gamepad_button_check_released(cont, gp_face1)) //&& ((haxis > 0) || (haxis < 0) || (vaxis > 0) || (vaxis < 0))
{

        with (chargesh)
            {
            instance_destroy()
            }
    if charge = 0
    {
        charge = 0;
        exit;
    }
    
    if charge > 20 && charge < 80
    {
        audio_stop_sound(snd_chargeup1);
        charge = 0;
        exit;
    }
    
    if charge > 80
    {
        action_create_object_motion(bulletID,x - buffer,y-48,bulletspeed, bulletdirection);
        audio_play_sound(snd_playerhit2, 100, false);
        charge = 0;
        audio_stop_sound(snd_chargehum);
    }
}


//time between shots
shotcooldown = 500;;

//cooldowntimer
if shotcooldown >= 0 then{
shotcooldown = shotcooldown -1;
};
