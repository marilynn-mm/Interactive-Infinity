if (variable_global_exists("dialogueItems") && !is_undefined(global.dialogueItems)) {
	//no showing dialogue yet
	if (!showing_dialogue) {
		// no dialogue and have nothing to say
		if (global.dialogueItems.count() <= 0) {
            instance_destroy();
			return;
        }
        // no dialogue yet but adding something 
		else {
			
            current_dialogue = global.dialogueItems.pop();
            showing_dialogue = true;
        }
    } 
	// yes dialogue 
    else {
        if (keyboard_check_released(key_next)) {
            if (global.dialogueItems.count() > 0) {
                current_dialogue = global.dialogueItems.pop();
            } 
            else {
                showing_dialogue = false;
                alpha = 0;
            }
        }
    }
} 
//else {
    //show_debug_message("ERROR: global.dialogueItems is undefined.");
//}




