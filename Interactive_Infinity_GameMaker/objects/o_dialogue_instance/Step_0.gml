// not right ai_agent_line = global.Intro_Line;
var waiting = "..."

if (variable_global_exists("dialogueDynamic") && !is_undefined(global.dialogueDynamic)) {
    // No showing dialogue yet
    if (first_dialogue) {
        // If user input is active, show input box dynamically
        if (global.user_turn) {
			show_debug_message("first_dialogue, user turn")
			global.dialogueDynamic.add(s_main_char, global.input_text);
			current_dialogue = global.dialogueDynamic.last()  // Show what user is typing
            first_dialogue = false;
        }
		else if (global.ai_turn && !global.waiting_for_response) {
			show_debug_message("first_dialogue, global.ai_turn && !global.waiting_for_response")
            global.dialogueDynamic.add(old_agent, global.Intro_Line); // Add AI response to dialogue
            current_dialogue = global.dialogueDynamic.last();  // Display AI's response
            //first_dialogue = true;
        }
        // If AI is active but still waiting for response
        else if (global.ai_turn && global.waiting_for_response) {
            show_debug_message("first_dialogue, global.ai_turn && global.waiting_for_response")
			global.dialogueDynamic.add(old_agent, waiting);
            current_dialogue = global.dialogueDynamic.last(); // Display waiting indicator
            first_dialogue = true;
		}
	} else {
        // If user is typing, update their input dynamically
        if (global.user_turn) {
            show_debug_message("after first, user turn")
			global.dialogueDynamic.add(s_main_char, global.input_text);
            current_dialogue = global.dialogueDynamic.last();  
        }

        // If AI is active and response is ready
        else if (global.ai_turn && !global.waiting_for_response) {
            show_debug_message("after first, global.ai_turn && !global.waiting_for_response")
			global.dialogueDynamic.add(old_agent, global.http_text);
            current_dialogue = global.dialogueDynamic.last();
        }

        // If AI is waiting for response, show loading message
        else if (global.ai_turn && global.waiting_for_response) {
            show_debug_message("after first, global.ai_turn && global.waiting_for_response")
			global.dialogueDynamic.add(old_agent, waiting);
            current_dialogue = global.dialogueDynamic.last();
        }

        // If user presses ENTER with an empty input box, end dialogue
        if (global.user_turn && keyboard_check_pressed(vk_enter) && string_length(global.input_text) == 1) {
            global.showing_dialogue = false; 
        }
    }
}

// If AI turn is active and user presses SPACE, move conversation forward
if (global.ai_turn && keyboard_check_pressed(vk_space)) {
	global.ai_turn = false;
	global.user_turn = true;
	first_dialogue = false;
	//showing_dialogue = false; Hide dialogue until the next input
	}


