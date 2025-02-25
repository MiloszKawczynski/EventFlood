// Feather disable all

//This script contains the default profiles, and hence the default bindings and verbs, for your game
//
//  Please edit this macro to meet the needs of your game!
//
//The struct return by this script contains the names of each default profile.
//Default profiles then contain the names of verbs. Each verb should be given a binding that is
//appropriate for the profile. You can create bindings by calling one of the input_binding_*()
//functions, such as input_binding_key() for keyboard keys and input_binding_mouse() for
//mouse buttons

function __input_config_verbs()
{
    return {
        keyboard_and_mouse:
        {
            up:    [input_binding_key(vk_up),    input_binding_key("W")],
            down:  [input_binding_key(vk_down),  input_binding_key("S")],
            left:  [input_binding_key(vk_left),  input_binding_key("A")],
            right: [input_binding_key(vk_right), input_binding_key("D")],
            
            action:  input_binding_key(vk_space),
            rapidFire:  input_binding_key(vk_shift),
		
			resetGame: input_binding_key("R"),
            endGame: input_binding_key(vk_escape),
        },
        
        gamepad:
        {
            up:    [input_binding_gamepad_axis(gp_axislv, true),  input_binding_gamepad_button(gp_padu)],
            down:  [input_binding_gamepad_axis(gp_axislv, false), input_binding_gamepad_button(gp_padd)],
            left:  [input_binding_gamepad_axis(gp_axislh, true),  input_binding_gamepad_button(gp_padl)],
            right: [input_binding_gamepad_axis(gp_axislh, false), input_binding_gamepad_button(gp_padr)],
            
            action:  input_binding_gamepad_button(gp_face1),
			rapidFire:  input_binding_gamepad_button(gp_face3),
			back:  input_binding_gamepad_button(gp_face2),
		
			hrAxis: input_binding_gamepad_axis(gp_axisrh, false),
			vuAxis: input_binding_gamepad_axis(gp_axisrv, false),
			hlAxis: input_binding_gamepad_axis(gp_axisrh, true),
			vbAxis: input_binding_gamepad_axis(gp_axisrv, true),
		
			resetGame: input_binding_gamepad_button(gp_select),
            endGame: input_binding_gamepad_button(gp_start),
        }
    };
}