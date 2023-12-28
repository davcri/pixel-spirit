#include "res://shaders/utils/utils.gdshaderinc"

vec3 tarot_draw(vec2 uv, float line_width) {
	vec3 col = vec3(.0);

	float rect = rectSDF(uv, vec2(1., 1.));
	col += stroke(rect, 0.5, line_width);
	col += fill(rect, 0.1);

	return clamp(col, 0.0, 1.0);
}