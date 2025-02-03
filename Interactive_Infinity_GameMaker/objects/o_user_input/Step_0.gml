// dynamically updated prompts for system 

var character_traits = 
    "Name: " + global.Character_Name +
    "Personality Trait: " + global.Personality_Trait +
    "Hostility: " + global.Hostility +
    "Trust Level: " + global.Current_Trust_Level +
    "Backstory: " + global.Backstory +
    "Object1 Description: " + global.Object1_Description + 
	"Object2 Description: " + global.Object1_Description + 
	"Object3 Description: " + global.Object1_Description + 
	"Introduction Line: " + global.Intro_Line;

// this is the system for the chatgpt API (what will stay consistent) 

//" set in a basement beneath an abandoned building."

var _system = "You are a human doorkeeper character for a video game level"+
"Your role involves interacting with players, deciding your hostility based on your personality, and revealing personal stories through objects." + 

"Traits you should maintain or generate if undefined:"+

character_traits + 

"If any attributes are 'Undefined', generate them based on the context";

// initialization of character! 
if (global.first_request) {
    send_gpt(_system, creation_prompt);
    global.first_request = false; // Prevents multiple API calls
}

// Check if user input is allowed (showing dialogue & user turn)
if (global.showing_dialogue && global.user_turn) {

    // Handle Backspace to remove characters
    if (keyboard_check_pressed(vk_backspace) && string_length(global.input_text) > 0) {  
        global.input_text = string_copy(global.input_text, 1, string_length(global.input_text) - 1);  
    }

    // Handle Enter Key (Submit)
    else if (keyboard_check_pressed(vk_enter) && !global.waiting_for_response) {
        global.user_turn = false;
        global.ai_turn = true;
        global.waiting_for_response = true;
        global.first_request = false;

        send_gpt(_system, global.input_text);
        global.input_text = "";  // Clear input after sending
    }

    // Capture only printable characters
    else {
        var key = keyboard_lastkey;

        // Only allow letters, numbers, and common symbols
        if (key >= 32 && key <= 126) { // ASCII range for printable characters
            if (keyboard_check_pressed(key) && string_length(global.input_text) < max_length) {
                global.input_text += chr(key);  // Append the character
            }
        }
    }
}

