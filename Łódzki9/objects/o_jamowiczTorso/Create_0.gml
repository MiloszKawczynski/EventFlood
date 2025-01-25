image_speed = 0;

//ps_human
_ps = part_system_create();
part_system_draw_order(_ps, true);

//Emitter1
_ptype1 = part_type_create();
part_type_shape(_ptype1, pt_shape_pixel);
part_type_size(_ptype1, 1, 1, 0, 0);
part_type_scale(_ptype1, 5, 5);
part_type_speed(_ptype1, 5, 15, 0, 0);
part_type_direction(_ptype1, 0, 360, 0, 0);
part_type_gravity(_ptype1, 0, 270);
part_type_orientation(_ptype1, 0, 0, 0, 0, true);
part_type_colour3(_ptype1, $0000FF, $0000FF, $00007F);
part_type_alpha3(_ptype1, 0.722, 1, 0);
part_type_blend(_ptype1, false);
part_type_life(_ptype1, 80, 80);

_pemit1 = part_emitter_create(_ps);
part_emitter_region(_ps, _pemit1, -32, 32, -32, 32, ps_shape_rectangle, ps_distr_linear);

//Emitter
_ptype2 = part_type_create();
part_type_sprite(_ptype2, s_humanScraps, false, true, true)
part_type_size(_ptype2, 0.6, 1.3, 0, 0);
part_type_scale(_ptype2, 1, 1);
part_type_speed(_ptype2, 8, 16, 0, 0);
part_type_direction(_ptype2, 0, 360, 0, 0);
part_type_gravity(_ptype2, 0, 270);
part_type_orientation(_ptype2, 0, 360, 15, 0, false);
part_type_colour3(_ptype2, $FFFFFF, $FFFFFF, $FFFFFF);
part_type_alpha3(_ptype2, 1, 1, 0);
part_type_blend(_ptype2, false);
part_type_life(_ptype2, 80, 80);

_pemit2 = part_emitter_create(_ps);
part_emitter_region(_ps, _pemit2, -32, 32, -32, 32, ps_shape_rectangle, ps_distr_linear);
