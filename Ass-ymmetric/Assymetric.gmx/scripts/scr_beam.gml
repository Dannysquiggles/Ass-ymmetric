///beams colliding
//image_xscale = image_xscale * -1;
image_speed = 0.25;
if (global.State == states.hero1)
{
    if(place_meeting(x,y,obj_player1state))
    {
    collide = 'true';
    }
}
if (global.State == states.hero2)
{
    if(place_meeting(x,y,obj_player2state))
    {
    collide = 'true';
    }
}
if (global.State == states.hero3)
{
    if(place_meeting(x,y,obj_player3state))
    {
    collide = 'true';
    }
}
if (global.State == states.hero4)
{
    if(place_meeting(x,y,obj_player4state))
    {
    collide = 'true';
    }
}
if (place_meeting(x,y,obj_wall))
{
collide = 'true';
}
if (place_meeting(x,y,obj_wallv))
{
collide = 'true';
}
if (place_meeting(x,y,obj_box))
{
    collide = 'true';
}


