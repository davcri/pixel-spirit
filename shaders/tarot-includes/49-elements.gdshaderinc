#include "res://shaders/utils/utils.gdshaderinc"

vec3 myImpl(vec2 uv, vec3 col) {
	return col;
}

vec3 psImpl(vec2 uv, vec3 col) {
	col += stroke(circleSDF(uv), .8, .08);
	col += fill(circleSDF(uv + vec2(0., -.1)), .27);
	col += fill(circleSDF(uv + vec2(.1, 0.1)), .27);
	col += fill(circleSDF(uv + vec2(-.1, 0.1)), .27);
	col = clamp(col, .0, 1.);
	uv.y = 1. - uv.y;
	col -= fill(triangleSDF(uv + vec2(0., -.04)), .125);
	return col;
}

vec3 tarot_draw(vec2 uv) {
	vec3 col = vec3(0.);
	//col = myImpl(uv, col);
	col = psImpl(uv, col);
	return clamp(col, 0.0, 1.0);
}
