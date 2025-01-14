function send_gpt(_question){
	
	var map = ds_map_create();
	ds_map_add(map, "Authorization", "Bearer " + APIKEY);
	ds_map_add(map, "Content-Type", "application/json");

	var _data = {
					"model": "gpt-3.5-turbo", // chat based model
					"messages": [
						{ "role": "system", "content": "You are a helpful assistant." }, // System role
						{ "role": "user", "content": _question } // User's input
					],
					"max_tokens": int64(30),
					"temperature": 0.85,
					"n": int64(2),
				}
			
	var data = json_stringify(_data)


	request = http_request("https://api.openai.com/v1/chat/completions", "POST", map, data);

	display_string = "Loading"

	show_debug_message("Request Sent")
	show_debug_message(request)
	show_debug_message(data)

	ds_map_destroy(map)
}