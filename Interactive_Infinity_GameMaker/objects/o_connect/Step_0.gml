// Step Event of the same object:
if (timer_active) {
    my_timer = my_timer - 1; // Decrease the timer by 1 every step
	show_debug_message(my_timer)
    if (my_timer <= 0) {
        // Time's up, put your code here
        show_debug_message("Timer finished!");
        timer_active = false; // Stop the timer
		// time taken: 56 (use 100 for safe guess) 
		send_gpt(_system,"what is your name?")
    }
}