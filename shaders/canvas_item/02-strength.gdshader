shader_type canvas_item;
#include "res://shaders/tarot-includes/02-strength.gdshaderinc"

void vertex() {}

float pwave(float x) {
	return (1.0 + cos(x)) * 0.5;
}

void fragment() {
	COLOR.rgb = tarot_draw(UV);
	COLOR.a = 1.0;
}