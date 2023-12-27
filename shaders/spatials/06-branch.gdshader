shader_type spatial;

#include "res://shaders/utils/utils.gdshaderinc"
#include "res://shaders/tarot-includes/06-branch.gdshaderinc"

uniform float line_width: hint_range(0.0, 1.0, 0.01) = 0.1;
uniform float wave_frequency: hint_range(0.0, 20.0, 0.05) = 1.0;
uniform float wave_amplitude: hint_range(0.0, 2.0, 0.01) = 0.1;
uniform float wave_offset: hint_range(0.0, 10.0, 0.01) = 0.0;

void vertex() {}

void fragment() {
	vec2 fUV = vec2(UV.x, 1.0 - UV.y);
	vec2 rUV = ratio(fUV, vec2(9, 16));
	ALBEDO.rgb = tarot_draw(rUV, line_width);
}