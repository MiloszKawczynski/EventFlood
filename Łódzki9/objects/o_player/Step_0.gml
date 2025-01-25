// ---MOVEMENT---

var horizontalDirection = input_check("right") - input_check("left");
var verticalDirection = input_check("down") - input_check("up");
	
hSpeed += horizontalDirection * acceleration;
hSpeed = min(abs(hSpeed), defaultSpeed) * sign(hSpeed);

vSpeed += verticalDirection * acceleration;
vSpeed = min(abs(vSpeed), defaultSpeed) * sign(vSpeed);

if (horizontalDirection == 0)
{
	hSpeed -= sign(hSpeed) * deceleration;
}

if (verticalDirection == 0)
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
	//vSpeed -= sign(vSpeed) * deceleration;
	//if (abs(vSpeed) < deceleration)
	//{
		//vSpeed = 0;
	//}
}

if (sign(hSpeed) != 0)
{
	image_xscale = sign(hSpeed);
}

//x += hSpeed;
//y += vSpeed;

//if (place_meeting(x + hSpeed, y, o_staticParent))
//{
	//while (!place_meeting(x + sign(hSpeed), y , o_staticParent))
	//{
		//x += sign(hSpeed) * 0.5;
	//}
		//
	//hSpeed = 0;
//}
//
//if (place_meeting(x, y + vSpeed, o_staticParent))
//{
	//while (!place_meeting(x, y + sign(vSpeed), o_staticParent))
	//{
		//y += sign(vSpeed) * 0.5;
	//}
		//
	//vSpeed = 0;
//}
//
//if (place_meeting(x + hSpeed, y + vSpeed, o_staticParent))
//{
	//while (!place_meeting(x + sign(hSpeed), y + sign(vSpeed), o_staticParent))
	//{
		//x += sign(hSpeed) * 0.5;
		//y += sign(vSpeed) * 0.5;
	//}
		//
	//hSpeed = 0;
	//vSpeed = 0;
//}

phy_speed_x = hSpeed;
phy_speed_y = vSpeed;