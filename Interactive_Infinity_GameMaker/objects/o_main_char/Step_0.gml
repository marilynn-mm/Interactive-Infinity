// Movement Speed
speed = moveSpd;
gravity = 0;
friction = 0;


// get inputs 

var rightKey = keyboard_check(ord("D"))|| keyboard_check(vk_right);
var leftKey = keyboard_check(ord("A"))|| keyboard_check(vk_left);
var downKey = keyboard_check(ord("S"))|| keyboard_check(vk_up);
var upKey = keyboard_check(ord("W"))|| keyboard_check(vk_down);

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






/*
// Horizontal Movement
if (place_meeting(x + (rightKey - leftKey) * moveSpd, y, o_wall)) {
    hspeed = 0 // Stop horizontal movement on collision
} else {
    hspeed = (rightKey - leftKey) * moveSpd; 
}
*/ 

/*

// Print player's location
show_debug_message("Player Location: x = " + string(x) + ", y = " + string(y));

// Find the nearest wall to the player and print its location
if (instance_exists(o_wall)) {
    var nearest_wall = instance_nearest(x, y, o_wall);
    show_debug_message("Nearest Wall Location: x = " + string(nearest_wall.x) + ", y = " + string(nearest_wall.y));
} else {
    show_debug_message("No walls found in the room.");
}

*/