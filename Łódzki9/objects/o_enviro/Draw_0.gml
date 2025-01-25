var cx = 0;
var cy = 0;

for (var i = 0; i < path_get_number(path); i++) 
{
	cx += path_get_point_x(path, i);
	cy += path_get_point_y(path, i);
}

cx /= path_get_number(path);
cy /= path_get_number(path);

draw_set_color(c_white);
var _tex = sprite_get_texture(s_white, 0);
draw_primitive_begin_texture(pr_trianglefan, _tex);

draw_vertex_texture(cx, cy, 0, 0);

for (var i = 0; i < path_get_number(path); i++) 
{
	draw_vertex_texture(
		path_get_point_x(path, i), 
		path_get_point_y(path, i), 
		0, 0);
}

draw_vertex_texture(
	path_get_point_x(path, 0), 
	path_get_point_y(path, 0), 
	0, 0);

draw_primitive_end();

draw_set_color(c_red);
draw_path(path, x, y, true);