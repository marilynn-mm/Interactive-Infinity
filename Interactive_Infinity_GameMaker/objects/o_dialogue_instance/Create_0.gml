// Inherit the parent event
event_inherited();


//TODO Add AI here
dialogue.add(s_AI_agent, "Hello");
dialogue.add(s_AI_agent, "This is a test of the dialogue system")


main_character_attributes = o_main_char.attributes;
ai_agent_attributes = o_AI_agent.attributes;
conversation_summary = ""

//response = chat_gpt("you are a npc with the following attributes" + ai_agent_attributes + "talking to a character with the following attributes" + main_character_attributes + "generate three frames of dialogue from the followiung conversation summary and history. Make sure each frame of diaoligue is no longer than a sentence and seperate each frame using a newline." + summary + history"
//dialogue.add(s_AI_agent, )


