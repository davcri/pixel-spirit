#include "res://shaders/utils/utils.gdshaderinc"

vec3 myImpl(vec2 uv, vec3 col) {
	vec2 ouv = uv; // save original uv
	uv = rotate(uv + vec2(0.05, 0.), radians(45.));
	float rect = fill(rectSDF(uv, vec2(1.)), .3);
	col += rect;
	col -= fill(rectSDF(uv + vec2(-.07, .0), vec2(.28, .16)), 1.0);
	col = clamp(col, vec3(0.), vec3(1.));
	float fig1 = col.r;

	//
	uv = rotate(ouv + vec2(-0.11, -0.0), radians(45.));
	rect = fill(rectSDF(uv, vec2(1.)), .3);
	col += rect;
	col -= (1. - fig1) * fill(rectSDF(uv + vec2(.07, .0), vec2(.28, .16)), 1.0);
	col = clamp(col, vec3(0.), vec3(1.));

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
