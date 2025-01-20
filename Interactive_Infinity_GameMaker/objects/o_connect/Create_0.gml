// use send_gpt (questions) 
// testing


var AI_agent_creation_prompt = "You’re designing a real human, doorkeeper character for a video game level set in basement beneath an abandoned building. They need the players to interact with all object to open the door and can choose their hostility based on its personality. Scattered in the basement are personal objects that tell hidden stories. The character should remember its personality to continue it's conversation with the user. Below are things that the character should have:" + 
"Character Name - one word" + 
"Personality Traits - Two defining traits" + 
"Hostility level to the player - choose hostile, neutral, or friendly" + 
"Current Trust Level - low, medium, or high" + 
"Backstory - A rich story explaining how they came to be in the basement" +
"Objects (Description for three seemingly mundane objects that carry deep emotional significance or clues tied to the character's backstory)" + 
"1. [object 1]"+
"2. [object 2]"+
"3. [object 3]"+
"Generate [include information directly after : ]"+
"Character Name:"+
"Personality Traits:"+
"Hostility:"+
"Current trust level:"+
"Backstory:"+
"Objects description:"

//question? how to create memory storage

send_gpt("AI_agent_creation_prompt")