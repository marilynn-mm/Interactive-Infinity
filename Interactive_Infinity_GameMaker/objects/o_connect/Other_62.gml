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





// Update the characteristics for system 
// Ensure global.return_message contains valid data
// Only for creation event

if (variable_struct_exists(global.return_message, "choices")) {
    var choices_list = global.return_message.choices; // Access "choices"
    
    if (array_length(choices_list) > 0) { // Use array_length instead of ds_list_size
        var first_choice = choices_list[0]; // Access the first element in the array
        
        if (variable_struct_exists(first_choice, "message")) {
            var message_map = first_choice.message; // Access "message"
            
            if (variable_struct_exists(message_map, "content")) {
                var content = message_map.content; // Extract "content"
                show_debug_message("Content: " + content);
                
                // Split content into lines to parse key details
                var lines = string_split(content, "\n");
                for (var i = 0; i < array_length(lines); i++) {
                    var line = string_trim(lines[i]);
                    
                    if (string_starts_with(line, "**Character Name:**")) {
                        global.Character_Name = string_delete(line, 1, 18);
                    }
                    else if (string_starts_with(line, "**Personality Traits:**")) {
                        global.Personality_Trait = string_delete(line, 1, 23);
                    }
                    else if (string_starts_with(line, "**Hostility:**")) {
                        global.Hostility = string_delete(line, 1, 14);
                    }
                    else if (string_starts_with(line, "**Current Trust Level:**")) {
                        global.Current_Trust_Level = string_delete(line, 1, 24);
                    }
                    else if (string_starts_with(line, "**Backstory:**")) {
                        global.Backstory = string_delete(line, 1, 13);
                    }
                    else if (string_starts_with(line, "**Object1 Description:**")) {
                        var objects_text = "";
                        for (var j = i + 1; j < array_length(lines); j++) {
                            objects_text += string_trim(lines[j]) + "\n";
                        }
                        global.Object1_Description = string_trim(objects_text);
                        break;
                    }
					else if (string_starts_with(line, "**Object2 Description:**")) {
                        var objects_text = "";
                        for (var j = i + 1; j < array_length(lines); j++) {
                            objects_text += string_trim(lines[j]) + "\n";
                        }
                        global.Object2_Description = string_trim(objects_text);
                        break;
                    }
					else if (string_starts_with(line, "**Object3 Description:**")) {
                        var objects_text = "";
                        for (var j = i + 1; j < array_length(lines); j++) {
                            objects_text += string_trim(lines[j]) + "\n";
                        }
                        global.Object3_Description = string_trim(objects_text);
                        break;
                    }
                }
            }
        }
    }
}
