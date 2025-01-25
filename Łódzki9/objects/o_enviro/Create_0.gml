x = 0;
y = 0;

var fixture = physics_fixture_create();
physics_fixture_set_chain_shape(fixture, true);

for(var i = 0; i < path_get_number(path); i++)
{
	physics_fixture_add_point(
		fixture, 
		path_get_point_x(path, i),
		path_get_point_y(path, i));
}
physics_fixture_set_density(fixture, 0);
physics_fixture_set_restitution(fixture, 0.1);
physics_fixture_set_friction(fixture, 0.2);

physics_fixture_bind(fixture, id);
physics_fixture_delete(fixture);

left = room_width;
right = 0;
top = room_height;
bottom = 0;

for(var i = 0; i < path_get_number(path); i++)
{
	if (path_get_point_x(path, i) < left)
	{
		left = path_get_point_x(path, i);
	}
	
	if (path_get_point_x(path, i) > right)
	{
		right = path_get_point_x(path, i);
	}
	
	if (path_get_point_y(path, i) < top)
	{
		top = path_get_point_y(path, i);
	}
	
	if (path_get_point_y(path, i) > bottom)
	{
		bottom = path_get_point_y(path, i);
	}
}