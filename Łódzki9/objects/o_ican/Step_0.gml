if (acitve)
{
	image_alpha += 0.05;
	
	if (image_alpha >= 1)
	{
		wasActivated = true;
		acitve = false;
	}
}

if (wasActivated)
{
	if (place_meeting(x, y, o_player) or image_alpha != 1)
	{
		image_alpha -= 0.01;
		
		if (image_alpha <= 0)
		{
			instance_destroy();
		}
	}
}