// Timer countdown
if (!timer) timer = 300;
timer -= 1;

// Define message based on timer
var message = "";
if (timer > 200) {
    message = "INTERACTIVE INFINITY";
} else if (timer > 100) {
    message = "Arrows - Move\nTap - New Char & Room\nSpace - Continue Dialogue\nType - Direction for Turn\nEnter - Send Message\nWalk Away - Exit Dialogue";
} else if (timer > 50) {
    message = "Enjoy the Game!";
}

// Delete object after countdown ends
if (timer <= 0) {
    instance_destroy();
}


