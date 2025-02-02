show_debug_message("o-connect!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");

// time taken: 120 (use 150 or 200 for safe guess) 

// Create Event of an object:
my_timer = 300; // This is the countdown time in steps
timer_active = true; // Controls whether the timer is running

show_debug_message("Timer Active: " + string(timer_active) + " | Timer Value: " + string(my_timer));

global.first_request = true; // keep track of when request is generating agent or being the agent
global.awaiting_response = false;  // Flag to track waiting state

//waiting_timer = 0;          // Timer to track delay
//waiting_max_time = 600;     // Timeout threshold (adjust as needed)