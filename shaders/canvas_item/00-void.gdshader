shader_type canvas_item;

#include "res://shaders/tarot-includes/00-void.gdshaderinc"

void vertex() {}

void fragment() {
	COLOR.rgb = tarot_draw(UV);
	COLOR.a = 1.0;
}

