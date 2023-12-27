#include "res://shaders/utils/utils.gdshaderinc"

vec3 tarot_draw(vec2 uv, float line_width, float r) {
	vec3 col = vec3(0.0);
	col += stroke(r, circleSDF(uv), line_width);
	return col;
}