moveSpd = 2;
xspd = 0;
yspd = 0;

if (global.grid_[# floor(x / CELL_WIDTH), floor(y / CELL_HEIGHT)] == VOID) {
    // Find the nearest floor tile
    var closest_x = -1;
    var closest_y = -1;
    var min_distance = 1000000; // Large initial value

    for (var _y = 0; _y < global.height_; _y++) {
        for (var _x = 0; _x < global.width_; _x++) {
            if (global.grid_[# _x, _y] == FLOOR) {
                var distance = point_distance(x, y, _x * CELL_WIDTH + CELL_WIDTH / 2, _y * CELL_HEIGHT + CELL_HEIGHT / 2);
                if (distance < min_distance) {
                    min_distance = distance;
                    closest_x = _x * CELL_WIDTH + CELL_WIDTH / 2;
                    closest_y = _y * CELL_HEIGHT + CELL_HEIGHT / 2;
                }
            }
        }
    }

    // If a valid floor tile was found, teleport the player
    if (closest_x != -1 && closest_y != -1) {
        x = closest_x;
        y = closest_y;
        show_debug_message("Player teleported to nearest floor tile!");
    }
}

//TODO add attribute generation

//  ex:
// var attributes = call_chat_gpt("generate a list of starting attributes and items for a player in a dungeon RPG")
var attributes = "none";