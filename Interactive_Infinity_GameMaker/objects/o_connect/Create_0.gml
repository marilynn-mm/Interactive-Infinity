show_debug_message("connect!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");

// sending API requests 

// traits of AI, can be accessed/modified everywhere

global.Character_Name = "Undefined";
global.Personality_Trait = "Undefined";
global.Hostility = "Undefined";
global.Current_Trust_Level = "Undefinedd";
global.Backstory = "Undefined";
global.Object1_Description = "Undefined";
global.Object2_Description = "Undefined";
global.Object3_Description = "Undefined";

var character_traits = 
    "Name: " + global.Character_Name +
    "Personality Trait: " + global.Personality_Trait +
    "Hostility: " + global.Hostility +
    "Trust Level: " + global.Current_Trust_Level +
    "Backstory: " + global.Backstory +
    "Object1 Description: " + global.Object1_Description + 
	"Object2 Description: " + global.Object1_Description + 
	"Object3 Description: " + global.Object1_Description;

// this is the system for the chatgpt API (what will stay consistent) 

_system = "You are a human doorkeeper character for a video game level set in a basement beneath an abandoned building."+
"Your role involves interacting with players, deciding your hostility based on your personality, and revealing personal stories through objects." + 

"Traits you should maintain or generate if undefined:"+
character_traits + 

"If any attributes are 'Undefined', generate them based on the context";

// creating AI agent with characteristcs 


var creation_prompt = "Generate character details: Name (one word), Personality (two traits), Hostility (hostile, neutral, or friendly)\n, Trust Level (low, medium, or high)," + 
					"Backstory (why they are in the basement), and how the following three objects tie into their story." + 
					"Objects include" + 
                      "Output format:" +
                      "Name:" +
                      "Personality:" +
                      "Hostility:" +
                      "Trust Level:" +
                      "Backstory:" +
                      "Object1 Description:" + 
					  "Object2 Description:" + 
					  "Object3 Description:";
					  
send_gpt(_system,creation_prompt)

// time taken: 120 (use 150 or 200 for safe guess) 

// Create Event of an object:
my_timer = 300; // This is the countdown time in steps
timer_active = true; // Controls whether the timer is running

show_debug_message("Timer Active: " + string(timer_active) + " | Timer Value: " + string(my_timer));

global.first_request = true; // keep track of when request is generating agent or being the agent
global.awaiting_response = false;  // Flag to track waiting state
waiting_timer = 0;          // Timer to track delay
waiting_max_time = 600;     // Timeout threshold (adjust as needed)