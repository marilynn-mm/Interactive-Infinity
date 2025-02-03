global.input_text = "";  // Stores user input
max_length = 150;  // Maximum characters allowed

show_debug_message("o-connect!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");

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
global.Intro_Line = "Undefined";


creation_prompt = "Generate character details: Name (one word), Personality (two traits), Hostility (hostile, neutral, or friendly), Trust Level (low, medium, or high)," + 
					"Backstory (why they are in the basement), how the following three objects tie into their story, and their special introduction line" + 
					"Objects include" + 
                      "Output format:" +
                      "Name:" +
                      "Personality:" +
                      "Hostility:" +
                      "Trust Level:" +
                      "Backstory:" +
                      string(global.item1.value) + " Object1 Description:" + 
					  string(global.item2.value) + " Object2 Description:" + 
					  string(global.item3.value) + " Object3 Description:" + 
					  "Introduction Line:";

// time taken: 120 (use 150 or 200 for safe guess) 
