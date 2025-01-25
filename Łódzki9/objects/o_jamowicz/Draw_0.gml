
if (isAired)
{
	draw_set_color(c_maroon);
	draw_line_width(x, y, o_player.x, o_player.y, 3);
	with(o_player)
	{
		draw_self();
	}
}

draw_self();