#include "res://shaders/utils/utils.gdshaderinc"

vec3 myImpl(vec2 uv, vec3 col) {
	col += fill(raysSDF(rotate(uv, degrees(12.)), 8), .2);
	col += fill(starSDF(uv.yx, 6, .1), .6);
	col *= flip(
		stroke(starSDF(uv.yx, 6, 0.1), .5, .1),
		1.
	);
	col *= flip(
		stroke(starSDF(uv.yx, 6, 0.1), .65, .1),
		1.
	);
	col *= flip(
		stroke(starSDF(uv, 6, .1), .2, .1),
		1.
	);
	return col;
}

vec3 psImpl(vec2 uv, vec3 col) {
	return col;
}

vec3 tarot_draw(vec2 uv) {
	vec3 col = vec3(0.);
	col = myImpl(uv, col);
	//col = psImpl(uv, col);
	return clamp(col, 0.0, 1.0);
}
