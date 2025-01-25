// ---MOVEMENT---

var horizontalDirection = input_check("right") - input_check("left");
var verticalDirection = input_check("down") - input_check("up");
	
hSpeed += horizontalDirection * acceleration;
hSpeed = min(abs(hSpeed), defaultSpeed) * sign(hSpeed);

//vSpeed += verticalDirection * acceleration * 0;
//vSpeed = min(abs(vSpeed), defaultSpeed) * sign(vSpeed);

if (horizontalDirection == 0)
{
	hSpeed -= sign(hSpeed) * deceleration;
}

//if (verticalDirection == 0)
{
	vSpeed -= sign(vSpeed) * deceleration;
}

if (abs(hSpeed) < deceleration)
{
	hSpeed = 0;
}

if (abs(vSpeed) < deceleration)
{
	vSpeed = 0;
}

// ---BUBBLES---

if (input_check("action") and air > 0)
{
	if (air > 0 and airInBubble < maxAirInBubble)
	{
		air--;
		airInBubble++;
	}
	else 
	{
		if (airInBubble == 0)
		{
			vSpeed = 4;
		}
	}
}
else 
{
	if (airInBubble > 0)
	{
		var inst = instance_create_depth(x + (52 + (airInBubble / maxAirInBubble) * 48) * image_xscale, y - 142, depth, o_bubble, 
		{
			air: airInBubble
		});
		
		vSpeed += airInBubble * airHeightFactor;
		airInBubble = 0;
	}
}

var sum = 0
with (o_bubble)
{
	if (place_meeting(x, y, other))
	{
		sum += 0.3;
	}
}

if (sum != 0)
{
	if (air < maxAir)
	{
		air++;
	}
}

vSpeed -= sum;

//if (air == maxAir)
//{
	//vSpeed = -5;
//}
//
//if (air == 0)
//{
	//vSpeed = 5;
//}

//if (input_check("rapidFire") and !place_meeting(x, y, o_airArea))
//{
	//if (air < maxAir)
	//{
		//air++;
		//vSpeed = -1;
	//}
	//
	////var rapidFireSize = 10;
	////
	////if (air > rapidFireSize)
	////{
		////
		////air -= rapidFireSize;
		////airInBubble += rapidFireSize;
		////
		////var inst = instance_create_depth(x + (52 + (airInBubble / maxAirInBubble) * 48) * image_xscale, y - 142, depth, o_bubble, 
		////{
			////air: airInBubble
		////});
		////
		////vSpeed = airInBubble * airHeightFactor;
		////airInBubble = 0;
	////}
//}

// ---AirPockets---

if (place_meeting(x, y, o_airArea)
	or !place_meeting(x, y, o_water))
{
	vSpeed += 1.5;
	vSpeed = min(vSpeed, 30);
	
	air++;
	air = min(air, maxAir);
}
else 
{
	//vSpeed -= sign(vSpeed) * deceleration;
	//if (abs(vSpeed) < deceleration)
	//{
		//vSpeed = 0;
	//}
}

if (sign(hSpeed) != 0)
{
	if (image_xscale != sign(hSpeed))
	{
		part_emitter_clear(_ps, _pemit1);
		part_emitter_stream(_ps, _pemit1, _ptype1, 0);
		
		image_xscale = sign(hSpeed);
	}
}

if (abs(hSpeed) > 0)
{
	sprite_index = s_submarineAnim;
	
	part_emitter_region(_ps, _pemit1, -27, 37, -49.875, 49.875, ps_shape_rectangle, ps_distr_linear);
	part_system_position(_ps, x - image_xscale * 250, y + 75);
	
	if (image_xscale == 1)
	{
		part_type_direction(_ptype1, 180 - 15, 180, -0.2, 10);
	}
	else 
	{
		part_type_direction(_ptype1, 0 + 15, 0, 0.2, 10);
	}
	
	part_emitter_stream(_ps, _pemit1, _ptype1, 1);
}
else 
{
	part_emitter_clear(_ps, _pemit1);
	part_emitter_stream(_ps, _pemit1, _ptype1, 0);
	
	sprite_index = s_submarine;
}

phy_speed_x = hSpeed;
phy_speed_y = vSpeed;