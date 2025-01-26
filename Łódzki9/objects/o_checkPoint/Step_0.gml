if (place_meeting(x, y, o_player))
{
	if (instance_exists(o_ican))
	{
		if (o_ican.image_alpha == 0)
		{
			o_ican.acitve = true;
		}
	}
}