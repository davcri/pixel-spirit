shader_type spatial;

#include "res://shaders/utils/utils.gdshaderinc"
#include "res://shaders/tarot-includes/10-the-emperor.gdshaderinc"

uniform float line_width: hint_range(0.0, 1.0, 0.01) = 0.02;
uniform vec2 u_size; // size of the quad mesh

void fragment() {
	vec2 fUV = vec2(UV.x, 1.0 - UV.y);
	vec2 rUV = ratio(fUV, u_size);
	ALBEDO.rgb = tarot_draw(rUV, line_width);
}