if (place_meeting(x, y, o_main_char) and (not already_shown)) {
	instance_create_layer(0, 0, "dialogue_layer", o_dialogue_test);
	already_shown=true;
} else if ((not place_meeting(x, y, o_main_char) and already_shown)) {
	already_shown=false;
}