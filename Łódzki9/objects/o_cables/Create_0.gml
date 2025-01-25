//ParticleSystem4
_ps = part_system_create();
part_system_draw_order(_ps, true);

//Emitter
_ptype1 = part_type_create();
part_type_sprite(_ptype1, s_spark, false, true, false)
part_type_size(_ptype1, 0, 1, 0, 0.3);
part_type_scale(_ptype1, 0.4, 0.4);
part_type_speed(_ptype1, 8, 10, 0, 3);
part_type_direction(_ptype1, 0 + image_angle, 180 + image_angle, 0, 0);
part_type_gravity(_ptype1, 0, 270);
part_type_orientation(_ptype1, 0, 0, 0, 5, false);
part_type_colour3(_ptype1, $FFFFFF, $FFFFFF, $FFFFFF);
part_type_alpha3(_ptype1, 1, 1, 0);
part_type_blend(_ptype1, false);
part_type_life(_ptype1, 10, 25);

_pemit1 = part_emitter_create(_ps);
part_emitter_region(_ps, _pemit1, -sprite_width / 2, sprite_width / 2, -sprite_height / 2, sprite_height / 2, ps_shape_rectangle, ps_distr_linear);

part_system_position(_ps, x, y);

alarm[0] = random_range(15, 60);

image_speed = 0;