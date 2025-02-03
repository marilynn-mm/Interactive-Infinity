// Clear screen (optional if you're drawing over a background)
// draw_clear(c_black);

// Set text alignment to center
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// When the timer is between 200s and 100s, draw these:
if (timer > 150) {
    // Draw "Interactive Infinity" with a large font
    draw_set_font(pixelGame);
    draw_set_color(c_black);
    draw_text(display_get_gui_width() / 2, display_get_gui_height() / 2 - 40, "Interactive Infinity");

    // Draw instructions with a different font, slightly below
    draw_set_font(byteBounce);
    draw_set_color(c_black);
    draw_text(display_get_gui_width() / 2, display_get_gui_height() / 2 + 200, "Arrows - Move || Tap - New Character & Room || Space - Continue Dialogue || \nEnter - Send Message || Walk Away - Exit Dialogue");

    // Draw "by Marilyn Ma" with a different font, at the bottom
    draw_set_font(byteBounce);
    draw_set_color(c_black);
    draw_text(display_get_gui_width() / 2, display_get_gui_height() / 2 + 800, "by Marilyn Ma");
}

// When the timer reaches 100s or less, show "Items Generating For..."
if (timer <= 150) {
    draw_set_font(pixelGame);
    draw_set_color(c_black);
    draw_text(display_get_gui_width() / 2, display_get_gui_height() / 2, "Items Generating...");
}








