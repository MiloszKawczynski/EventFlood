image_xscale = (air / o_player.maxAirInBubble);
image_yscale = (air / o_player.maxAirInBubble);

var fix = physics_fixture_create();
physics_fixture_set_circle_shape(fix, image_xscale * sprite_get_width(sprite_index) / 2);

physics_fixture_set_density(fix, 0.5);
physics_fixture_set_restitution(fix, 0);
physics_fixture_set_collision_group(fix, 0);
physics_fixture_set_linear_damping(fix, 0);
physics_fixture_set_angular_damping(fix, 0);
physics_fixture_set_friction(fix, 0);
physics_fixture_bind(fix, id);

physics_fixture_delete(fix);