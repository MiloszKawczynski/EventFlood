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
		var inst = instance_create_depth(x + (52 + (airInBubble / maxAirInBubble) * 48) * image_xscale, y - 142, depth, o_bubble, 
		{
			air: airInBubble
		});
		
		vSpeed = airInBubble * airHeightFactor;
		airInBubble = 0;
	}
}

if (place_meeting(x, y, o_bubble))
{
	vSpeed = -1.1;
	if (air < maxAir)
	{
		air++;
	}
}

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

phy_speed_x = hSpeed;
phy_speed_y = vSpeed;