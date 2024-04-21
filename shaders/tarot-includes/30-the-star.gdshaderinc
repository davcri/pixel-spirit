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
	col += stroke(raysSDF(uv, 8), .5, .15);
	float inner = starSDF(uv.xy, 6, .09);
	float outer = starSDF(uv.yx, 6, .09);
	col *= step(.7, outer);
	col += fill(outer, .5);
	col -= stroke(inner, .25, .06);
	col += stroke(outer, .6, .05);
	return col;
}

vec3 tarot_draw(vec2 uv) {
	vec3 col = vec3(0.);
	//col = myImpl(uv, col);
	col = psImpl(uv, col);
	return clamp(col, 0.0, 1.0);
}
