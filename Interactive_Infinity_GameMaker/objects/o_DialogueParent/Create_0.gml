// Key tos next
key_next = vk_space;

// A boolean flag to track whether dialogue is currently being displaye
showing_dialogue = false;

// Initializes current_dialogue as an empty struct {}.
// will hold the currently displayed dialogue entry (which consists of a sprite and a message)
// later be set to a struct when calling dialogue.pop().
current_dialogue= {};

// alpha is often associated with transparency, used to smoothly transition 
alpha = 0;
