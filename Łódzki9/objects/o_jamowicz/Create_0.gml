image_speed = 0;

var inst = instance_create_layer(x, y, layer, o_jamowiczTorso);
inst.image_index = image_index;

physics_joint_revolute_create(id, inst, x, y, -22, 22, true, 1, 0, false, false);

isAired = false;