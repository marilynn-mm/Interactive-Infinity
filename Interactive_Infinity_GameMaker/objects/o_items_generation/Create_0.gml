show_debug_message("item!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");

// Initialize the global array with the first 10 items
global.items = [
    {key: "O_item_1", value: "Type: Handle - Color: Purple"},
    {key: "O_item_2", value: "Type: Coconut Tree - Color: Green and Brown"},
    {key: "O_item_3", value: "Type: Game Console - Color: Red"},
    {key: "O_item_4", value: "Type: Star - Color: Yellow"},
    {key: "O_item_5", value: "Type: Cherry - Color: Green and Red"},
    {key: "O_item_6", value: "Type: Cup - Color: Yellow and Blue"},
    {key: "O_item_7", value: "Type: Soda Can - Color: Green and Yellow"},
    {key: "O_item_8", value: "Type: Record Player - Color: Red and Black"},
    {key: "O_item_9", value: "Type: Dinosaur - Color: Green"},
    {key: "O_item_10", value: "Type: Ice Cream - Color: Black, Pink, and White"},
	{key: "O_item_11", value: "Type: Bear - Color: Brown"},
    {key: "O_item_12", value: "Type: Duck - Color: Yellow"},
    {key: "O_item_13", value: "Type: Car - Color: Red and Blue"},
    {key: "O_item_14", value: "Type: Rocket - Color: Yellow, Blue, and Red"},
    {key: "O_item_15", value: "Type: Letters - Color: Red, Yellow, and Blue"}
];

// Initialize the mapping between keys and object references
global.item_object_map = ds_map_create();
ds_map_add(global.item_object_map, "O_item_1", o_item1);
ds_map_add(global.item_object_map, "O_item_2", o_item2);
ds_map_add(global.item_object_map, "O_item_3", o_item3);
ds_map_add(global.item_object_map, "O_item_4", o_item4);
ds_map_add(global.item_object_map, "O_item_5", o_item5);
ds_map_add(global.item_object_map, "O_item_6", o_item6);
ds_map_add(global.item_object_map, "O_item_7", o_item7);
ds_map_add(global.item_object_map, "O_item_8", o_item8);
ds_map_add(global.item_object_map, "O_item_9", o_item9);
ds_map_add(global.item_object_map, "O_item_10", o_item10);
ds_map_add(global.item_object_map, "O_item_11", o_item11);
ds_map_add(global.item_object_map, "O_item_12", o_item12);
ds_map_add(global.item_object_map, "O_item_13", o_item13);
ds_map_add(global.item_object_map, "O_item_14", o_item14);
ds_map_add(global.item_object_map, "O_item_15", o_item15);

show_debug_message(global.items)

//helper function
function array_index_of(array, value) {
    var array_length_value = array_length(array); // Store array length for efficiency
    for (var i = 0; i < array_length_value; i++) {
        if (array[i] == value) {
            return i; // Return the index if the value is found
        }
    }
    return -1; // Return -1 if the value is not found in the array
}

// Pick three random items and display their details
global.item1 = global.items[irandom(array_length(global.items) - 1)];
show_debug_message(global.item1)


global.item2 = global.items[irandom(array_length(global.items) - 1)];
show_debug_message(global.item2)
//array_delete(global.items, array_index_of(global.items, global.item2), 1);

global.item3 = global.items[irandom(array_length(global.items) - 1)];
show_debug_message(global.item3)
//array_delete(global.items, array_index_of(global.items, global.item3), 1);

// Display the results
show_debug_message("Item 1: " + global.item1.key + " | Value: " + global.item1.value);
show_debug_message("Item 2: " + global.item2.key + " | Value: " + global.item2.value);
show_debug_message("Item 3: " + global.item3.key + " | Value: " + global.item3.value);

// Generate on map
if (!ds_list_empty(global.floor_tiles)) {
    // Get random indices from the list
    var random_index1 = irandom(ds_list_size(global.floor_tiles) - 1);
    var random_index2 = irandom(ds_list_size(global.floor_tiles) - 1);
    var random_index3 = irandom(ds_list_size(global.floor_tiles) - 1);
    var pos_item1 = global.floor_tiles[| random_index1]; // Get the [x, y] position
    var pos_item2 = global.floor_tiles[| random_index2];
    var pos_item3 = global.floor_tiles[| random_index3];

    // Use the selected position for the item1
    global.item1_x = pos_item1[0];
    global.item1_y = pos_item1[1];
    var _object_to_create1 = ds_map_find_value(global.item_object_map, global.item1.key);
    instance_create_layer(global.item1_x, global.item1_y, "Instances", _object_to_create1);

    // Use the selected position for the item2
    global.item2_x = pos_item2[0];
    global.item2_y = pos_item2[1];
    var _object_to_create2 = ds_map_find_value(global.item_object_map, global.item2.key);
    instance_create_layer(global.item2_x, global.item2_y, "Instances", _object_to_create2);

    // Use the selected position for the item3
    global.item3_x = pos_item3[0];
    global.item3_y = pos_item3[1];
    var _object_to_create3 = ds_map_find_value(global.item_object_map, global.item3.key);
	instance_create_layer(global.item3_x, global.item3_y, "Instances", _object_to_create3);

} else {
    show_debug_message("Error: No valid floor tiles available for item placement!");
}

