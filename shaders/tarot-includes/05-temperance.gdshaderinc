#include "res://shaders/utils/utils.gdshaderinc"

vec3 tarot_draw(vec2 uv, float line_width, float wave_amplitude, float wave_frequency, float wave_offset) {
	vec3 col = vec3(0.0);

	float wave = wave_amplitude * sin(uv.y * 2.0 * PI * wave_frequency + wave_offset);

	col += vec3(1.0) * stroke(uv.x, 0.2 + wave, line_width);
	col += vec3(1.0) * stroke(uv.x, 0.5 + wave, line_width);
	col += vec3(1.0) * stroke(uv.x, 0.8 + wave, line_width);

	return col;
}