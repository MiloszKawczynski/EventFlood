image_speed = 0;

var inst = instance_create_depth(x, y, depth, o_jamowiczTorso);

physics_joint_revolute_create(id, inst, x, y, -22, 22, true, 1, 0, false, false);

isAired = false;