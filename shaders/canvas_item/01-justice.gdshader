shader_type canvas_item;

#include "res://shaders/tarot-includes/01-justice.gdshaderinc"

void vertex() {}

void fragment() {
	COLOR.rgb = tarot_draw(UV);
	COLOR.a = 1.0;
}