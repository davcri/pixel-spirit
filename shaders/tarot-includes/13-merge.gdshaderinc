#include "res://shaders/utils/utils.gdshaderinc"

vec3 myImpl(vec2 uv, vec3 col) {
	vec2 ofst = vec2(0.15, 0.0);
	float circleRight = fill(circleSDF(uv - ofst), 0.5);
	float circleLeft = stroke(circleSDF(uv + ofst), 0.5, 0.05);
	col += flip(circleLeft, circleRight);
	return col;
}

vec3 tarot_draw(vec2 uv) {
	vec3 col = vec3(.0);	
	col = myImpl(uv, col);
	return clamp(col, 0.0, 1.0);
}

