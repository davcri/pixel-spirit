shader_type canvas_item;

#include "res://shaders/utils/utils.gdshaderinc"
#include "res://shaders/tarot-includes/03-death.gdshaderinc"

uniform vec2 u_size;

void vertex() {}

void fragment() {
	vec2 rUV = ratio(UV, u_size);
	COLOR.rgb = tarot_draw(rUV);
	COLOR.a = 1.0;
}