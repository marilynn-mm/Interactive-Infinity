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

for (var i = 0;i<_size;++i){
	if (_key == "result")
	{
		show_debug_message(async_load[?_key])	
		var _full_message = json_parse(async_load[?_key])
		// Extracts the value associated with the "choice" key from the parsed JSON.
		// Assigns this value to display_string for use elsewhere in the game.
		
	}
	_key = ds_map_find_next(async_load,_key)
}

// use _full_message to get response 