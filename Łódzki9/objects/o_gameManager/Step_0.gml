ui.step();

with(ui)
{
	airBar.setValue(o_player.air / o_player.maxAir);
}

if (input_check("endGame"))
{
	game_end();
}

if (input_check("resetGame"))
{
	room_restart();
}

xVal = lerp(xVal, (input_value("hrAxis") - input_value("hlAxis")) * 1000, 0.05);
yVal = lerp(yVal, (input_value("vuAxis") - input_value("vbAxis")) * 1000, 0.05);

camera_set_view_pos(
	view_camera[0], 
	(o_player.x + xVal) - camera_get_view_width(view_camera[0]) / 2, 
	(o_player.y + yVal) - camera_get_view_height(view_camera[0]) / 2);