#include "res://shaders/utils/utils.gdshaderinc"

vec3 myImpl(vec2 uv, vec3 col) {
	col += 1. - step(.5, uv.y);
	// rays
	float rays = fill(raysSDF(uv, 28), .2);
	col += step(.5, uv.y) * (rays);
	col *= mix((1. - rays), 1., step(.5, uv.y));
	// inner white square
	col += fill(rectSDF(uv, vec2(1.)), .2);
	// inner square black outline
	col *= flip(
		stroke(rectSDF(uv, vec2(.2)), 1., .3),
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
