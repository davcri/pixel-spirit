shader_type canvas_item;

#include "res://shaders/utils/utils.gdshaderinc"
#include "res://shaders/tarot-includes/09-the-moon.gdshaderinc"

uniform float line_width: hint_range(0.0, 1.0, 0.01) = 0.02;
uniform float radius: hint_range(0.0, 1.0, 0.01) = 0.5;
uniform vec2 u_size; // size of the quad mesh

void fragment() {
	vec2 rUV = ratio(UV, u_size);
	COLOR.rgb = tarot_draw(rUV, line_width, radius);
	COLOR.a = 1.0;
}