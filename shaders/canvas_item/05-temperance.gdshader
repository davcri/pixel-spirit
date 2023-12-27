shader_type canvas_item;

#include "res://shaders/utils/utils.gdshaderinc"
#include "res://shaders/tarot-includes/05-temperance.gdshaderinc"

uniform float line_width: hint_range(0.0, 1.0, 0.01) = 0.1;
uniform float wave_frequency: hint_range(0.0, 20.0, 0.05) = 1.0;
uniform float wave_amplitude: hint_range(0.0, 2.0, 0.01) = 0.1;
uniform float wave_offset: hint_range(0.0, 10.0, 0.01) = 0.0;

void vertex() {}

void fragment() {
	vec2 rUV = ratio(UV, vec2(9, 16));
	COLOR.rgb = tarot_draw(rUV, line_width, wave_amplitude, wave_frequency, wave_offset);
	COLOR.a = 1.0;
}