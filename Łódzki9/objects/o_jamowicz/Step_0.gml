if (isHead and !isAired)
{
	var inst = instance_place(x, y, o_bubble);
	if (inst != noone)
	{
		if (inst.gayzar == false)
		{
			isAired = true;
			
			physics_joint_rope_create(id, o_player, x, y, o_player.x, o_player.y, 450, true);
			
			image_xscale = 2;
			image_yscale = 2;
			
			instance_destroy(inst);
		}
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
		
		with(o_gameManager.ui)
		{
			switch(other.image_index)
			{
				case(0):
				{
					Julka.state.setSpriteSheet(s_head, 0);
					break;
				}
				
				case(1):
				{
					Karolina.state.setSpriteSheet(s_head, 1);
					break;
				}
				
				case(2):
				{
					Milosz.state.setSpriteSheet(s_head, 2);
					audio_play_sound(dthMilosz, 0, false);
					break;
				}
				
				case(3):
				{
					Potax.state.setSpriteSheet(s_head, 3);
					audio_play_sound(dthManus, 0, false);
					break;
				}
				
				case(4):
				{
					Swistak.state.setSpriteSheet(s_head, 4);
					audio_play_sound(dthSwistak, 0, false);
					break;
				}
			}
		}
		
		if (instance_number(o_jamowicz) == 1)
		{
			instance_nearest(x, y, o_jamowiczTorso).alarm[0] = 10;
		}
		
		instance_destroy();
	}
}
else 
{
	//physics_apply_force(phy_com_x, phy_com_y, 0, -390);
	phy_speed_y = 0;
}