// Movement Speed
speed = moveSpd;
gravity = 0;
friction = 0;

// create camera following main char movement
instance_create_layer(x, y, "Instances", o_camera);

// get inputs 

var rightKey = keyboard_check(vk_right);
var leftKey = keyboard_check(vk_left);
var downKey = keyboard_check(vk_down);
var upKey = keyboard_check(vk_up);

/* Debugging
if (place_meeting(x, y, o_wall)) {
    show_debug_message("Player is touching the wall!");
}
*/

// Vertical Movement
var vertical_move = (downKey - upKey) * moveSpd;

// Check for door and doorback  collision
var door_instance = instance_place(x, y + vertical_move, o_door);
var doorback_instance = instance_place(x, y + vertical_move, o_doorback);
if (door_instance != noone) { // If a door instance is found
    if (door_instance.locked) {
        vspeed = 0; // Stop movement if the door is locked
		// _________add to draw text!!
    } else {
        vspeed = vertical_move; // Allow movement if the door is unlocked
		// _______ create new room 
    }
} else if (doorback_instance != noone) { // If a doorback instance is found
	vspeed = 0;
	// _________add to draw text "can't go back!! 
}
// Check for wall collision (only if no door collision is detected)
else if (place_meeting(x, y + vertical_move, o_wall)) {
    vspeed = 0; // Stop movement on wall collision
}
// Allow movement if no collisions are detected
else {
    vspeed = vertical_move;
}

// Horizontal Movement
var horizontal_move = (rightKey - leftKey) * moveSpd;

// Check for door and doorback collision
var door_instance = instance_place(x + horizontal_move, y, o_door);
var doorback_instance = instance_place(x + horizontal_move, y, o_doorback);

if (door_instance != noone) { // If a door instance is found
    if (door_instance.locked) {
        hspeed = 0; // Stop movement if the door is locked
        // _________add to draw text: "The door is locked!"
    } else {
        hspeed = horizontal_move; // Allow movement if the door is unlocked
        // _________create new room or perform an action
    }
} else if (doorback_instance != noone) { // If a doorback instance is found
    hspeed = 0; // Stop movement
    // _________add to draw text: "You can't go back!"
}
// Check for wall collision (only if no door or doorback collision is detected)
else if (place_meeting(x + horizontal_move, y, o_wall)) {
    hspeed = 0; // Stop movement on wall collision
}
// Allow movement if no collisions are detected
else {
    hspeed = horizontal_move;
}


