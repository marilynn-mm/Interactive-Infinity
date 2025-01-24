show_debug_message("room!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")


if (room != Room2) return; // Exit if not in Room 2

randomize();

// Create the surface for the shadows
// shadow_surface_ = noone;

// Get the tile layer map id
var _wall_map_id = layer_tilemap_get_id("WallTiles");

// Set up the grid
width_ = room_width div CELL_WIDTH;
height_ = room_height div CELL_HEIGHT;
grid_ = ds_grid_create(width_, height_);
ds_grid_set_region(grid_, 0, 0, width_ - 1, height_ - 1, VOID);

global.grid_ = grid_;
global.width_ = width_;
global.height_ = height_;
global.floor_tiles = ds_list_create();

// Create the controller
var _controller_x = width_ div 2;
var _controller_y = height_ div 2;
var _controller_direction = irandom(3);
var _steps = 150;

//Ensure the controller position is a valid floor
//var _attempts = 0; // Fail-safe counter
//var _max_attempts = 100; // Limit attempts to avoid infinite loop

//while (grid_[# _controller_x, _controller_y] != FLOOR && _attempts < _max_attempts) {
//    _controller_x = irandom(width_ - 3) + 1; // Random valid x
//    _controller_y = irandom(height_ - 3) + 1; // Random valid y
//    _attempts++;
//}

// If no floor tile found, fallback to center
//if (grid_[# _controller_x, _controller_y] != FLOOR) {
//    _controller_x = width_ div 2;
//    _controller_y = height_ div 2;
//}

// ---------
// Player starting position (on floor)
// var _player_start_x = _controller_x * CELL_WIDTH + CELL_WIDTH / 2;
// var _player_start_y = _controller_y * CELL_HEIGHT + CELL_HEIGHT / 2;
// instance_create_layer(_player_start_x, _player_start_y, "Instances", o_main_char);
//------------

// Choo se the direction change odds
var _direction_change_odds = 1;

// Generate the level
repeat (_steps) {
	grid_[# _controller_x, _controller_y] = FLOOR;
	
	// Rnadomize the direction
	if (irandom(_direction_change_odds) == _direction_change_odds) {
		_controller_direction = irandom(3);	
	}
	
	// Move the controller
	var _x_direction = lengthdir_x(1, _controller_direction * 90);
	var _y_direction = lengthdir_y(1, _controller_direction * 90);
	_controller_x += _x_direction;
	_controller_y += _y_direction;
	
	// Make sure we don't move outside the room
	if (_controller_x < 2 || _controller_x >= width_ - 2) {
		_controller_x += -_x_direction * 2;
	}
	if (_controller_y < 2 || _controller_y >= height_ - 2) {
		_controller_y += -_y_direction * 2;
	}
}

// Create the walls tiles
for (var _y = 1; _y < height_-1; _y++) {
	for (var _x = 1; _x < width_-1; _x++) {
		if (grid_[# _x, _y] != FLOOR) {
			var _north_tile = grid_[# _x, _y-1] == VOID;
			var _west_tile = grid_[# _x-1, _y] == VOID;
			var _east_tile = grid_[# _x+1, _y] == VOID;
			var _south_tile = grid_[# _x, _y+1] == VOID;
		
			var _tile_index = NORTH*_north_tile + WEST*_west_tile + EAST*_east_tile + SOUTH*_south_tile + 1;
			if (_tile_index == 1) {
				grid_[# _x, _y] = FLOOR	
			}
		}
	}
}

// Create the walls tiles
for (var _y = 1; _y < height_-1; _y++) {
	for (var _x = 1; _x < width_-1; _x++) {
		if (grid_[# _x, _y] != FLOOR) {
			var _north_tile = grid_[# _x, _y-1] == VOID;
			var _west_tile = grid_[# _x-1, _y] == VOID;
			var _east_tile = grid_[# _x+1, _y] == VOID;
			var _south_tile = grid_[# _x, _y+1] == VOID;
		
			var _tile_index = NORTH*_north_tile + WEST*_west_tile + EAST*_east_tile + SOUTH*_south_tile + 1;
			tilemap_set(_wall_map_id, _tile_index, _x, _y);
		}
		
		if (grid_[# _x, _y] == FLOOR) {
            // Add the floor position to the list
            var floor_position = [_x * CELL_WIDTH, _y * CELL_HEIGHT];
            ds_list_add(global.floor_tiles, floor_position);
        }
	}
}

// Create the wall tiles and place wall objects
for (var _y = 1; _y < height_ - 1; _y++) {
    for (var _x = 1; _x < width_ - 1; _x++) {
        if (grid_[# _x, _y] == VOID) {
            // Calculate position in the room
            //var _wall_x = _x * CELL_WIDTH + CELL_WIDTH / 2;
            //var _wall_y = _y * CELL_HEIGHT + CELL_HEIGHT / 2;
			var _wall_x = _x * CELL_WIDTH;
			var _wall_y = _y * CELL_HEIGHT;


            // Create the wall object at the calculated position
            instance_create_layer(_wall_x, _wall_y, "Wall_collisions", o_wall);
        }
    }
}

if (!ds_list_empty(global.floor_tiles)) {
    
	// Print the contents of the floor tiles list
    //show_debug_message("Contents of global.floor_tiles:");
    //for (var i = 0; i < ds_list_size(global.floor_tiles); i++) {
    //    var pos = global.floor_tiles[| i];  // Get the (x, y) position
    //    show_debug_message("Tile " + string(i) + ": [" + string(pos[0]) + ", " + string(pos[1]) + "]");
    //}
	
	// Get a random index from the list
    var random_index1 = irandom(ds_list_size(global.floor_tiles) - 1);
	var random_index2 = irandom(ds_list_size(global.floor_tiles) - 1);
    var pos_player = global.floor_tiles[| random_index1]; // Get the [x, y] position
	var pos_AI = global.floor_tiles[| random_index2];

    // Use the selected position for the player start
    var _player_start_x = pos_player[0];
    var _player_start_y = pos_player[1];
    instance_create_layer(_player_start_x, _player_start_y, "Instances", o_main_char);
	
	// Use the selected position for the agent start
    var _AI_start_x = pos_AI[0];
    var _AI_start_y = pos_AI[1];
    instance_create_layer(_AI_start_x, _AI_start_y, "Instances", o_AI_agent);
	instance_create_layer(_AI_start_x, _AI_start_y, "Instances", o_AI_agent)
	
	//create door 
	instance_create_layer(_AI_start_x + 32*2, _AI_start_y,"Instances", o_door);

	// create list of objects 

	
} else {
    show_debug_message("Error: No valid floor tiles available for player start!");
}

