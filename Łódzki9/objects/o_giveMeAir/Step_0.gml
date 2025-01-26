image_xscale = 1 + animcurve_get_point(ac_helpMe, 0, time);
image_yscale = 1 + animcurve_get_point(ac_helpMe, 0, time + 0.1);

time = timer(time, 0.037, 1);

if (instance_nearest(x, y, o_jamowicz).isAired == true or image_alpha != 1)
{
	image_alpha -= 0.01;
	
	if (image_alpha <= 0)
	{
		instance_destroy();
	}
}