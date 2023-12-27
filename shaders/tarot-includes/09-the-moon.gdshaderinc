#include "res://shaders/utils/utils.gdshaderinc"

vec3 tarot_draw(vec2 uv, float line_width, float r) {
	vec3 col = vec3(0.0);

	col += fill(circleSDF(uv), r);
	vec2 offset = vec2(0.1, 0.05);
	col -= fill(circleSDF(uv - offset), r - 0.1);

	return clamp(col, 0.0, 1.0);
}