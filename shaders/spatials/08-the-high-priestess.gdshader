shader_type spatial;

#include "res://shaders/utils/utils.gdshaderinc"
#include "res://shaders/tarot-includes/08-the-high-priestess.gdshaderinc"

uniform float line_width: hint_range(0.0, 1.0, 0.01) = 0.02;
uniform float radius: hint_range(0.0, 1.0, 0.01) = 0.5;
uniform vec2 u_size; // size of the quad mesh

void vertex() {}

void fragment() {
	vec2 fUV = vec2(UV.x, 1.0 - UV.y);
	vec2 rUV = ratio(fUV, u_size);
	ALBEDO.rgb = tarot_draw(rUV, line_width, radius);
}