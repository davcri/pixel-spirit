#include "res://shaders/utils/utils.gdshaderinc"

vec3 myImpl(vec2 uv, vec3 col) {
	vec2 starUv = rotate(uv, radians(18.));
	col += stroke(starSDF(starUv, 5, .82), .6, .12);
	col += stroke(circleSDF(uv), .8, .06);
	col *= flip(stroke(starSDF(starUv, 5, .82), .75, .2), 1.);
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

