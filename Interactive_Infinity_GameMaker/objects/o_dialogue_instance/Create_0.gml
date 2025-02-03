// Inherit the parent event
event_inherited();

// Initializes current_dialogue as an empty struct {}.
// will hold the currently displayed dialogue entry (which consists of a sprite and a message)
// later be set to a struct when calling dialogue.pop().


global.dialogueDynamic = new Dialogue();
show_debug_message("-----Dynamic Dialogue system initialized.-----");

// Track dialogue flow
first_dialogue = true;
global.showing_dialogue = false;
global.user_turn = false;  // Start with the main character
global.ai_turn = true;  
global.waiting_for_response = true;  // True when waiting for ChatGPT's API

// global.output_text as filtered AI agent text -- after redesign prompt 

//TODO Add AI here
global.dialogueDynamic.add(s_AI_agent, "This is a test of the dialogue system")
//global.dialogue.add(s_AI_agent, "Hello");



