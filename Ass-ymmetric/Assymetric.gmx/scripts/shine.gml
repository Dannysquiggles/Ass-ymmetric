///adjust x/y axis for sprite
ogx = player.x;
ogy = player.y;
//determine frame of anim
if (image_index == 0)
{
    x = ogx;
    y = ogy;
}
if (image_index == 1)
{
    x = ogx - 68;
    y = ogy - 14;
}
if (image_index == 2)
{
    x = ogx + 32;
    y = ogy - 42;
}
if (image_index == 3)
{
    x = ogx + 122;
    y = ogy - 49;
}
//adjust acording.
