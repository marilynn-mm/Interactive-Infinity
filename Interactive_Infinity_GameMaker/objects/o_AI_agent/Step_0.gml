if (place_meeting(x, y, o_main_char) and (!global.showing_dialogue)) {
	global.showing_dialogue = true;
} else if ((not place_meeting(x, y, o_main_char) and (global.showing_dialogue))) {
	global.showing_dialogue = false;
}
