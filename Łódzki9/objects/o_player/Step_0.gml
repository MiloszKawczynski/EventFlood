// ---MOVEMENT---

var horizontalDirection = input_check("right") - input_check("left");
	
hSpeed += horizontalDirection * acceleration;
hSpeed = min(abs(hSpeed), defaultSpeed) * sign(hSpeed);

if (horizontalDirection == 0)
{
	hSpeed -= sign(hSpeed) * deceleration;
}

if (abs(hSpeed) < deceleration)
{
	hSpeed = 0;
}

// ---BUBBLES---

if (input_check("up"))
{
	y--;
}

if (input_check("action") and !place_meeting(x, y, o_airArea))
{
	if (air > 0 and airInBubble < maxAirInBubble)
	{
		air--;
		airInBubble++;
	}
}
else 
{
	if (airInBubble > 0)
	{
		var inst = instance_create_depth(x + (52 + airInBubble * 3) * image_xscale, y - 142, depth, o_bubble, 
		{
			air: airInBubble
		});
		
		vSpeed = airInBubble * 0.5;
		airInBubble = 0;
	}
}

// ---AirPockets---

if (place_meeting(x, y, o_airArea))
{
	vSpeed += 1;
	vSpeed = min(vSpeed, 30);
	air++;
	air = min(air, maxAir);
}
else 
{
	vSpeed -= sign(vSpeed) * deceleration;
	if (abs(vSpeed) < deceleration)
	{
		vSpeed = 0;
	}
}

if (sign(hSpeed) != 0)
{
	image_xscale = sign(hSpeed);
}


x += hSpeed;
y += vSpeed;