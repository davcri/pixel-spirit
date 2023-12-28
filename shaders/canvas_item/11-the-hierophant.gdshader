shader_type canvas_item;

#include "res://shaders/utils/utils.gdshaderinc"
#include "res://shaders/tarot-includes/11-the-hierophant.gdshaderinc"

uniform float line_width: hint_range(0.0, 1.0, 0.01) = 0.02;
uniform vec2 u_size; // size of the quad mesh

void fragment() {
	vec2 rUV = ratio(UV, u_size);
	COLOR.rgb = tarot_draw(rUV, line_width);
	COLOR.a = 1.0;
}