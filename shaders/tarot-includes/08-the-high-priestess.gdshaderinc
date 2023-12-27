#include "res://shaders/utils/utils.gdshaderinc"

vec3 tarot_draw(vec2 uv, float line_width, float r) {
	vec2 c = vec2(0.5, 0.5); // center

	float d = distance(uv, c);
	float d_outer = step(r - line_width * 0.5, d);
	float d_inner = step(r + line_width * 0.5, d);

	return vec3(1.0) * (d_outer - d_inner);
}