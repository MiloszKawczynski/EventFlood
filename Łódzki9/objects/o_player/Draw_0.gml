draw_sprite_ext(s_bubble, 0, x + (52 + (airInBubble / maxAirInBubble) * 48) * image_xscale, y - 142, airInBubble / maxAirInBubble, airInBubble / maxAirInBubble, 0, c_white, 1);

draw_self();