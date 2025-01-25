if (isHead and !isAired)
{
	var inst = instance_place(x, y, o_bubble);
	if (inst != noone)
	{
		isAired = true;
		
		physics_joint_rope_create(id, o_player, x, y, o_player.x, o_player.y, 450, true);
		
		image_xscale = 2;
		image_yscale = 2;
		
		instance_destroy(inst);
	}
}

if (isAired)
{
	physics_apply_force(x, y, 0, -3000 * 32);
	
	if (!place_meeting(x, y, o_water))
	{
		instance_destroy();
	}
}
else 
{
	//physics_apply_force(phy_com_x, phy_com_y, 0, -390);
	phy_speed_y = 0;
}