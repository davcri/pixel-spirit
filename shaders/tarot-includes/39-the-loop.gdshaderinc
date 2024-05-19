#include "res://shaders/utils/utils.gdshaderinc"

vec3 myImpl(vec2 uv, vec3 col) {
	return col;
}

vec3 psImpl(vec2 uv, vec3 col) {
	float inv = step(.5, uv.y);
	uv = rotate(uv, radians(-45.)) - .2;
	uv = mix(uv, .6 -uv, step(.5, inv));
	for (int i = 0; i < 5; i++) {
		float r = rectSDF(uv, vec2(1.));
		float s = .25;
		s -= abs(float(i) * .1 - .2);
		col = bridge(col, r, s, .05);
		uv += .1;
	}
	return col;
}

vec3 tarot_draw(vec2 uv) {
	vec3 col = vec3(0.);
	//col = myImpl(uv, col);
	col = psImpl(uv, col);
	return clamp(col, 0.0, 1.0);
}
