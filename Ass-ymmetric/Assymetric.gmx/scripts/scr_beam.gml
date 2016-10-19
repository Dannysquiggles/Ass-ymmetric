///beams colliding
if (states.hero1)
{
    if(place_meeting(x,y,obj_player1state))
    {
    collide = 'true';
    }
}
if (states.hero2)
{
    if(place_meeting(x,y,obj_player2state))
    {
    collide = 'true';
    }
}
if (states.hero3)
{
    if(place_meeting(x,y,obj_player3state))
    {
    collide = 'true';
    }
}
if (states.hero4)
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

