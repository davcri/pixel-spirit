#include "res://shaders/utils/utils.gdshaderinc"

vec3 tarot_draw(vec2 uv, float line_width, float wave_amplitude, float wave_frequency, float wave_offset) {
	vec3 col = vec3(0.0);

	float wave = uv.x + wave_amplitude * sin(uv.y * 2.0 * PI * wave_frequency + wave_offset);
	col += vec3(1.0) * stroke(wave, 0.2, line_width);
	col += vec3(1.0) * stroke(wave, 0.5, line_width);
	col += vec3(1.0) * stroke(wave, 0.8, line_width);

	return col;
}