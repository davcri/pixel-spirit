#include "res://shaders/utils/utils.gdshaderinc"

vec3 myImpl(vec2 uv, vec3 col) {
	float ow = .08; // outline width
	float rsize = .8; // rhomboid size

	vec2 st = rotate(uv, radians(45.0));
	col += stroke(rectSDF(st, vec2(0.5)), rsize, ow);
	col -= fill(rectSDF(st + vec2(0.1, .1), vec2(.2, .2)), 1.4);

	col = clamp(col, vec3(0.), vec3(1.));

	col += stroke(rectSDF(st + vec2(.17), vec2(.5)), rsize, ow) * (step(uv.y, .8) * step(.38, uv.y));
	col += stroke(rectSDF(st + vec2(.12), vec2(.5)), rsize * .45, ow);

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

