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