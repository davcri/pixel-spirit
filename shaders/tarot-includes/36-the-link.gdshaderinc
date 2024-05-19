#include "res://shaders/utils/utils.gdshaderinc"

vec3 myImpl(vec2 uv, vec3 col) {
	//uv.x = flip(uv.y, step(.5, uv.y));
	// sdf
	float topRect = stroke(polySDF(rotate(uv - vec2(.0, .1), radians(45)), 4), .3, .07);
	float botRect = stroke(polySDF(rotate(uv + vec2(.0, .1), radians(45)), 4), .3, .07);

	//col += botRect;
	col += step(.5, uv.x) * botRect;
	col += istep(.5, uv.x) * topRect;

	col = bridge(col, topRect + botRect, .3, .07);

	// top and bottom rhomb decorations
	//col += fill(rhombSDF(uv + vec2(0., 0.6)), .12);
	//col += fill(rhombSDF(uv - vec2(0., 0.6)), .12);
	return col;
}

vec3 psImpl(vec2 uv, vec3 col) {
	uv = uv.yx;
	uv.x = mix(1. - uv.x, uv.x, step(.5, uv.y));

	vec2 o = vec2(.1, .0); // offset
	vec2 s = vec2(1.); // size
	float a = radians(45.); // angle
	float l = rectSDF(rotate(uv + o, a), s); // left
	float r = rectSDF(rotate(uv - o, -a), s); // right
	col += stroke(l, .3, .1);
	col = bridge(col, r, .3, .1);

	uv = uv.yx;
	col += fill(rhombSDF(abs(uv - vec2(.0, .5))), .1);

	return col;
}

vec3 tarot_draw(vec2 uv) {
	vec3 col = vec3(0.);
	//col = myImpl(uv, col);
	col = psImpl(uv, col);
	return clamp(col, 0.0, 1.0);
}
