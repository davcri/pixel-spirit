#include "res://shaders/utils/utils.gdshaderinc"

vec3 myImpl(vec2 uv, vec3 col) {
	float ow = .08; // outline width
	float rsize = .4; // rhomboid size

	vec2 st = rotate(uv + vec2(0., .25), radians(45.0));
	col += flip(
		fill(rectSDF(st, vec2(0.5)), rsize),
		fill(rectSDF(st, vec2(0.5)), rsize - ow)
	);

	st = rotate(uv + vec2(0.16, 0.07), radians(45.));
	rsize = 0.45;
	vec2 rrsize = vec2(0.9, 0.5);
	col += flip(
		fill(rectSDF(st, rrsize), rsize),
		fill(rectSDF(st, rrsize), rsize - ow * rrsize.x)
	);

	st = rotate(uv + vec2(-0.16, 0.07), radians(45.));
	rsize =0.45;
	col += flip(
		fill(rectSDF(st, vec2(0.5)), rsize),
		fill(rectSDF(st, vec2(0.5)), rsize - ow)
	);

	return col;
}

vec3 psImpl(vec2 uv, vec3 col) {
	vec2 st = rotate(uv, radians(45.));
	float r1 = rectSDF(st, vec2(1.));
	float r2 = rectSDF(st + 0.15, vec2(1.));

	col += stroke(r1, .5, .05);
	col *= step(.325, r2);
	col += stroke(r2, .325, .05) * fill(r1, .525);
	col += stroke(r2, .2, .05);

	return col;
}

vec3 tarot_draw(vec2 uv) {
	vec3 col = vec3(0.);
	//col = myImpl(uv, col);
	col = psImpl(uv, col);
	return clamp(col, 0.0, 1.0);
}

