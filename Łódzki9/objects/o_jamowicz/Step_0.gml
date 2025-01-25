if (isHead and !isAired)
{
	var inst = instance_place(x, y, o_bubble);
	if (inst != noone)
	{
		isAired = true;
		
		image_xscale = 2;
		image_yscale = 2;
		
		instance_destroy(inst);
	}
}

if (isAired)
{
	physics_apply_force(x, y, 0, -15 * 32);
}
else 
{
	physics_apply_force(phy_com_x, phy_com_y, 0, -390);
}