// Inherit the parent event
global.dialogue = new Dialogue();
show_debug_message("-----Dialogue system initialized.-----");

event_inherited();


//TODO Add AI here
global.dialogue.add(s_AI_agent, "This is a test of the dialogue system")
//global.dialogue.add(s_AI_agent, "Hello");

//response = chat_gpt("you are a npc with the following attributes" + ai_agent_attributes + "talking to a character with the following attributes" + main_character_attributes + "generate three frames of dialogue from the followiung conversation summary and history. Make sure each frame of diaoligue is no longer than a sentence and seperate each frame using a newline." + summary + history"
//dialogue.add(s_AI_agent, )


