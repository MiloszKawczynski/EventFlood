draw_set_font(f_test);

draw_set_color(c_white);
var _tex = sprite_get_texture(s_tileGround, 0);
draw_primitive_begin_texture(pr_trianglestrip, _tex);

var px = path_get_point_x(path, 0);
var py = path_get_point_y(path, 0);

draw_vertex_texture(
	px, 
	py, 
	(px - left) / (right - left), 
	(py - top) / (bottom - top));

for (var i = 1; i < path_get_number(path) / 2; i++) 
{
	px = path_get_point_x(path, i);
	py = path_get_point_y(path, i);
	
	draw_vertex_texture(
		px, 
		py, 
		(px - left) / (right - left), 
		(py - top) / (bottom - top));
	
	px = path_get_point_x(path, path_get_number(path) - i);
	py = path_get_point_y(path, path_get_number(path) - i);
	
	draw_vertex_texture(
		px, 
		py, 
		(px - left) / (right - left), 
		(py - top) / (bottom - top));
}

if (path_get_number(path) mod 2 == 0)
{
	px = path_get_point_x(path, ceil(path_get_number(path) / 2));
	py = path_get_point_y(path, ceil(path_get_number(path) / 2));
	
	draw_vertex_texture(
		px, 
		py, 
		(px - left) / (right - left), 
		(py - top) / (bottom - top));
}

draw_primitive_end();

draw_set_color(c_red);
draw_path(path, x, y, true);
