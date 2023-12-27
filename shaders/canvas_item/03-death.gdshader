shader_type canvas_item;

#include "res://shaders/utils/utils.gdshaderinc"
#include "res://shaders/tarot-includes/03-death.gdshaderinc"

void vertex() {}

void fragment() {
	vec2 rUV = ratio(UV, vec2(9, 16));
	COLOR.rgb = tarot_draw(rUV);
	COLOR.a = 1.0;
}