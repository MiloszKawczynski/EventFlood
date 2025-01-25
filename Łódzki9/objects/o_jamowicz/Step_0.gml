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
		with(instance_nearest(x, y, o_jamowiczTorso))
		{
			part_system_position(_ps, x, y);
			part_emitter_burst(_ps, _pemit1, _ptype1, 150);
			part_emitter_burst(_ps, _pemit2, _ptype2, 24);
		}
		
		instance_destroy();
	}
}
else 
{
	//physics_apply_force(phy_com_x, phy_com_y, 0, -390);
	phy_speed_y = 0;
}