alarm[0] = random(20) + 1;

repeat(2)
{
	var air = random(1);
	
	var inst = instance_create_depth(x + random_range(-50, 50), y, depth, o_bubble, 
	{
		air: air * o_player.maxAirInBubble
	});
}