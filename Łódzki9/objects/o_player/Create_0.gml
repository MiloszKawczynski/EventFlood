defaultSpeed = 20;
acceleration = 1;
deceleration = 0.75;

maxAir = 100;
air = maxAir;

airInBubble = 0;
maxAirInBubble = 32;

hSpeed = 0;
vSpeed = 0;

airHeightFactor = 0.85;

phy_rotation = 0;
phy_fixed_rotation = true;

//ps_turbina
_ps = part_system_create();
part_system_draw_order(_ps, true);

//Emitter
_ptype1 = part_type_create();
part_type_sprite(_ptype1, s_bubble, false, true, false)
part_type_size(_ptype1, 0, 0.3, 0, 0);
part_type_scale(_ptype1, 0.5, 0.5);
part_type_speed(_ptype1, 2, 7, 0, 1);
part_type_direction(_ptype1, 166, 139, 0.2, 10);
part_type_gravity(_ptype1, 0, 272);
part_type_orientation(_ptype1, 2, -3, 0, 0, false);
part_type_colour3(_ptype1, $FFFFFF, $FFFFFF, $FFFFFF);
part_type_alpha3(_ptype1, 1, 1, 0);
part_type_blend(_ptype1, false);
part_type_life(_ptype1, 40, 60);

_pemit1 = part_emitter_create(_ps);