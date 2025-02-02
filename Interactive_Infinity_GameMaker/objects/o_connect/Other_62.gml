// debugging
show_debug_message("In Async Event")
show_debug_message(async_load)

// Get the Size of the async_load Map

// async_load contains multiple pieces of information, such as:
//		"status": The HTTP status code (e.g., 200 for success).
//		"result": The main content returned from the API (often JSON-encoded).
//		Other metadata related to the HTTP request.

var _size = ds_map_size(async_load)
var _key = ds_map_find_first(async_load)

// Iterates through all keys in the async_load map.
// Starts with the first key (ds_map_find_first) 
// continues to the next key (ds_map_find_next) in each iteration.
// Check for key "results" 
// use _full_message to get full response 

for (var i = 0;i<_size;++i){
	if (_key == "result")
	{
		show_debug_message(async_load[?_key])	
		global.return_message = json_parse(async_load[?_key])
		// Extracts the value associated with the "choice" key from the parsed JSON.
		// Assigns this value to display_string for use elsewhere in the game.
	}
	_key = ds_map_find_next(async_load,_key)
}

// message have been returned 
global.waiting_for_response = false;


// Update the characteristics for system 
// Ensure global.return_message contains valid data
// Only for creation event

if (variable_struct_exists(global.return_message, "choices")) {
    var choices_list = global.return_message.choices; // Access "choices"
	show_debug_message("updating global begins...")
    
    if (array_length(choices_list) > 0) { // Use array_length instead of ds_list_size
        var first_choice = choices_list[0]; // Access the first element in the array
		show_debug_message("updating global begins 2...")
        
        if (variable_struct_exists(first_choice, "message")) {
            var message_map = first_choice.message; // Access "message"
			show_debug_message("updating global begins 3...")
            
            if (variable_struct_exists(message_map, "content")) {
                var content = message_map.content; // Extract "content"
                show_debug_message("updating global begins 4...")
				show_debug_message("Content: " + content);
				
                // Split content into lines to parse key details
                var lines = string_split(content, "\n");
				for (var i = 0; i < array_length(lines); i++) {
				    var line = string_trim(lines[i]);

				    if (string_starts_with(line, "Name:")) {
				        global.Character_Name = string_trim(string_replace(line, "Name:", ""));
				        show_debug_message("Character Name set to: " + global.Character_Name);
				    }
				    else if (string_starts_with(line, "Personality:")) {
				        global.Personality_Trait = string_trim(string_replace(line, "Personality:", ""));
				        show_debug_message("Personality Trait set to: " + global.Personality_Trait);
				    }
				    else if (string_starts_with(line, "Hostility:")) {
				        global.Hostility = string_trim(string_replace(line, "Hostility:", ""));
				        show_debug_message("Hostility set to: " + global.Hostility);
				    }
				    else if (string_starts_with(line, "Trust Level:")) {
				        global.Current_Trust_Level = string_trim(string_replace(line, "Trust Level:", ""));
				        show_debug_message("Trust Level set to: " + global.Current_Trust_Level);
				    }
				    else if (string_starts_with(line, "Backstory:")) {
				        global.Backstory = string_trim(string_replace(line, "Backstory:", ""));
				        show_debug_message("Backstory set to: " + global.Backstory);
				    }
				    else if (string_starts_with(line, "Object1 Description:")) {
				        global.Object1_Description = string_trim(string_replace(line, "Object1 Description:", ""));
				        show_debug_message("Object1 Description set to: " + global.Object1_Description);
				    }
				    else if (string_starts_with(line, "Object2 Description:")) {
				        global.Object2_Description = string_trim(string_replace(line, "Object2 Description:", ""));
				        show_debug_message("Object2 Description set to: " + global.Object2_Description);
				    }
				    else if (string_starts_with(line, "Object3 Description:")) {
				        global.Object3_Description = string_trim(string_replace(line, "Object3 Description:", ""));
				        show_debug_message("Object3 Description set to: " + global.Object3_Description);
				    }
					else if (string_starts_with(line, "Introduction Line:")) {
				        global.Intro_Line = string_trim(string_replace(line, "Introduction Line:", ""));
				        show_debug_message("Introduction Line set to: " + global.Intro_Line);
				    }
					else {
						global.http_text = string_trim(string_replace(line, "Content: ", ""));
						show_debug_message("global.http_text set to: " + global.http_text);
					}
				}
            }
        }
	}
}


/// think more... this is not working fully! 

if (global.awaiting_response && !global.first_request) {
    show_debug_message("Enter adding dialogue loop")
	// waiting_timer += 1; // Increase timer

    // Check if a response is received
    if (global.return_message != "") {
        if (variable_global_exists("dialogue") && !is_undefined(global.dialogue)) {
			global.dialogue.add(s_AI_agent, global.return_message);
	} else {
		show_debug_message("ERROR: dialogue instance is undefined or not initialized.");
	}

	//show_debug_message("-------------testing correct waiting response")
	//	global.dialogue.add(s_AI_agent, global.return_message);
		//dialogue.add(s_AI_agent, global.return_message);
        global.return_message = "";  // Clear after use
        global.awaiting_response = false;   // Exit waiting state
        //waiting_timer = 0;           // Reset timer
    }

    // Handle timeout scenario
    //if (waiting_timer > waiting_max_time) {
    //    add_message_to_chat("System", "No response received. Please try again.");
    //    global.awaiting_response = false;  // Reset system
    //    waiting_timer = 0;
    //}
}




//if (global.first_request == false){
//	dialogue.add(s_AI_agent, global.return_message);
//}
// it doesn't work because it is updating before a result 