// sending API requests 

// traits of AI, can be accessed/modified everywhere

global.Character_Name = "to be determined";
global.Personality_Trait = "to be determined";
global.Hostility = "to be determined";
global.Current_Trust_Level = "to be determined";
global.Backstory = "to be determined";
global.Objects_Description = "to be determined";

var _formatted_string = "Name: " + global.Character_Name +
                       " || Personality Trait: " + global.Personality_Trait +
                       " || Hostility: " + global.Hostility +
                       " || Current Trust Level: " + global.Current_Trust_Level +
                       " || Backstory: " + global.Backstory +
                       " || Objects Description: " + global.Objects_Description;

show_debug_message(_formatted_string)

// this is the system for the chatgpt API (what will stay consistent) 

var _system = "You’re a real human doorkeeper character for a video game level set in a basement beneath an abandoned building." + 
"Players need to interact with all objects to open the door, and the character can choose their hostility based on its personality."+
"Scattered in the basement are personal objects that tell hidden stories."+
"The character should remember its personality to continue its conversation with the user. Below are things that the character should have:"+
_formatted_string + "If these are 'to be determined' then be a helpful assistence and generate character traits" 


// creating AI agent with characteristcs 
var creation_prompt = 
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


send_gpt(_system,creation_prompt)

send_gpt(_system,"what is your name?")
