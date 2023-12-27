#include "res://shaders/utils/utils.gdshaderinc"

vec3 tarot_draw(vec2 uv, float line_width, float r) {
	vec3 col = vec3(0.0);
	float s = 0.1;
	vec2 ofstUv = uv - vec2(s);

	col += step(1.0 - r, 1.0 - circleSDF(uv));
	col -= step(1.0 - r, 1.0 - circleSDF(ofstUv));

	return col;
}