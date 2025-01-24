// ---MOVEMENT---

var horizontalDirection = input_check("right") - input_check("left");
var verticalDirection = input_check("down") - input_check("up");
	
hspeed += horizontalDirection * acceleration;
vspeed += verticalDirection * acceleration * 0;
	
hspeed = min(abs(hspeed), defaultSpeed) * sign(hspeed);
vspeed = min(abs(vspeed), defaultSpeed) * sign(vspeed);

if (horizontalDirection == 0)
{
	hspeed -= sign(hspeed) * deceleration;
}

if (verticalDirection == 0)
{
	vspeed -= sign(vspeed) * deceleration;
}
	
if (abs(hspeed) < deceleration)
{
	hspeed = 0;
}

if (abs(vspeed) < deceleration)
{
	vspeed = 0;
}

// ---BUBBLES---

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
		var inst = instance_create_depth(x, y - 16, depth, o_bubble);
		inst.air = airInBubble;
		
		vspeed = airInBubble * 0.5;
		airInBubble = 0;
	}
}

// ---AirPockets---

if (place_meeting(x, y, o_airArea))
{
	if (air < maxAir)
	{
		air++;
		vspeed -= 0.5;
	}
	air = min(air, maxAir);
}