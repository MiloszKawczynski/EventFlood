physics_apply_force(x, y, 0, -air * 5);

if (place_meeting(x, y, o_airArea))
{
	instance_destroy();
}