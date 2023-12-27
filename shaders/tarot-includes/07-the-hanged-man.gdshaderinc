#include "res://shaders/utils/utils.gdshaderinc"

vec3 tarot_draw(vec2 uv, float line_width) {
	vec3 col = vec3(0.0);
	float sdf = 0.5 + (uv.x - uv.y) * 0.5;
	col += stroke(0.5, sdf, line_width);
	col += stroke(0.5, (uv.x + uv.y) * 0.5, line_width);
	return col;
}