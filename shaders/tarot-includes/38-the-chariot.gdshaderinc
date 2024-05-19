#include "res://shaders/utils/utils.gdshaderinc"

vec3 myImpl(vec2 uv, vec3 col) {
	return col;
}

vec3 psImpl(vec2 uv, vec3 col) {
	float r1 = rectSDF(uv, vec2(1.));
	float r2 = rectSDF(rotate(uv, radians(45.)), vec2(1.));
	float inv = step(.5, (uv.x + uv.y) * .5);
	inv = flip(inv, step(.5, .5 + (uv.x - uv.y) * .5));
	float w = .075;
	col += stroke(r1, .5, w) + stroke(r2, .5, w);
	float bridges = mix(r1, r2, inv);
	col = bridge(col, bridges, .5, w);
	return col;
}

vec3 tarot_draw(vec2 uv) {
	vec3 col = vec3(0.);
	//col = myImpl(uv, col);
	col = psImpl(uv, col);
	return clamp(col, 0.0, 1.0);
}
