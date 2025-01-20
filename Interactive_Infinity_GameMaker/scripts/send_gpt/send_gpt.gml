function send_gpt(_system,_question){
	
	var map = ds_map_create();
	ds_map_add(map, "Authorization", "Bearer " + APIKEY);
	ds_map_add(map, "Content-Type", "application/json");

	var _data = {
					"model": "gpt-4o", // chat based model
					"messages": [
						{ "role": "system", "content": _system }, // System role
						{ "role": "user", "content": _question } // User's input
					],
					//"max_tokens": int64(100),
					"temperature": 0.85,
				}
			
	var data = json_stringify(_data) 


	request = http_request("https://api.openai.com/v1/chat/completions", "POST", map, data);

	show_debug_message("Request Sent")
	show_debug_message(request)
	show_debug_message(data)

	//ds_map_destroy(map)
}