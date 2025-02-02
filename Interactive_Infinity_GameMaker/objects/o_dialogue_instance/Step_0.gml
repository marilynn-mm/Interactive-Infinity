// not right ai_agent_line = global.Intro_Line;
var waiting = "..."

if (variable_global_exists("dialogueDynamic") && !is_undefined(global.dialogueDynamic)) {
    // No showing dialogue yet
    if (!showing_dialogue) {
        // If user input is active, show input box dynamically
        if (global.user_turn) {
			global.dialogueDynamic.add(s_main_char, global.input_text);
			current_dialogue = global.dialogueDynamic.last()  // Show what user is typing
            showing_dialogue = true;
        }
		else if (global.ai_turn && !global.waiting_for_response) {
            global.dialogueDynamic.add(s_AI_agent, global.Intro_Line); // Add AI response to dialogue
            current_dialogue = global.dialogueDynamic.last();  // Display AI's response
            showing_dialogue = true;
        }
        // If AI is active but still waiting for response
        else if (global.ai_turn && global.waiting_for_response) {
            global.dialogueDynamic.add(s_AI_agent, waiting);
            current_dialogue = global.dialogueDynamic.last(); // Display waiting indicator
            showing_dialogue = true;
		}
    } 
    // Dialogue is currently being shown
    else {
        // If user is typing, update their input dynamically
        if (global.user_turn) {
            global.dialogueDynamic.add(s_main_char, global.input_text);
            current_dialogue = global.dialogueDynamic.last();  
        }

        // If AI is active and response is ready
        else if (global.ai_turn && !global.waiting_for_response) {
            global.dialogueDynamic.add(s_AI_agent, global.http_text);
            current_dialogue = global.dialogueDynamic.last();
        }

        // If AI is waiting for response, show loading message
        else if (global.ai_turn && global.waiting_for_response) {
            global.dialogueDynamic.add(s_AI_agent, waiting);
            current_dialogue = global.dialogueDynamic.last();
        }

        // If AI turn is active and user presses SPACE, move conversation forward
        if (global.ai_turn && keyboard_check_pressed(vk_space)) {
            global.ai_turn = false;
            global.user_turn = true;
            //showing_dialogue = false; Hide dialogue until the next input
        }

        // If user presses ENTER with an empty input box, end dialogue
        if (global.user_turn && keyboard_check_pressed(vk_enter) && string_length(global.input_text) == 0) {
            showing_dialogue = false; 
        }
    }
}



