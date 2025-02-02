if (place_meeting(x, y, o_main_char) and (not already_shown)) {
	global.showing_dialogue = true;
	already_shown=true;
} else if ((not place_meeting(x, y, o_main_char) and already_shown)) {
	global.showing_dialogue = false;
	already_shown=false;
}
