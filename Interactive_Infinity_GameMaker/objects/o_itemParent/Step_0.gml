if (place_meeting(x, y, o_main_char)and (not already_shown)) {
	show_debug_message("meet item")
	instance_create_layer(0, 0, "dialogue_layer", o_dialogue_items);
	already_shown=true;
} else if ((not place_meeting(x, y, o_main_char) and already_shown)) {
	already_shown=false;
}



