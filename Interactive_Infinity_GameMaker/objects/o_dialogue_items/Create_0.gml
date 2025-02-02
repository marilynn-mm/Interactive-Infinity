// Inherit the parent event
event_inherited();

global.dialogueItems = new Dialogue();
show_debug_message("-----Dialogue system for item initialized.-----");

// Reference o_main_char's position explicitly
var player_x = o_main_char.x;
var player_y = o_main_char.y;

// Debug to confirm positions
show_debug_message("Player Position: " + string(player_x) + ", " + string(player_y));
show_debug_message("Item 1 Position: " + string(global.item1_x) + ", " + string(global.item1_y));

// Check if item instances exist and detect proximity

var dist_threshold = 30; // Adjust collision range

if (point_distance(player_x, player_y, global.item1_x, global.item1_y) < dist_threshold) {
    show_debug_message("Touching Item 1: " + global.item1.key);
	global.dialogueItems.add(s_item_general, global.Object1_Description)
}

if (point_distance(player_x, player_y, global.item2_x, global.item2_y) < dist_threshold) {
    show_debug_message("Touching Item 2: " + global.item2.key);
	global.dialogueItems.add(s_item_general, global.Object2_Description)
}

if (point_distance(player_x, player_y, global.item3_x, global.item3_y) < dist_threshold) {
    show_debug_message("Touching Item 3: " + global.item3.key);
	global.dialogueItems.add(s_item_general, global.Object3_Description)
}


