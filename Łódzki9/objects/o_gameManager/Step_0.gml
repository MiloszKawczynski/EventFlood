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

camera_set_view_pos(
	view_camera[0], 
	o_player.x - camera_get_view_width(view_camera[0]) / 2, 
	o_player.y - camera_get_view_height(view_camera[0]) / 2);