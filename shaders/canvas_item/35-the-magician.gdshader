shader_type canvas_item;

#include "res://shaders/utils/utils.gdshaderinc"
#include "res://shaders/tarot-includes/35-the-magician.gdshaderinc"

uniform vec2 u_size; // size of the quad mesh

void fragment() {
	vec2 rUV = ratio(UV, u_size);
	COLOR.rgb = tarot_draw(rUV);
	COLOR.a = 1.0;
}