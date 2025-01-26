ui.step();

if (room == Room4)
{
	if (input_check_pressed("action"))
	{
		room_goto_next();
	}
	
	if (input_check_pressed("back"))
	{
		game_end();
	}
	
	if (input_check_pressed("rapidFire"))
	{
		room_goto(Room5);
	}
}
else 
{
	if (input_check_pressed("back"))
	{
		room_goto(Room4);
	}
}