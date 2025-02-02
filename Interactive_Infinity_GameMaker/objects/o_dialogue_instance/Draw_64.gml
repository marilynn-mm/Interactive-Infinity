if (global.showing_dialogue) {
    var text_x = 30;
    var text_y = 20; // Shift text down for better alignment
    var height = 32;
    var border = 5;
    var padding = 20; // More padding for larger text
    var min_height = 300; // Increase minimum height for bigger text

    // Set a larger font
    draw_set_font(byteBounce); // Ensure you have a defined larger font

    // Adjust text height
	height = string_height(current_dialogue.message) + padding * 2;

    // Compare text height with sprite height
    if (sprite_get_height(current_dialogue.sprite) > height) {
        height = sprite_get_height(current_dialogue.sprite) + padding;
    }

    // Ensure a minimum height
    if (height < min_height) {
        height = min_height;
    }

    // Adjust text_x to accommodate sprite
    text_x = sprite_get_width(current_dialogue.sprite) + (padding * 2);

    // Draw box background
    draw_set_alpha(alpha);
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_gui_width(), height, false);

    draw_set_color(c_white);
    draw_rectangle(border, border, display_get_gui_width() - border, height - border, false);

    draw_set_color(c_black);
    draw_rectangle((border * 2), (border * 2), display_get_gui_width() - (border * 2), height - (border * 2), false);

    // Draw sprite
    if (current_dialogue.sprite != -1) {
        draw_sprite(current_dialogue.sprite, 0, border * 3, border * 3);
    }

    // Draw text with bigger size and better spacing
    draw_set_color(c_white);
    draw_text_ext(text_x, text_y, current_dialogue.message, 60, display_get_gui_width() - 192); // Increase spacing for readability

    // Smooth fade-in effect
    alpha = lerp(alpha, 1, 0.06);
}
