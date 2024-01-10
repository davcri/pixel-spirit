#include "res://shaders/utils/utils.gdshaderinc"
vec3 myImpl(vec2 uv, vec3 col) {
	float line = step(0.5 * (uv.x + uv.y), 0.5);	
	vec2 ofst = vec2(0.1, 0.0);
	float right = step(0.50, uv.x);
	float left = step(0.5, 1.0 - uv.x);
	float c = step(circleSDF(uv - ofst), 0.5) * left;
	c += step(circleSDF(uv + ofst), 0.5) * right;
	col += vec3(line);
	col += c * flip(line, 1.0);
	col -= c * flip(1.0 - line, 1.0);
	return col;
}
	
vec3 tarot_draw(vec2 uv) {
	vec3 col = vec3(0.);
	col = myImpl(uv, col);
	return clamp(col, 0.0, 1.0);
}

