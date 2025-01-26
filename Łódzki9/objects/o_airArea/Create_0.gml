image_speed = 0;

//ps_air
_ps = part_system_create();
part_system_draw_order(_ps, true);

//Emitter
_ptype1 = part_type_create();
part_type_sprite(_ptype1, s_bubble, false, true, false)
part_type_size(_ptype1, 0.1, 1, 0, 0);
part_type_scale(_ptype1, 1, 1);
part_type_speed(_ptype1, 0, 0, 0, 2);
part_type_direction(_ptype1, 80, 100, 0, 0);
part_type_gravity(_ptype1, 0.01, 96);
part_type_orientation(_ptype1, 0, 0, 0, 15, false);
part_type_colour3(_ptype1, $FFFFFF, $FFFFFF, $FFFFFF);
part_type_alpha3(_ptype1, 0, 1, 0);
part_type_blend(_ptype1, false);
part_type_life(_ptype1, 200, 200);

_pemit1 = part_emitter_create(_ps);
part_emitter_region(_ps, _pemit1, -640, 640, -312, 312, ps_shape_rectangle, ps_distr_linear);
part_emitter_interval(_ps, _pemit1, 0, 0.5, time_source_units_seconds);

part_system_position(_ps, x, y);
