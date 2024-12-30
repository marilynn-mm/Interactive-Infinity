if (!locked && keyboard_check_pressed(ord("E"))) { // If unlocked and "E" is pressed
    // Move to the next room
} else if (locked) {
    show_debug_message("The door is locked!");
}