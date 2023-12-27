#include "res://shaders/utils/utils.gdshaderinc"

vec3 tarot_draw(vec2 uv, float thickness) {
	float d = abs(uv.x - 0.5);
	vec3 color = vec3(0.0);
	color += stroke(uv.x, 0.5, thickness);
	return color;
}